# This file holds the player class
class Player
  attr_reader :symbol, :winner, :name

  def initialize(symbol)
    @symbol = symbol
    @name = @symbol == 'X' ? 'Xerxes' : 'Orion'
    @squares = []
    @winner = false
  end

  def own(square)
    @squares.push(square)
  end

  def check(winning_combos)
    winning_combos.each do |combo|
      @winner = true if (combo - @squares).empty?
    end
  end
end
