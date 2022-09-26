require 'item'
require 'attendee'
require 'auction'
RSpec.describe Auction do
  before(:all) do
    @auction = Auction.new
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')
    @attendee1 = Attendee.new({ name: 'Megan', budget: '$50' })
    @attendee2 = Attendee.new({ name: 'Bob', budget: '$75' })
    @attendee3 = Attendee.new({ name: 'Mike', budget: '$100' })
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
    @auction.add_attendee(@attendee1)
    @auction.add_attendee(@attendee2)
    @auction.add_attendee(@attendee3)
  end
  it 'has attributes' do
    auction = Auction.new
    expect(auction.items).to eq([])
  end
  describe '#add_item' do
    it 'can add items to @items' do
      auction = Auction.new
      item1 = Item.new('Chalkware Piggy Bank')
      item2 = Item.new('Bamboo Picture Frame')
      auction.add_item(@item1)
      auction.add_item(@item2)
      expect(auction.items.length).to eq(2)
    end
  end
  describe '#item_names' do
    it 'can tell the name of each item' do
      auction = Auction.new
      item1 = Item.new('Chalkware Piggy Bank')
      item2 = Item.new('Bamboo Picture Frame')
      auction.add_item(@item1)
      auction.add_item(@item2)
      expect(auction.item_names).to eq(['Chalkware Piggy Bank', 'Bamboo Picture Frame'])
    end
  end
  describe '#unpopular_items' do
    it 'can list items without bids' do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      expect(@auction.unpopular_items).to eq([@item2, @item3, @item5])
      @item3.add_bid(@attendee2, 15)
      expect(@auction.unpopular_items).to eq([@item2, @item5])
    end
  end
  describe '#potential_revenue' do
    it 'can total the highest bids' do
      expect(@auction.potential_revenue).to eq(87)
    end
  end
  describe '#bidders' do
    it 'can list the names of bidders' do
        expect(@auction.bidders).to eq(["Bob", "Megan", "Mike"])
    end
  end
  describe '#bidder_info' do
    it 'can list a hash with bidder info' do
        expected = {@Attendee1 => [50, @item1], @attendee2 => [75, @item1, @item3], @attendee3 => [100, @item4]}
        expect(@auction.bidder_info).to eq(expected)
    end
  end
end
