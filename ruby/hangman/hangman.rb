class Hangman

  attr_reader :current_solution
  attr_reader :guesses_left
  attr_reader :guess_count
  attr_reader :over
  attr_accessor :won

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

  def check(guess)
    if @player1_input[guess]
    @player1_input.each_char.with_index do |char, index|
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
    if @current_solution == @player1_input
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
  end
  game.won = game.status

end

if game.won
  puts "\nYou won the game in #{game.guess_count} turns!"
else
  puts "\nYou lose, Good Day Sir!"
end