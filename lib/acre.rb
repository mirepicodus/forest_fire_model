class Acre
  attr_reader :x, :y
  attr_accessor :state, :next_state

  def initialize x, y
    @x = x
    @y = y
    @state = ''
  end
end
