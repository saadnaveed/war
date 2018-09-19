require 'pry'
require_relative "lib/war"

#GAME START
war = War.new
puts "Lets play War!\n"
puts "Player was dealt #{war.player_score} cards. Computer was dealt #{war.computer_score} cards."
puts

# Determines if the user wishes to play the game.
game_status = nil
while game_status == nil
  puts "Ready to start? (y/n)"
  input = gets.chomp

  if input.downcase == "n"
    game_status = false
    puts "Goodbye!"
  elsif input.downcase != "y"
    "Incorrect input, try again."
  else
    game_status = true
  end
end

# Created a condition where, until one of the players is out of cards,
# continues to play a new round.
if game_status == true
  while !war.game_over?
    war.play_round
    #binding.pry
  end

  # Returns which of the players won the game.
  war.game_winner
end
