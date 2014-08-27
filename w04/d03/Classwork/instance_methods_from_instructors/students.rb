require_relative 'student.rb'

students = []

mitch = Student.new("mitch","moore", "mm@gmail.com")
jerry= Student.new("jerry","jerrs", "jj@gmail.com")
harry= Student.new("harry","harrs", "hh@gmail.com")

students << mitch
students << jerry
students << harry

students.each do |student|

	student.ask_info
end