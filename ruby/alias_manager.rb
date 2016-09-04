#method goes through input_string. if a char in input_string matches a char in key it will be replaced by next letter in key
def next_item(key, input_string)
	index_outer = 0
	output_string = ''

	#loop through input string
	while index_outer < input_string.length
		#get current letter of input_string
		current_input_letter = input_string[index_outer]

  		#loop through key looking for current_input_letter
		index_inner = 0
		while index_inner < key.length
			#get current letter of key
			current_key_letter = key[index_inner]
			if current_input_letter == current_key_letter
				current_input_letter = key[index_inner + 1]
				break
			end
			index_inner += 1

		end
		output_string += current_input_letter
		index_outer += 1
	end
	return output_string
end

consonants = 'BCDFGHJKLMNPQRSTVWXYZbcdfghjklmnpqrstvwxyzb'
vowels = 'AEIOUaeioua'
name_array = [[]]
name_index = 0

#get first spy name
puts "Enter spy name or type quit"
input = gets.chomp
until input == "quit" || input == "" do


	#create array with first and last name
	spy_name = input.split(' ')

	#swap first name and last name
	swapped_name = spy_name[1] + ' ' + spy_name[0]

	#change consonants to next
	next_consonant = next_item(consonants, swapped_name)

	#change vowels to next
	new_name = next_item(vowels, next_consonant)

	name_array[name_index] = [input, new_name]
	name_index += 1

	#get next spy name
	puts "Enter spy name or type quit"
	input = gets.chomp
end

if name_index > 0
	name_array.each do |output|
		puts "Original name: #{output[0]}, New name: #{output[1]}"
	end
end