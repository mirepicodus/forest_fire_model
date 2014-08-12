class Forest
  attr_accessor :all_acres

  def initialize width, length
    @all_acres = []
    (1..width).each do |x|
      (1..length).each do |y|
        @all_acres << Acre.new(x, y)
      end
    end
  end

  def find x, y
    @all_acres.select {|acre| acre.x == x && acre.y == y}[0]
  end

  def randomize percent_on_fire, percent_forest
    @all_acres.map do |acre|
      random_state = rand(100)
      if random_state <= percent_on_fire
        acre.state = 'fire'
      elsif random_state <= percent_on_fire + percent_forest
        acre.state = 'forest'
      end
    end
  end

  def neighbors(acre)
    neighbors = []
    (-2..2).each do |x|
      (-2..2).each do |y|
        if !(x == 0 && y == 0)
          neighbors << self.find((acre.x + x), (acre.y + y))
        end
      end
    end
    neighbors
  end

end
