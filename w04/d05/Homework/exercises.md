#Exercises W01-W04

##List of Numbers

**write a command line app that stores a list of numbers**
- Prompt the user to enter in a command
- If the user wants to add a number they simply type  ```add 5``` or ```add 30``` and your program should add a number to the list
- If the user wants to show the numbers they type ```show``` and all numbers currently added to the list should be displayed to the user in a comma-separated format
- Repeat the process and ask the user for their next command
- Here is sample output:
```
Please enter in a command
add 2
2 added!
Please enter in a command
add 5
5 added!
Please enter in a command
add 5
7 added!
Please enter in a command
show
2, 5, 7
```

##Random user

**Write a command line app that prints out the information for one random user and then exits**
- when run will your program should grab a user from the randomuser.me API and form a hash out of its information with the three keys: ```full_name``` ```city``` and ```state```
- After forming the hash it should print it to the terminal


##ERB outside the server

*erb is just a method that returns a string. When you call it, it looks for a file in a view folder. It actually has nothing inherently to do with a server.*

Make a command line app that:
- grabs a user from randomuser.me
- uses ```erb``` to print out the user’s information formated like so
```
This awesome person is named [full name goes here]
They live in [city], [state]
```

##Greeters (Part 1)

**Create a Greeter class**

Create a class Greeter that:
- has an initialize method that takes a greeting (e.g. "How are you today?") and a name
- has an instance method to say its one greeting
- has a class method that randomly chooses from 4 premade greetings

Create a command line app that uses class Greeter to say one greeting and then exit
- grab a greeting from your class method
- create a new Greeter with that greeting and have them greet

##Greeters (Part 2)

**Create a command line app that adds and persists Greeters**

Have your greeter class inherit from the ```model``` class that we have been using in class. You can use the one given in class on Thursday (8/28/14) or the version using ActiveRecord.

Your command line app should:
1. Prompt the user for the name of a new greeter, and then create that greeter and persist them using the ```model``` class.
2. Show the user all currently created greeters, having them all say their greets
3. Repeat 1-2
