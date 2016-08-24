puts "How many employees are you going to process?"

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
	result = "\r\nResults inconclusive."
	if (employee_age.to_i + employee_birth_year.to_i == Time.now.year) ||
		(employee_age.to_i + employee_birth_year.to_i == Time.now.year - 1)
		then if employee_garlic == "y" || employee_insurance == "y"
			 	then result = "\r\nProbably not a vampire."
			 end
		elsif employee_garlic == "n" && employee_insurance == "n"
			then result = "\r\nAlmost certainly a vampire."
		elsif employee_garlic == "n" || employee_insurance == "n"
			then result = "\r\nProbably a vampire."
	end
	if employee_name == "Drake Cula" || employee_name == "Tu Fang"
		then result = "\r\nDefinitely a vampire."
	end
end

puts "\r\nEmployee #{employee_name}: #{result}"

allergies = ""
until allergies == "done" || allergies == "sunlight" do
   puts "\r\nDo you have an allergies? Type  \"done\" when finished"
   allergies = gets.chomp
end

if allergies == "sunlight"
	then puts "\r\nEmployee #{employee_name}: Probably a vampire."
end

puts "\r\nActually, never mind! What do these questions have to do with anything? Let's all be friends."
