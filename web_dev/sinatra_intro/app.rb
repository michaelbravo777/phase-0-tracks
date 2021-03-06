# require gems
require 'sinatra'
require "sinatra/reloader" if development?
require 'sqlite3'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
get '/' do
	if params[:campus]
		students = db.execute("SELECT * FROM students WHERE campus=?", [params[:campus]])
		response = ""
		students.each do |student|
			response << "ID: #{student['id']}<br>"
			response << "Name: #{student['name']}<br>"
			response << "Age: #{student['age']}<br>"
			response << "Campus: #{student['campus']}<br><br>"
		end
	else
		students = db.execute("SELECT * FROM students")
		response = ""
		students.each do |student|
			response << "ID: #{student['id']}<br>"
			response << "Name: #{student['name']}<br>"
			response << "Age: #{student['age']}<br>"
			response << "Campus: #{student['campus']}<br><br>"
		end
	end
	response
end

# write a GET route with
# route parameters
get '/about/:person' do
	person = params[:person]
	"#{person} is a programmer, and #{person} is learning Sinatra."
end

get '/:person_1/loves/:person_2' do
	"#{params[:person_1]} loves #{params[:person_2]}"
end

# write a GET route that retrieves
# all student data
get '/students' do
	students = db.execute("SELECT * FROM students")
	response = ""
	students.each do |student|
		response << "ID: #{student['id']}<br>"
		response << "Name: #{student['name']}<br>"
		response << "Age: #{student['age']}<br>"
		response << "Campus: #{student['campus']}<br><br>"
	end
	response
end

# write a GET route that retrieves
# a particular student

get '/students/:id' do
	student = db.execute("SELECT * FROM students WHERE id=?", [params[:id]])[0]
	student.to_s
end

get '/contact' do
 	"Address: 48 Wall St, New York, NY 10005<br>Phone: (347) 927-4286"
end

get '/great_job' do
	if params[:name]
		"Good job, #{params[:name]}!"
	else
		"Good job!"
	end
end

get '/add/:x/:y' do
	sum = params[:x].to_i + params[:y].to_i
	sum.to_s
end
