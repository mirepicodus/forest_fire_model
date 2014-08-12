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

end
