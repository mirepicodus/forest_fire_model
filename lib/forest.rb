class Forest
  @@all_acres = []

  def self.all_acres
    @@all_acres
  end

  def initialize width, length
    @@all_acres = []
    (1..width).each do |x|
      (1..length).each do |y|
        @@all_acres << Acre.new(x, y)
      end
    end
  end

  def find x, y
    @@all_acres.select {|acre| acre.x == x && acre.y == y}[0]
  end

  def randomize percent_on_fire, percent_forest
    @@all_acres.map do |acre|
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

  def neighbors_state acre
    if acre.state == 'forest'
      chance_to_catch_fire = 0
      self.neighbors(acre).compact.each do |neighbor|
        if neighbor.state == 'blazing'
          (acre.x - neighbor.x).abs == 2 || (acre.y - neighbor.y).abs == 2 ? chance_to_catch_fire += 2 : chance_to_catch_fire += 4
        elsif neighbor.state == 'fire' || neighbor.state == 'smoldering'
          (acre.x - neighbor.x).abs == 2 || (acre.y - neighbor.y).abs == 2 ? chance_to_catch_fire += 1 : chance_to_catch_fire += 2
        end
      end
    end
    return chance_to_catch_fire
  end

  def spread
    Forest.all_acres.each do |acre|
      if acre.state == 'fire'
        acre.next_state = 'blazing'
      elsif acre.state == 'blazing'
        acre.next_state = 'smoldering'
      elsif acre.state == 'smoldering'
        acre.next_state = 'barren'
      elsif acre.state == 'barren'
        acre.next_state = 'barren'
      elsif acre.state == 'forest'
        if rand(100) <= self.neighbors_state(acre)
          acre.next_state = 'fire'
        else
          acre.next_state = 'forest'
        end
      end
    end
    Forest.all_acres.each do |acre|
      acre.state = acre.next_state
    end
  end

end
