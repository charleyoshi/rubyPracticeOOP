require_relative 'board'
require_relative 'player'
require_relative 'helper'

# Game starts here
class Game
  include UserInputHelper

  def initialize
    # 1 new board, 2 players
    @board = Board.new
    @player1 = Player.new(take_user_name(1), 1)
    @player2 = Player.new(take_user_name(2), 2)
    @winner = nil
  end

  def start_game
    # while the board is not full, next play players
    players = [@player1, @player2].cycle
    until @board.full?
      current_player = players.next
      place_symbol(current_player)
      puts @board
      declare_win(current_player) if @board.win(current_player)
      break unless @winner.nil?
    end

    show_result
  end

  private

  def place_symbol(current_player)
    inputs = nil
    loop do
      inputs = take_user_place_symbol current_player
      break unless @board.grid_taken? inputs
    end
    @board.grid[inputs[:row]][inputs[:column]] = current_player.symbol
  end

  def show_result
    if @winner.nil?
      puts 'Tie game!'
    else
      puts "Winner: #{@winner.name}! "
    end
  end

  def declare_win(player)
    @winner = player
  end
end

g = Game.new
g.start_game
