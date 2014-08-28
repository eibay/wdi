class Comedian

  def initialize(first_name, last_name, age, joke)
      @first_name = first_name
      @last_name = last_name
      @age = age
      @joke = joke
  end

    def info
      return "#{@first_name}, #{@last_name}, #{@age}, #{@joke}"
  end

end