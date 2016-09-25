require "sqlite3"

def init
	# ARGV gets the command line argument
	#http://jnoconor.github.io/blog/2013/10/13/a-short-explanation-of-argv/
	if ARGV.empty?
	  puts "\n***you must select a database***\n\nfor example - ruby dc.rb test.db"
	  exit
	end

	db = SQLite3::Database.new(ARGV[0])
	#this was needed to keep ARGV from passing more data than nessesary (interferes with gets)
	ARGV.clear

	#turn on foreign key support
	db.execute("PRAGMA foreign_keys = ON")

	db
end

def get_input_main

	puts "\nchoose option:"
	puts "1 - add table"
	puts "2 - edit table"
	puts "3 - delete table"
	puts "4 - display table"
	puts "5 - quit"

	gets.chomp.to_i
end

def get_input_table

	puts "\nchoose option:"
	puts "1 - add rows"
	puts "2 - edit/delete rows"
	puts "3 - display rows"
	puts "4 - main menu"

	gets.chomp.to_i
end

def select_table(db)
	#retrieves all table names from database
	#https://sqlite.org/faq.html
	tables = db.execute("SELECT name FROM sqlite_master WHERE type = 'table'")

	puts "\nselect table number:"

	tables.length.times do |i|
		puts "#{i + 1} - #{tables[i][0]}"
	end

	table_selection = gets.chomp.to_i - 1

	tables[table_selection][0]
end

def get_schema(db, table_name)
	#retrieves table schema as array
	#https://www.sqlite.org/pragma.html
	db.execute("PRAGMA table_info(#{table_name})")
end

def add_table(db)

	print "\nenter new table name - "
	table_name = gets.chomp

	print "\nenter number of columns - "
	number_of_columns = gets.chomp.to_i

	create_table_cmd = "CREATE TABLE IF NOT EXISTS #{table_name} ("

	puts "\nDo you want a PRIMARY KEY? (y/n)"
	primary_key = gets.chomp.downcase
	if primary_key == "y"
		create_table_cmd += "id INTEGER PRIMARY KEY, "
	end

	save_columns = []

	number_of_columns.times do |i|
		print "\nname of column #{i + 1} - "
		column_name = gets.chomp
		save_columns << column_name

		puts "1 - VARCHAR(255)"
		puts "2 - INTEGER"

		print "\ncolumn type:"
		column_type = gets.chomp.to_i

		if column_type == 1
			create_table_cmd += "#{column_name} VARCHAR(255)"
		elsif column_type == 2
			create_table_cmd += "#{column_name} INT"
		end

		if i + 1 != number_of_columns
			create_table_cmd += ", "
		end
	end

	puts "\ndo you want a FOREIGN KEY? (y/n)"
	foreign_key_check = gets.chomp.downcase

	if foreign_key_check == "y"
		puts "\nselect foreign key column:"
		save_columns.length.times do |i|
			puts "#{i + 1}  - #{save_columns[i]}"
		end
		foreign_key_selection = gets.chomp.to_i - 1
		create_table_cmd += ", FOREIGN KEY(#{save_columns[foreign_key_selection]}) "

		puts "\nwhich table is referenced in your foreign key?"
		foreign_table = select_table(db)

		puts "\nwhich column is referenced on #{foreign_table}?"
		foreign_schema = get_schema(db, foreign_table)

		foreign_schema.length.times do |i|
			puts "#{i + 1}  - #{foreign_schema[i][1]}"
		end

		foreign_column_selection = gets.chomp.to_i - 1
		create_table_cmd += "REFERENCES #{foreign_table}(#{foreign_schema[foreign_column_selection][1]})"
	end
	
	create_table_cmd += ")"

	db.execute(create_table_cmd)

	table_name
end

def edit_table(db)

	table_name = select_table(db)
	schema =  get_schema(db, table_name)

	table_edit_selection = get_input_table

	until table_edit_selection == 4
		if table_edit_selection == 1
			add_rows(db, table_name, schema)
		elsif table_edit_selection == 2
			edit_delete_rows(db, table_name, schema)
		elsif table_edit_selection == 3
			display_table(db, table_name, schema)
		end
		table_edit_selection = get_input_table
	end
end

def delete_table(db)

	table_name = select_table(db)

	puts "\nARE YOU SURE YOU WANT TO DELETE TABLE #{table_name}? (y/n)"
	delete_check = gets.chomp.downcase

	if delete_check == "y"
		db.execute("DROP TABLE #{table_name}")
	end
end

def display_table(db, table_name, schema)

	# table_data = db.execute("SELECT * FROM ?", [table_name]) didn't work
	table_data = db.execute("SELECT * FROM #{table_name}")

	#display header
	puts "\n"
	schema.length.times do |i|
		print schema[i][1].ljust(20)
	end

	#display row
	puts "\n"
	table_data.each do |row|
		schema.length.times do |i|
			print row[i].to_s.ljust(20)
		end
		puts "\n"
	end
end

def add_rows(db, table_name, schema)

	insert_cmd = "INSERT INTO #{table_name} ("

	schema.length.times do |i|
		# schema[i][5] = 1 means its a primary key
		if schema[i][5] == 0
			insert_cmd += schema[i][1]
			if i + 1 == schema.length
				insert_cmd += ")"
			else
				insert_cmd += ", "
			end
		end
	end

	insert_cmd += " VALUES ("

	schema.length.times do |i|
		# schema[i][5] = 1 means its a primary key
		if schema[i][5] == 0
			print "\nenter #{schema[i][2]} data for column (#{schema[i][1]}) - "
			if schema[i][2] == "INT"
				insert_cmd += gets.chomp
			else
				insert_cmd += "'" + gets.chomp + "'"
			end
			if i + 1 == schema.length
				insert_cmd += ")"
			else
				insert_cmd += ", "
			end
		end
	end
	db.execute(insert_cmd)
	#capture exceptions
	#http://stackoverflow.com/questions/18901707/sqlite-and-ruby-rescue
	rescue SQLite3::Exception => capture_exception
	if capture_exception != ""
		puts "\n***#{capture_exception}***"
	end

end

def edit_delete_rows(db, table_name, schema)

	table_data = db.execute("SELECT * FROM #{table_name}")

	puts "\npress enter for next row, e for edit, d for delete, q for quit"

	#display header
	puts "\n"
	schema.length.times do |i|
		print schema[i][1].ljust(20)
	end
	puts "\n"

	delete_row_selection = ""	

	table_data.each do |row|
		#display row
		schema.length.times do |i|
			print row[i].to_s.ljust(20)
		end

		row_selection = gets.chomp.downcase

		if row_selection == "q"
			break
		elsif row_selection == "d"
			delete_row(db, table_name, schema, row)
		elsif row_selection == "e"
			edit_row(db, table_name, schema, row)
		end
	end
end

def delete_row(db, table_name, schema, row)

	delete_cmd = "DELETE FROM #{table_name} WHERE "

	schema.length.times do |i|
		delete_cmd += "#{schema[i][1]} = "

		if schema[i][2] == "INT"
			delete_cmd += "#{row[i]}"
		else
			delete_cmd += "'#{row[i]}'"
		end
		if i + 1 != schema.length
			delete_cmd += " AND "
		end
	end
	db.execute(delete_cmd)
	puts "\n"
end

def edit_row(db, table_name, schema, row)

	puts "\nwhich column do you want to edit?"

	schema.length.times do |i|
		puts "#{i + 1} - #{schema[i][1]}"
	end

	column_selection = gets.chomp.to_i - 1

	print "\nenter #{schema[column_selection][2]} data for column (#{schema[column_selection][1]}) - "

	update_cmd = "UPDATE #{table_name} SET #{schema[column_selection][1]} = "

	if schema[column_selection][2] == "INT"
		update_cmd += gets.chomp
	else
		update_cmd += "'" + gets.chomp + "'"
	end

	update_cmd += " WHERE "

	schema.length.times do |i|
		update_cmd += "#{schema[i][1]} = "

		if schema[i][2] == "INT"
			update_cmd += "#{row[i]}"
		else
			update_cmd += "'#{row[i]}'"
		end
		if i + 1 != schema.length
			update_cmd += " AND "
		end
	end
	db.execute(update_cmd)
	#capture exceptions
	#http://stackoverflow.com/questions/18901707/sqlite-and-ruby-rescue
	rescue SQLite3::Exception => capture_exception
	if capture_exception != ""
		puts "\n***#{capture_exception}***"
	end
	puts "\n"
end

#*********************************************************

db = init

main_menu_selection = get_input_main

until main_menu_selection == 5 do
	if main_menu_selection == 1
		add_table(db)
	elsif main_menu_selection == 2
		edit_table(db)
	elsif main_menu_selection == 3
		delete_table(db)
	elsif main_menu_selection == 4
		table_name = select_table(db)
		schema =  get_schema(db, table_name)
		display_table(db, table_name, schema)
	end
	main_menu_selection = get_input_main
end
