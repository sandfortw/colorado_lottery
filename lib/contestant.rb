class Contestant
  attr_reader :game_interests
  
  def initialize(details)
    @details = details
    @game_interests = []
  end

  def full_name
    "#{@details[:first_name]} #{@details[:last_name]}"
  end

  def age
    @details[:age]
  end

  def state_of_residence
    @details[:state_of_residence]
  end

  def spending_money
    @details[:spending_money]
  end

  def out_of_state?
    state_of_residence != 'CO'
  end

  def add_game_interest(game)
    @game_interests << game
  end
end