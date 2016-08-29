#Michael Bravo
#5.3 Iteration
#paired with Gregory Bilello

#Write a method that takes a block
def drink_order
	puts "We have three drinks to choose from."
	yield("soda", "water", "coffee")
end

drink_order { |drink1, drink2, drink3| puts "Would you like #{drink1}, #{drink2}, or #{drink3}?"}

#Create an array
steaks = ["t-bone", "porterhouse", "filet mingon", "skirt steak"]

#Create a hash
drinks = {
	"coffee" => "hot",
	"tea" => "hot",
	"soda" => "cold",
	"water" => "room temperature"
}

#iterate through the array and hash
steaks.each do |steak|
	puts "Would you like your #{steak} rare, medium, or well-done?"
end

drinks.each do |drink, temperature|
	puts "#{drink} is served #{temperature}."
end

#modify an array using .map!
puts steaks
steaks.map! do |steak|
	steak = "chicken"
end
puts steaks

#other array and hash methods that take blocks
nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
puts nums.select { |n| n.even? == true }

state_capitals = {
	"New York" => "Albany",
	"California" => "Sacramento",
	"Wisconsin" => "Madison",
	"Colorado" => "Denver",
	"Florida" => "Tallahassee"
}

state_capitals.each_value { |capital| puts "#{capital} is a state capital!"}
