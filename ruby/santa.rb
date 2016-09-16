class Santa
  attr_reader :reindeer_ranking
  attr_accessor :gender, :ethnicity, :age

  def initialize(gender, ethnicity)
    puts "\n\nInitializing Santa instance ..."
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

  def celebrate_birthday
    @age += 1
  end

  def get_mad_at(mad_at)
    # p @reindeer_ranking
    @reindeer_ranking << @reindeer_ranking.delete_at(@reindeer_ranking.index(mad_at))
    # p @reindeer_ranking
  end

  def gender
    @gender
  end

  def age
    @age
  end

  def ethnicity
    @ethnicity
  end
end

santa = Santa.new("female", "Japanese-African")
santa.get_mad_at("Prancer")
santa.celebrate_birthday
puts santa.age
puts santa.ethnicity
santa.gender = "N/A"
puts santa.gender

#santas = []
example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
20.times do
  santa = Santa.new(example_genders.sample, example_ethnicities.sample)
  santa.age = 1 + rand(140)
  puts "\nGender: #{santa.gender} Ethnicity: #{santa.ethnicity} Age: #{santa.age}"
end
