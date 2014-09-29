# Create a function that takes an array of names and returns a new array with "hello [name]" for each name

# names = ["Jon", "Arya", "Bob", "Ned"]

# def output_names(array)
#   array.map do |n|
#      "Hello " + n
#   end
# end

# print output_names(names)

names = ["Jon", "Arya", "Bob", "Ned"]

def output_names(array)
  new_array = []
  array.each do |name|
  new_array << "Hello #{name}"
  end
  return new_array
end

print output_names(names)




