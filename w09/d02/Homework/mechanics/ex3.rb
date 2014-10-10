# Create a function that takes an array of names and console.logs "hello name" for each name

names = ["Jon", "Arya", "Bob", "Ned"]

def outputnames(array)
  array.each do |n|
    puts "Hello " + n
  end
end

outputnames(names)



