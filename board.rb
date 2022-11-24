# This file contains the board for the game
class GameBoard
    # use an array to represent the board
    def initialize
        i = 0
        @board = Array.new(3) {
            Array.new(3) {
                Square.new(i += 1)
            }
        }
    end
end

class Square
    # represents a square in the board - squares need position and ownership
    def initialize(id)
        @id = id
        @owner = none
    end
end