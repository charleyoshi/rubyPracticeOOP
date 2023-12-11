# This module is for handling user input
module UserInputHelper
  def take_user_name(order)
    print "Enter player #{order} name: "
    while true
      name = gets
      until name.chomp.strip.empty?
        puts "player #{order} is #{name}"
        return name.chomp.strip
      end
    end
  end

  def take_user_place_symbol(current_player)
    puts "place your symbol #{current_player.symbol}, #{current_player.name}: (1-9)"
    input = nil
    until input.to_i.between?(1, 9)
      input = gets.to_i
      puts 'Invalid, enter again' unless input.between?(1, 9)
    end
    inputs = {}
    inputs[:row] = (input - 1) / 3
    inputs[:column] = (input - 1) % 3
    inputs
  end
end
