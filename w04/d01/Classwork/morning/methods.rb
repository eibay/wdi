
def all()
  return JSON.parse(File.read('./students.txt'))
end


def find_by(key, value)

  result=all().find do |n|
    n[key].downcase==value.downcase
  end
  return result
end



