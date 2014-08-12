class Acre
  attr_reader(:x, :y)
  attr_accessor(:alive)

  def initialize x, y
    @x = x
    @y = y
    @alive = true
  end
end
