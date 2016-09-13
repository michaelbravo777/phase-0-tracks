def create_alias(string)
	vowels = 'AEIOUaeioua'
	consonants = 'BCDFGHJKLMNPQRSTVWXYZbcdfghjklmnpqrstvwxyzb'
	output_string = ""

	string.each_char do |string_character|
		if vowels.include? string_character
			output_string << vowels[vowels.index(string_character) + 1]
		else
			output_string << consonants[consonants.index(string_character) + 1]
		end
	end
	output_string
end

name_array = []

puts "Enter spy name or type quit"
input = gets.chomp
until input == "quit" || input == "" do

	#swap first name and last name, but only if there is a space
	if input.include? " "
		spy_name = input.split(" ")
		first_name = create_alias(spy_name[0])
		last_name = create_alias(spy_name[1])
		name_array << [input, last_name + " " + first_name]
	else
		name_array << [input, create_alias(input)]
	end

	puts "Enter spy name or type quit"
	input = gets.chomp
end

if name_array.length > 0
	name_array.each do |output|
		puts "Original name: #{output[0]}, New name: #{output[1]}"
	end
end