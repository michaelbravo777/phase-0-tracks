class Puppy

  def Puppy.initialize()
    puts "Initializing new puppy instance ..."
  end

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(num_of_woofs)
    num_of_woofs.times {puts "Woof!"}
  end

  def roll_over()
    puts "*Rolls Over*"
  end

  def dog_years(num_of_years)
    dog_years = num_of_years * 7
    puts "#{num_of_years} is #{dog_years} in dog years"
  end

  def eat(num_of_times)
    ounces = num_of_times * 3
    puts "Give him #{ounces} ounces every meal"
  end

end

class Kittens

  def Kittens.initialize()
    puts "Initializing new Kitten instance"
  end

  def fetch(toy)
    puts "Here is your new toy, #{toy}"
  end

  def sleep(hours_per_day)
    hours_per_week = hours_per_day * 7
    puts "#{hours_per_week} is how many hours your cat will sleep per week"
  end

end

rover = Puppy.new
rover.fetch("rope")
rover.speak(5)
rover.roll_over()
rover.dog_years(5)
rover.eat(10)
Puppy.initialize()

cat_array = []

50.times do
  puts "Give us a cat name"
  cat_name = gets.chomp
  cat_name = Kittens.new
  cat_array.push(cat_name)
end

cat_array.each do |kitten|
  puts kitten.fetch("yarn")
  puts kitten.sleep(3)
  puts Kittens.initialize()
end