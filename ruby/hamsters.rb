#4.3 Paired with Gregory Bilello, GitHub: @gvbilello

#gather hamster information
puts "Enter the hamster's name: "
name = gets.chomp

puts "Enter the hamster's volume (1-10): "
volume = gets.chomp.to_i

puts "Enter the hamster's fur color: "
color = gets.chomp

puts "Is this hamster a good candidate for adoption (yes/no): "
adopt = gets.chomp

puts "Enter the hamster's estimated age: "
age = gets.chomp.to_i

if age == "" then
	age = nil
end

if adopt == "yes" || adopt == "y"
	adopt_bool = true
else 
	adopt_bool = false
end

#print hamster information
puts "Name: #{name}"
puts "Volume: #{volume}"
puts "Fur Color: #{color}"
puts "Good candidate for adoption? #{adopt_bool}"
puts "Estimated age: #{age}"