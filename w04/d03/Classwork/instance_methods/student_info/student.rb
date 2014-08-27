class Student

  def initialize(first, last, email)
    @first = first
    @last = last
    @email = email
  end

  def student_info
    puts "#{@first} #{@last}: #{@email}"
  end


end
