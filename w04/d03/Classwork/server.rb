require 'pry'
require_relative './comedian'


comedians = []

bozo = Comedian.new("bozo", "30", "Q: Did you hear about the hungry clock? A: It went back four seconds")

silly= Comedian.new("silly", "42", "Q: Did you hear about that new broom? A: It's sweeping the nation!")

dopie = Comedian.new("dopie", "22", "Q: How do you drown a Hipster? A: In the mainstream")

comedians.push(bozo)
comedians.push(silly)
comedians.push(dopie)

comedians.each do|comedian|
	comedian.tell_joke
end