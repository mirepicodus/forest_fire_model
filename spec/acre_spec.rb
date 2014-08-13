require 'rspec'
require 'pry'
require 'acre'

describe :Acre do
  describe 'initialize' do
    it 'initializes an acre with 2 coordinates and alive equal to true' do
      new_acre = Acre.new(1, 1)
      expect(new_acre).to be_a Acre
      expect(new_acre.x).to eq 1
    end
  end
end
