class Student
  def initialize(first, last, email)
    @first = first
    @last = last
    @email = email
  end

  def list()
    return {first: @first, last: @last, email: @email}
  end

end
