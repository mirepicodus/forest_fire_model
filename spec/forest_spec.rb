require 'rspec'
require 'pry'
require 'forest'

describe :Forest do
  describe 'initialize' do
    it 'initializes a forest in acres from size passed' do
      new_forest = Forest.new(10, 10)
      expect(new_forest).to be_a Forest
      expect(new_forest.all_acres[0].x).to eq 1
    end
  end

  describe 'find' do
    it 'finds acre based on x, y coordinate' do
      new_forest = Forest.new(10, 10)
      expect(new_forest.find(1,1).x).to eq 1
    end
  end

  describe 'randomize' do
    it 'randomly sets acres to fire or forest based on inputs' do
      new_forest = Forest.new(10, 10)
      new_forest.stub(:rand).and_return(20)
      new_forest.randomize(10, 50)
      expect(new_forest.find(1,1).state).to eq 'forest'
    end
  end

  describe 'neighbors' do
    it 'finds neighbors in all directions within two acres' do
      new_forest = Forest.new(10, 10)
      new_acre = new_forest.find(5,5)
      expect(new_forest.neighbors(new_acre).length).to eq 24
    end
  end

  describe 'neighbors_state' do
    it 'returns percentage chance of current acre catching fire if not already on fire' do
      new_forest = Forest.new(10, 10)
      new_acre = new_forest.find(5,5)
      new_acre1 = new_forest.find(5,6)
      new_acre2 = new_forest.find(5,7)
      new_acre.state = 'forest'
      new_acre1.state = 'fire'
      new_acre2.state = 'blazing'
      expect(new_forest.neighbors_state(new_acre)).to eq 4
    end
  end

  describe 'spread' do
    it 'sets fire to next state' do
      new_forest = Forest.new(10, 10)
      new_acre = new_forest.find(5,5)
      new_acre1 = new_forest.find(5,6)
      new_acre2 = new_forest.find(5,7)
      new_acre.state = 'forest'
      new_acre1.state = 'fire'
      new_acre2.state = 'blazing'
      new_forest.stub(:rand).and_return(4)
      new_forest.spread
      expect(new_acre.state).to eq 'fire'
    end
  end

end
