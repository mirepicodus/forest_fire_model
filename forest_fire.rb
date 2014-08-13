require 'colorize'
require './lib/acre'
require './lib/forest'



puts "Forest Fire Simulation"
puts "What dimensions in acres would you like for the forest?"
puts "Width: "
x = gets.chomp.to_i
puts "Length: "
y = gets.chomp.to_i
puts "What percent of acres do you want to start on fire?"
percent_fire = gets.chomp.to_i
puts "What percent of acres do you want to start with forests?"
percent_forest = gets.chomp.to_i
puts "How many iterations of spreading?"
spread_times = gets.chomp.to_i
forest = Forest.new(x, y)
forest.randomize(percent_fire, percent_forest)

spread_times.times do
  forest.all_acres.each do |acre|
    case acre.state
      when 'fire' then print "\u2600".yellow
      when 'blazing' then print "\u2600".red
      when 'smoldering' then print "\u2600".light_red
      when 'forest' then print "\u2600".green
      when 'barren' then print "\u2600".light_black
    end
    if acre.y % x == 0
      puts "\n"
    end
  end
  forest.spread
  puts "\n\n****************************\n\n"
end
