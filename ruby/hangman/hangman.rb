# player 1 enters a word
# player 2 guesses letters
# compare player2 letter to player 1 word
# if match print good guess
# if not print try again
# keep going until all guesses used or player 2 wins


class Hangman

  attr_reader :current_solution
  attr_reader :guesses_left
  attr_reader :guess_count
  attr_reader :over
  attr_accessor :won

  def initialize(word)
    @word = word
    @current_solution = "_" * word.length
    @previous_guesses = ""
    @guesses_left = word.length * 2
    @guess_count = 0
    @over = false
    @won = false
  end

  def repeat(guess)
    if @previous_guesses[guess]
    true
  else
    @guess_count += 1
    @previous_guesses = @previous_guesses + guess
    false
  end
  end

  def check(guess)
    if @word[guess]
    @word.each_char.with_index do |char, index|
          if char == guess
            @current_solution[index] = guess
          end
        end
        true
    else
        false
    end
  end

  def status
    if @current_solution == @word
      @over = true
      true
    else
      @guesses_left -= 1
      if @guesses_left == 0
        @over = true
      end
      false
    end
  end

end

# user interface

puts "Player 1: Enter a word"
player1_input = gets.chomp
game = Hangman.new(player1_input)
system "cls"

while !game.over

  puts "\nYou have #{game.guesses_left} guesses left"
  puts "\n   " + game.current_solution
  puts "\nPlayer 2: Enter a letter"
  player2_input = gets.chomp
  if game.repeat(player2_input)
    puts "\nAlready guessed"
  else
    if game.check(player2_input)
      puts "\nGood guess"
    else
      puts "\nTry again"
    end
    game.won = game.status
  end

end

if game.won
  puts "\n   " + game.current_solution
  puts "\nYou won the game in #{game.guess_count} turns!"
else
  puts "\n   " + game.current_solution
  puts "\n*****NO MORE TURNS*****"
  puts "\nYou lose, Good Day Sir!"
end
