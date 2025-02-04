require './lib/colorado_lottery'
require "./lib/contestant"
require "./lib/game"

describe ColoradoLottery do

  describe 'the lottery starting conditions' do
    before(:each) do
      @lottery = ColoradoLottery.new
    end

    it 'should start with empty hash of registered contestants' do
      expect(@lottery.registered_contestants).to eq({})
    end

    it 'should start with an empty array of winners' do
      expect(@lottery.winners).to eq([])
    end

    it 'should start with an empty hash of current contestants' do
      expect(@lottery.current_contestants).to eq({})
    end
  end

  describe 'the lottery working with contestant and game classes' do
    
    before(:each) do 
      @lottery = ColoradoLottery.new
      @pick_4 = Game.new('Pick 4', 2)
      @mega_millions = Game.new('Mega Millions', 5, true)
      @cash_5 = Game.new('Cash 5', 1)
      @alexander = Contestant.new({
        first_name: 'Alexander',
        last_name: 'Aigades',
        age: 28,
        state_of_residence: 'CO',
        spending_money: 10})
      @benjamin = Contestant.new({
        first_name: 'Benjamin',
        last_name: 'Franklin',
        age: 17,
        state_of_residence: 'PA',
        spending_money: 100})
      @frederick = Contestant.new({
        first_name:  'Frederick',
        last_name: 'Douglass',
        age: 55,
        state_of_residence: 'NY',
        spending_money: 20})
      @winston = Contestant.new({
        first_name: 'Winston',
        last_name: 'Churchill',
        age: 18,
        state_of_residence: 'CO',
        spending_money: 5})
      
      @alexander.add_game_interest('Pick 4')
      @alexander.add_game_interest('Mega Millions')
      @frederick.add_game_interest('Mega Millions')
      @winston.add_game_interest('Cash 5')
      @winston.add_game_interest('Mega Millions')
      @benjamin.add_game_interest('Mega Millions')
    end

    it 'can determine if someone is interested and 18' do
      expect(@lottery.interested_and_18?(@alexander, @pick_4)).to be true
      expect(@lottery.interested_and_18?(@benjamin, @mega_millions)).to be false
      expect(@lottery.interested_and_18?(@alexander, @cash_5)).to be false
    end

    it 'can determine someone can register' do
      expect(@lottery.can_register?(@alexander, @pick_4)).to be true
      expect( @lottery.can_register?(@alexander, @cash_5)).to be false
      expect( @lottery.can_register?(@frederick, @mega_millions)).to be true
      expect(@lottery.can_register?(@benjamin, @mega_millions)).to be false
      expect(@lottery.can_register?(@frederick, @cash_5)).to be false
    end

    it 'can register contestants if they can register' do
      @lottery.register_contestant(@alexander, @pick_4)
      expect(@lottery.registered_contestants).to eq({"Pick 4" => [@alexander]})
      @lottery.register_contestant(@alexander, @mega_millions)
      expect(@lottery.registered_contestants).to eq({"Pick 4" => [@alexander], "Mega Millions" =>[@alexander]})
      @lottery.register_contestant(@frederick, @mega_millions)
      @lottery.register_contestant(@winston, @cash_5)
      @lottery.register_contestant(@winston, @mega_millions)
      expect(@lottery.registered_contestants).to eq({"Pick 4" => [@alexander], "Mega Millions" =>[@alexander, @frederick, @winston], "Cash 5" => [@winston]})
    end

    it 'has eligible contestants' do
      @lottery.register_contestant(@alexander, @pick_4)
      @lottery.register_contestant(@alexander, @mega_millions)
      @lottery.register_contestant(@frederick, @mega_millions)
      @lottery.register_contestant(@winston, @cash_5)
      @lottery.register_contestant(@winston, @mega_millions)
      grace = Contestant.new({
        first_name: 'Grace',
        last_name: 'Hopper',
        age: 20,
        state_of_residence: 'CO',
        spending_money: 20})
        grace.add_game_interest('Mega Millions')
        grace.add_game_interest('Cash 5')
        grace.add_game_interest('Pick 4')
        lottery.register_contestant(grace, mega_millions)
        lottery.register_contestant(grace, cash_5)
        lottery.register_contestant(grace, pick_4)

        lottery.eligible_contestants(pick_4)
        lottery.eligible_contestants(cash_5)
        lottery.eligible_contestants(mega_millions)


    end
  end

end