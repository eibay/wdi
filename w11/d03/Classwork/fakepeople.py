from faker import Faker
fake = Faker()

people = {}

class Person:
	def __init__(self, name, phone_number):
		self.phone_number = phone_number
		self.name = name

for i in range(1,1001):
	people[i] = {Person(fake.name(), fake.phone_number())}

print people



