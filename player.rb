# This file holds the player class
class Player
  attr_accessor :score, :current_turn
  attr_reader :symbol

  def initialize(symbol)
    @score = 0
    @current_turn = false
    @symbol = symbol
    @name = @symbol = 'X' ? 'Xerxes' : 'Orion'
    @squares = []
  end
end
