require_relative 'hangman'

describe Hangman do
      
  it "should detect if repeat" do 
     game = Hangman.new("unicorn")
     test_string = 'u' 
     expect(game.repeat(test_string)).to be false
     test_string = 'u' 
     expect(game.repeat(test_string)).to be true 
     expect(game.guess_count).to eq 1
  end 

  it "checks if word contains guess" do 
     game = Hangman.new("unicorn")
     test_string = 'u' 
     expect(game.check(test_string)).to be true
     expect(game.current_solution[0]).to eq "u"
  end 

  it "checks if player won" do 
     game = Hangman.new("unicorn")
     test_string = 'u' 
     expect(game.check(test_string)).to be true
     test_string = 'n' 
     expect(game.check(test_string)).to be true
     test_string = 'i' 
     expect(game.check(test_string)).to be true
     test_string = 'c' 
     expect(game.check(test_string)).to be true
     test_string = 'o' 
     expect(game.check(test_string)).to be true
     test_string = 'r' 
     expect(game.check(test_string)).to be true
     expect(game.status).to be true
     expect(game.over).to be true
  end 

end
