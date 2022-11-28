# main gameplay loop should be found here
require_relative 'board'
require_relative 'player'

game_board = Board.new
PLAYCHOICES = ['X', 'O', '1', '2']

puts "Welcome to Tic-Tac-Toe, Ruby Version! \nPlease select the symbol the first player would like to use for the game."
puts "\n    1. X\n    2. O\n"
puts 'What is your choice?'
player_symbol = gets.chomp.upcase

until PLAYCHOICES.include?(player_symbol)
  puts 'Please try again, enter in the number or letter for your choice'
  player_symbol = gets.chomp.upcase
end

case player_symbol
when 1
  player_symbol = 'X'
when 2
  player_symbol = 'O'
end

player1 = Player.new(player_symbol)
player2 = Player.new(player_symbol == 'X' ? 'O' : 'X')

game_board.display
