class Bob
  def hey(str)
    if str.upcase == str && !( ('a'..'z').to_a & str.downcase.split('') ).empty?
      return 'Whoa, chill out!'
    elsif str.end_with?("?")
      return "Sure."
    elsif str.strip.empty?
      return 'Fine. Be that way!'
    else
      return 'Whatever.'
    end
  end
end