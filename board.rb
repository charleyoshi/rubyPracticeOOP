# The board of the game
# All methods are public because other classes have to interact with the board
class Board
  SIZE = 3
  SPACE = ' '.freeze
  attr_accessor :grid

  def initialize
    @grid = Array.new(SIZE) { Array.new(SIZE, SPACE) }
  end

  def to_s
    @grid.each_with_index do |row, i|
      puts row.join('|')
      puts '--' * SIZE unless i == SIZE - 1
    end
    ''
  end

  def grid_taken?(inputs)
    if grid[inputs[:row]][inputs[:column]] != SPACE
      print "Row #{inputs[:row] + 1} Column #{inputs[:column] + 1} is taken!  "
      return true
    end
    false
  end

  def full?
    grid.flatten.count(SPACE).zero?
  end

  def win(player)
    # horizontal and vertical
    (0...SIZE).each do |i|
      return true if grid[i].count(player.symbol) == SIZE || grid.transpose[i].count(player.symbol) == SIZE
    end

    # diagonal
    return true if (0...SIZE).map { |i| grid[i][i] }.count(player.symbol) == SIZE

    true if (0...SIZE).map { |i| grid[i][-i - 1] }.count(player.symbol) == SIZE
  end
end
