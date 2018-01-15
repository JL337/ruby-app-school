class Student

	attr_accessor :id, :name, :gender, :age, :best_subject, :year

	def save

	  conn = Student.open_connection

	  if(!self.id) 
	    # Insert a new record in to the database
	    sql = "INSERT INTO students (name, gender, age, best_subject, year) VALUES ( '#{self.name}', '#{self.gender}', '#{self.age}', '#{self.best_subject}', '#{self.year}' )"
	  else 
	    # Update an existing one
	    sql = "UPDATE students SET name='#{self.name}', gender='#{self.gender}', age='#{self.age}', best_subject='#{self.best_subject}', year='#{self.year}' WHERE id = #{self.id}"
	  end
	  conn.exec(sql)
	  #execute exec method, to connect to the sql database, pass it a variable
	end

	def self.open_connection
		conn = PG.connect( dbname: "students" )
	end

	def self.all
		conn = self.open_connection
		sql = "SELECT id,name,gender,age,best_subject,year FROM students ORDER BY id"
		results = conn.exec(sql)
		students = results.map do |tuple|
			self.hydrate tuple
		end
		students
	end

	def	self.find id
		conn = self.open_connection
		sql = "SELECT * FROM students WHERE id = #{id} LIMIT 1"
		students = conn.exec(sql)
		student = self.hydrate students[0]
		student
	end

	def self.destroy id
		conn = self.open_connection
		sql = "DELETE FROM students where id = #{id}"
		conn.exec(sql)
	end

	def self.hydrate student_data
		student = Student.new

		student.id = student_data['id']
		student.name = student_data['name']
		student.gender = student_data['gender']
		student.age = student_data['age']
		student.best_subject = student_data['best_subject']
		student.year = student_data['year']

		student
	end

end 

