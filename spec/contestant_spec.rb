require './lib/contestant'

describe Contestant do 

  before(:each) do
    @alexander = Contestant.new(
      {
        first_name: 'Alexander',
        last_name: 'Aigiades',
        age: 28,
        state_of_residence: 'CO',
        spending_money: 10
      }
    )

    @benjamin = Contestant.new(
      {
        first_name: 'Benjamin',
        last_name: 'Franklin',
        age: 17,
        state_of_residence: 'PA',
        spending_money: 100
      }
    )
  end

  it 'has a full name' do
    expect(@alexander.full_name).to eq 'Alexander Aigiades'
  end

  it 'has an age' do
    expect(@alexander.age).to eq 28
  end

  it 'has a state of residence' do
    expect(@alexander.state_of_residence).to eq 'CO'
  end

  it 'has spending money' do
    expect(@alexander.spending_money).to eq 10
  end

  it 'is not out of state if in Colorado' do
    expect(@alexander.out_of_state?).to be false
    expect(@benjamin.out_of_state?).to be true
  end

  it 'starts with an empty array of game interests, and can add' do
    expect(@alexander.game_interests).to eq []
    @alexander.add_game_interest('Mega Millions')
    @alexander.add_game_interest('Pick 4')
    expect(@alexander.game_interests).to eq ['Mega Millions', 'Pick 4']
  end

end
