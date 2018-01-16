class StudentsController < Sinatra::Base

	set :root, File.join(File.dirname(__FILE__), '..')

	set :views, Proc.new {File.join(root, "views") }

	configure :development do
		register Sinatra::Reloader	
	end

	get '/students' do
		@title = "Students Index"
		@students = Student.all
		erb :'students/index'
	end

	get '/students/new' do
		@title = "Add New Student"
		@student = Student.new
		erb :'students/new'
	end

	get '/students/:id' do
		@title = "Show Student"
		id = params[:id].to_i
		@student = Student.find id
		erb :'students/show'
	end

	post '/students/' do
		student = Student.new
		student.name = params[:name]
		student.gender = params[:gender]
		student.age = params[:age]
		student.best_subject = params[:best_subject]
		student.year = params[:year]

		student.save

		redirect "/students"
	end

	put '/students/:id' do
		id = params[:id].to_i
		student = Student.find id

		student.name = params[:name]
		student.gender = params[:gender]
		student.age = params[:age]
		student.best_subject = params[:best_subject]
		student.year = params[:year]

		student.save

		redirect "/students"

	end

	delete '/students/:id' do
		id = params[:id].to_i
		Student.destroy id
		redirect "/students"
	end

	get '/students/:id/edit' do
		@title = "Edit Student"
		id = params[:id].to_i
		@student = Student.find id
		erb :'students/edit'
	end
end






















