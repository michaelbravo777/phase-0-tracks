puts "\r\nHow many employees are you going to process?"

number_of_employees = gets.chomp

for i in 1..number_of_employees.to_i
	puts "\r\nEmployee #{i}"
	puts "\r\nWhat is your name?"
	employee_name = gets.chomp
	puts "\r\nHow old are you?"
	employee_age = gets.chomp
	puts "\r\nWhat year were you born?"
	employee_birth_year = gets.chomp
	puts "\r\nOur company cafeteria serves garlic bread. Should we order some for you?"
	employee_garlic = gets.chomp
	puts "\r\nWould you like to enroll in the company’s health insurance?"
	employee_insurance = gets.chomp
	result = "Results inconclusive."
	#check if employee got their age right.
	if (employee_age.to_i + employee_birth_year.to_i == Time.now.year) ||
		(employee_age.to_i + employee_birth_year.to_i == Time.now.year - 1)
		#check if employee got their age right, and is willing to eat garlic bread or sign up for insurance.
		then if employee_garlic == "yes" || employee_insurance == "yes"
			 	then result = "Probably not a vampire."
			 end
		#check if employee got their age wrong, hates garlic bread, and doesn’t want insurance
		elsif employee_garlic == "no" && employee_insurance == "no"
			then result = "Almost certainly a vampire."
		#check if employee got their age wrong, and hates garlic bread or waives insurance
		elsif employee_garlic == "no" || employee_insurance == "no"
			then result = "Probably a vampire."
	end
	#check for vamire like names
	if employee_name == "Drake Cula" || employee_name == "Tu Fang"
		then result = "Definitely a vampire."
	end

	puts "\r\nEmployee #{employee_name} - Questionnaire results: #{result}"

	allergies = ""
	until allergies == "done" || allergies == "sunlight" do
	   puts "\r\nDo you have an allergies? Type  \"done\" when finished"
	   allergies = gets.chomp
	end

	result = "Results inconclusive."

	if allergies == "sunlight"
		then result = "Probably a vampire."
	end

	puts "\r\nEmployee #{employee_name} - Allergy results: #{result}"

end

puts "\r\nActually, never mind! What do these questions have to do with anything? Let's all be friends."
