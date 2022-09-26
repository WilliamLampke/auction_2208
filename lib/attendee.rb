class Attendee
  attr_reader :name, :budget

  def initialize(hash)
    @name = hash[:name]
    @budget = hash[:budget].slice!(1..2).to_i
  end
end
