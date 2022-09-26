require 'pry'
class Item
  attr_reader :name, :bids, :bidding_open

  def initialize(name)
    @name = name
    @bids = {}
    @bidding_open = true
  end
  def add_bid(person, bid)
    if @bidding_open == true
        @bids[person] = bid
        @bids
    end
  end
  def current_high_bid
    highest_bid = 0
    @bids.each do |attendee|
        if attendee[-1].to_i > highest_bid
            highest_bid = attendee[-1].to_i
        end
    end
    highest_bid
  end
  def close_bidding
    @bidding_open = false
  end
end
