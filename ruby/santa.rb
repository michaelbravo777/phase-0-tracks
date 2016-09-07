class Santa
  attr_reader :reindeer_ranking
  attr_accessor :gender, :ethnicity, :age

  def initialize(gender, ethnicity)
    puts "Initializing Santa instance ..."
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    @age = 0
  end

  def speak
    puts "Ho, ho, ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(type_of_cookie)
    puts "That was a good #{type_of_cookie}!"
  end

end

#santas = []
example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
20.times do
  santa = Santa.new(example_genders.sample, example_ethnicities.sample)
  santa.age = 1 + rand(140)
  puts "Gender: #{santa.gender} Ethnicity: #{santa.ethnicity} Age: #{santa.age}"
end
