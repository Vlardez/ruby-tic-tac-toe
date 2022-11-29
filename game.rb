# main gameplay loop should be found here
require_relative 'board'
require_relative 'player'

game = Board.new
SYMBOL_CHOICES = %w[X O 1 2].freeze
PLAYCHOICES = [1, 2, 3, 4, 5, 6, 7, 8, 9].freeze
WINNING_COMBOS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]].freeze

puts "Welcome to Tic-Tac-Toe, Ruby Version! \nPlease select the symbol the first player would like to use for the game."
puts "\n    1. X\n    2. O\n"
puts 'What is your choice?'
player_symbol = gets.chomp.upcase

until SYMBOL_CHOICES.include?(player_symbol)
  puts 'Please try again, enter in the number or letter for your choice'
  player_symbol = gets.chomp.upcase
end

case player_symbol.to_i
when 1
  player_symbol = 'X'
when 2
  player_symbol = 'O'
end

player1 = Player.new(player_symbol)
player2 = Player.new(player_symbol == 'X' ? 'O' : 'X')

puts 'Here is the game board! Numbered squares are unchosen - Xs and Os mean it\'s chosen'
game.display
puts "Let's get started!"
game.active_player = player1

while game.rounds < 9
  # active player picks square and is checked against available squares
  active_squares = game.board.map { |sq| sq.id unless sq.chosen }
  puts "#{game.active_player.name}, please pick a numbered square."
  player_choice = gets.chomp.upcase
  until active_squares.include?(player_choice.to_i) || player_choice == 'EXIT'
    puts 'Please enter one of the available squares denoted by a number or type exit to quit'
    player_choice = gets.chomp.upcase
  end
  exit if player_choice == 'EXIT'
  game.lock(player_choice.to_i, game.active_player.symbol)
  # switch active players and increment round and check for winner
  game.display
  game.active_player.check(WINNING_COMBOS)
  if game.active_player.winner
    puts "CONGRATULATIONS #{game.active_player.name.upcase}, YOU WON TIC-TAC-TOE!!"
    puts 'Thank you for playing :)'
    break
  end

  game.active_player = game.active_player == player1 ? player2 : player1
  game.rounds += 1
end

# in case of a tie.
puts 'IT\'S A TIE! Thank you for playing :)' unless player1.winner || player2.winner
