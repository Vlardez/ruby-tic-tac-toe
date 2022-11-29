# This file holds the player class
class Player
  attr_accessor :score
  attr_reader :symbol, :winner, :name

  def initialize(symbol)
    @score = 0
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
