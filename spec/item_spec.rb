require 'item'
require 'attendee'
require 'auction'
RSpec.describe Item do
  before(:all) do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip')
    @item4 = Item.new('2 Days Dogsitting')
    @attendee1 = Attendee.new({ name: 'Megan', budget: '$50' })
    @attendee2 = Attendee.new({ name: 'Bob', budget: '$75' })
    @attendee3 = Attendee.new({ name: 'Mike', budget: '$100' })
  end
  it 'has attributes' do
    item1 = Item.new('Chalkware Piggy Bank')
    expect(item1.name).to eq('Chalkware Piggy Bank')
  end
  describe '#add_bid' do
    it 'can add bids to the bids hash' do
      expect(@item1.bids).to eq({})
      @item1.add_bid(@attendee2, '20')
      @item1.add_bid(@attendee1, '22')
      expected = {
        @attendee2 => '20',
        @attendee1 => '22'
      }
      expect(@item1.bids).to eq(expected)
    end
  end
  describe '#current_high_bid' do
    it 'can tell the highest bid' do
      expect(@item1.current_high_bid).to eq(22)
    end
  end
  describe '#close_bidding' do
    it 'can close bidding on a item' do
      expected = {
        @attendee2 => '20',
        @attendee1 => '22'
      }
      expect(@item1.bids).to eq(expected)
      @item1.close_bidding
      @item1.add_bid(@attendee3, 70)
      expect(@item1.bids).to eq(expected)
    end
  end
end
