#create method to get input from user
#initialize hash
#call get_input method with each item
#output hash
#ask if user should uodate or exit
#if updated output hash again

def get_input(symbol)
	print "#{symbol} - "
	input = gets.chomp
	if symbol == "name" || symbol == "theme"
		return input
	elsif symbol == "cats" 
		if input == "y"
			return true
		else return false
		end
	else return input.to_i
	end
end

form  = {
	name: "",
	age: 0,
	children: 0,
	color: "",
	cats: false,
}

puts "\nInput Client info:"
form[:name] = get_input("name")
form[:age] = get_input("age")
form[:children] = get_input("children")
form[:theme] = get_input("theme")
form[:cats] = get_input("cats")

puts "\nyou entered:"
puts "name - #{form[:name]}"
puts "age - #{form[:age]}"
puts "children - #{form[:children]}"
puts "theme - #{form[:theme]}"
puts "cats - #{form[:cats]}"

puts "\nenter item to update or none"
input = gets.chomp
if input != "none"
	form[input.to_sym] = get_input(input)
	puts "\nname - #{form[:name]}"
	puts "age - #{form[:age]}"
	puts "children - #{form[:children]}"
	puts "theme - #{form[:theme]}"
	puts "cats - #{form[:cats]}"
end
