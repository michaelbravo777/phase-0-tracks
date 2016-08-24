puts "What is your name?"
employee_name = gets.chomp
puts "How old are you?"
employee_age = gets.chomp
puts "What year were you born?"
employee_birth_year = gets.chomp
puts "Our company cafeteria serves garlic bread. Should we order some for you?"
employee_garlic = gets.chomp
puts "Would you like to enroll in the company’s health insurance?"
employee_insurance = gets.chomp
result = "Results inconclusive."
if (employee_age.to_i + employee_birth_year.to_i == Time.now.year) ||
	(employee_age.to_i + employee_birth_year.to_i == Time.now.year - 1)
	then if employee_garlic == "y" || employee_insurance == "y"
		 	then result = "Probably not a vampire."
		 end
	elsif employee_garlic == "n" && employee_insurance == "n"
		then result = "Almost certainly a vampire."
	elsif employee_garlic == "n" || employee_insurance == "n"
		then result = "Probably a vampire."
end
if employee_name == "Drake Cula" || employee_name == "Tu Fang"
	then result = "Definitely a vampire."
end
print result
