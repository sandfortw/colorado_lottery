class ColoradoLottery
  attr_reader :registered_contestants,
              :winners,
              :current_contestants

  def initialize
    @registered_contestants = Hash.new { |hash, key| hash[key] = [] }
    @winners = []
    @current_contestants = {}
  end

  def interested_and_18?(contestant, game)
    contestant.age > 17 && contestant.game_interests.include?(game.name)
  end

  def can_register?(contestant, game)
    interested_and_18?(contestant, game) && (contestant.out_of_state? == false || game.national_drawing? == true)
  end

  def register_contestant(contestant, game)
    if can_register?(contestant, game) 
      # require 'pry'; binding.pry
      @registered_contestants[game.name] << contestant
      # require 'pry'; binding.pry
    end
  end

  def eligible_contestants
    
  end

end