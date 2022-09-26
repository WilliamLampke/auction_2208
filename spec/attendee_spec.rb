require 'item'
require 'attendee'
RSpec.describe Attendee do
  it 'has attributes' do
    attendee = Attendee.new({ name: 'Megan', budget: '$50' })
    expect(attendee.name).to eq('Megan')
    expect(attendee.budget).to eq(50)
  end
end
