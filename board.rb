# This file contains the board for the game
class Board
  # use an array to represent the board
  def initialize
    i = 0
    @board = Array.new(9) do
      Square.new(i += 1)
    end
  end

  def display
    @board.each do
      |sq|
      print "|#{sq.owner}"
      puts '|' if (sq.id % 3).zero?
    end
  end
end

# represents a square in the board - squares need position and ownership
class Square
  attr_accessor :owner
  attr_reader :id

  def initialize(id)
    @id = id
    @owner = id
  end
end
