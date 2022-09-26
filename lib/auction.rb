require 'pry'
class Auction
  attr_reader :items

  def initialize
    @items = []
    @attendees = []
  end

  def add_item(item)
    @items << item
  end

  def add_attendee(attendee)
    @attendees << attendee
  end

  def item_names
    names = []
    @items.each do |item|
      names << item.name
    end
    names
  end

  def unpopular_items
    unpopular = []
    @items.each do |item|
      unpopular << item if item.bids == {}
    end
    unpopular
  end

  def potential_revenue
    total = 0
    @items.each do |item|
      highest_bid = 0
      item.bids.each do |bid|

        highest_bid = bid[-1] if bid[-1] > highest_bid
      end
      total += highest_bid
    end
    total
  end
  def bidders
    names = []
    @items.each do |item|
        if item.bids != {}
            item.bids.each do |bid|
                temp_name = item.bids.keys
                    temp_name.each do | name |
                        names << name.name if ! names.include?(name.name)
                    end
            end
        end
    end
    names
  end
  def bidder_info
    #`bidder_info` should return a hash with keys that are attendees, 
    # and values that are a hash with that attendee's budget 
    # and an array of items that attendee has bid on.
    info_hash = {}
    @attendees.each do |attendee|
        if bidders.include?(attendee.name)
            temp_item = 
            @items.each do |item|
                temp_name = item.bids.keys
                temp_name.each do |name|
                    if name.name == attendee.name
                        temp_item = item
                    end
                end
            end
            info_hash[attendee] = [attendee.budget, temp_item]
        end
    end
    info_hash
  end
end
