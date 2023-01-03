class Game
  attr_reader :name, :cost

  def initialize(name, cost, national = false)
    @name = name
    @cost = cost
    @national = national
  end

  def national_drawing?
    @national
  end
end