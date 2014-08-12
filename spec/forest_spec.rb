require 'rspec'
require 'forest'

describe :Forest do
 describe 'initialize' do
  it 'initializes a forest in acres from size passed' do
    new_forest = Forest.new(10, 10)
    expect(new_forest).to be_a Forest
    expect(new_forest.all_acres[0].x).to eq 1
  end
 end
end
