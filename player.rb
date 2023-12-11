# player class
class Player
  SYMBOLS = %w[X O].freeze
  attr_reader :name, :symbol

  def initialize(name, order)
    @name = name
    @symbol = SYMBOLS[order - 1]
  end
end
