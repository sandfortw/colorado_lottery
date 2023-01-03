require './lib/game'

describe Game do

  before(:each) do
    @mega_millions = Game.new('Mega Millions', 5, true)
  end

  it 'has a name' do
    expect(@mega_millions.name).to eq('Mega Millions')
  end

  it 'has a cost' do
    expect(@mega_millions.cost).to eq(5)
  end

  it 'can be a national drawing, or not, and is false by default' do
    expect(@mega_millions.national_drawing?).to be true
    pick_4 = Game.new('Pick 4', 2)
    expect(pick_4.national_drawing?).to be false
  end

end