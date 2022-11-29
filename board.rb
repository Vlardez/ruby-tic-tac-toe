# This file contains the board for the game
class Board
  attr_accessor :rounds, :active_player

  # use an array to represent the board
  def initialize
    i = 0
    @board = Array.new(9) do
      Square.new(i += 1)
    end
    @rounds = 0
  end

  def display
    @board.each do |sq|
      print "|#{sq.owner}"
      puts '|' if (sq.id % 3).zero?
    end
  end

  def lock(id, symbol)
    @board[id - 1].now_chosen(symbol)
  end
end

# represents a square in the board
class Square
  attr_accessor :owner
  attr_reader :id, :chosen

  def initialize(id)
    @id = id
    @owner = id
    @chosen = false
  end

  def now_chosen(symbol)
    @chosen = true
    @owner = symbol
  end
end
