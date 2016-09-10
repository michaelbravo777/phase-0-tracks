class Hangman

  attr_reader :current_solution
  attr_reader :guesses_left
  attr_reader :guess_count
  attr_reader :over
  attr_reader :won

  def initialize(player1_input)
    @player1_input = player1_input
    @current_solution = "_" * player1_input.length
    @previous_guesses = ""
    @guesses_left = player1_input.length * 2
    @guess_count = 0
    @over = false
    @won = false
  end

  def repeat(player2_input)
    if @previous_guesses[player2_input]
    true
  else
    @guess_count += 1
    @previous_guesses = @previous_guesses + player2_input
    false
  end
  end

  def word_check(guess)

    if 
       true
    else
      false
    end
  end

  def game_status
    if @current_solution == @player1_input
      true
    else
      @guesses_left -= 1
      if @guesses_left = 0
        @lost = true
      end
      
      
      false
    end
  end

end

# user interface

puts "Player 1: Enter a word"
# player1_input = gets.chomp
player1_input = "unicorn"
game = Hangman.new(player1_input)
system "cls"

while !game.over

  puts "\nYou have #{game.guesses_left} guesses"
  puts "\n   " + game.current_solution
  puts "\nPlayer 2: Enter a letter"
  player2_input = gets.chomp
  if game.repeat(player2_input)
    puts "\nAlready guessed"
  else
    game.word_check(player2_input)
  end
  game.won = game.status

end

if game.won
  puts "\nYou won the game in #{game.guess_count} turns!"
else
  puts "/nYou lose, Good Day Sir!"
end