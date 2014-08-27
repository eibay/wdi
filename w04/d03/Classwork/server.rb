require 'pry'
require_relative './comedian'


comedians = []

comedian = {"bozo" => bozo, "silly" => silly, "dopie" => dopie}

bozo = Comedian.new("bozo", "30", "Q: Did you hear about the hungry clock? A: It went back four seconds")

silly= Comedian.new("silly", "42", "Q: Did you hear about that new broom? A: It's sweeping the nation!")

dopie = Comedian.new("dopey", "22", "Q: How do you drown a Hipster? A: In the mainstream")

comedians.push(comedian)


