# Start with "abc" for the password
#   Create password and add next letter to the new encrypted password
#   Repeat each step until you reach the last letter of the password
#   To decrypt our password, make a string that includes the entire alphabet
#             Search for each letter by using index
#             Then take -1 out of each letter
#  Then you loop through the entire string
# Ask user to select either encrypt or decrypt by pressing the letter E for encrypt or the letter D for 
# decrypt, then pressing enter.
# User makes selection, clicks enter.
# Next, the program asks the user for password
# User enters password, password is encrypted or decrypted depending on user’s original selection.
# Program prints new password
# User exits program 

def encrypt (secret_password)
	index = 0
	encrypted_password = ""

	while index < secret_password.length
	  if secret_password[index] == "z"
	  	then encrypted_password += "a"
	    else encrypted_password += secret_password[index].next
	  end
	  index += 1
	end
	return encrypted_password
end

def decrypt (encrypted_password)
	index = 0
	secret_password = ""
	alphabet = "abcdefghijklmnopqrstuvwxyz"

	while index < encrypted_password.length
	  current_letter = encrypted_password[index]
	  number_of_letter = alphabet.index(current_letter)
	  secret_password += alphabet[number_of_letter -1]
	  index += 1
	end
	return secret_password
end

# p encrypt "abc"
# p encrypt "zed"
# p decrypt "bcd"
# p decrypt "afe"
# p decrypt(encrypt("swordfish"))

puts "Press E to encrypt a password or press D to decrypt a password"
user_selection = gets.chomp
puts "Enter password"
password = gets.chomp
if user_selection == "e" || user_selection == "E"
	then puts encrypt password
elsif user_selection == "d" || user_selection == "D"
	then puts decrypt password
else puts "Invalid selection"
end
