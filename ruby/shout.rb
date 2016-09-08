module Shout

  # def self.yell_angrily(words)
  #   words + "!!!" + " :("
  # end

  # def self.yell_happily(words)
  #   words + "   <(^.^)>"
  # end

  def trouble_emoticon(words)
    words + "   (>_<)"
  end

  def fish_emoticon(words)
    words + "   ><(((*>"
  end

end

class Trouble
	include Shout
end

class Fish
	include Shout
end

# puts Shout.yell_angrily("I am mad")
# puts Shout.yell_happily("I am not mad")

trouble = Trouble.new
puts trouble.trouble_emoticon("I am hungry")
fish = Fish.new
puts fish.fish_emoticon("Lets go fishing")
