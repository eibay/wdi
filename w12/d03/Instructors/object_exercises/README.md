1. Create a file ```robot1.rb``` and in that file make a class ```Robot1``` with one method "speak" that prints to the terminal ```Beep boop```.
  * Create another file ```robot1_driver.rb``` to require and test the ```Robot1``` class.
    * Create two ```Robot``` objects and call both of their speak methods. You should see in terminal two lines that say ```Beep boop```.
    * Use a loop to create an array of	 10 robots. In *another* loop go through this array of robots and call each one's speak method.
2. Create the file ```robot2.rb```. Make a class ```Robot2``` with the method ```phrase``` that returns the string "Beep boop".
  * Create the file ```robot2_driver``` that require's and tests Robot2. Repeat the exercises for ```robot1_driver.rb``` using the class Robot2.
3. Create a ```Comedian``` class and put it in ```comedian.rb```.
  * Create a constructor that takes a joke as a parameter (e.g. "A guy walks into a bar...")
  * Create the method ```say_joke``` that prints to the terminal the joke that was passed into the constructor
  * Create the file ```comedian_driver.rb``` that requires the ```Comedian``` class
    * Instantiate 3 comedians with different jokes each and call each one's ```say_joke``` method
    * Create a method ```say_all_jokes``` (still in ```comedian_driver.rb```) that takes an array of comedians and calls all of their ```say_joke``` methods
    * Test out ```say_all_jokes``` by passing it an array of 3 comedians.
4. Create a ```Comedian2``` class in the file ```comedian2.rb```
  * ```Comedian2``` should inherit from ```Comedian```. Do not recreate the constructor or ```say_joke``` methods from the ```Comedian``` class.
  * add the method ```get_joke``` that returns the joke that was passed into the ```Comedian2``` constructor.
  * Create the file ```comedian2_server.rb``` to make a server that returns comedian jokes
    * Be sure to require the ```Comedian2``` class in ```comedian2.rb```
    * Instantiate an array of 3 comedians (outside of the server routes)
    * Make a route ```/joke``` that accepts a ```GET``` request and returns a joke from a randomly selected ```comedian``` in the comedians array. Be sure to return the joke in JSON
    * Make another route ```/joke``` that accepts a ```POST``` request with a ```joke``` parameter. This route should instantiate a ```Comedian2``` with the ```joke``` parameter and add it to the comedians array
  * Create the file ```comedian2_client.rb``` with the class ```Comedian2Client``` to test out your comedian server
    * Make sure that you are running the server from ```comedian2_server.rb``` when testing out ```comedian2_client.rb```
    * Add a constructor that takes the url that the comedian server is running on (most likely ```http://localhost:4567```)
    * Add a method ```print_joke``` to make a ```GET``` request to ```/joke``` and print to the terminal the result
    * Add a method ```add_joke``` that takes a joke as a parameter and sends it as a ```POST``` request ```/joke```
  * Create the file ```comedian_driver.rb``` to require and test out ```Comedian2Client```
    * Instantiate a single ```Comedian2Client```
    * call the ```add_joke``` method
    * call the ```print_joke``` method
5. Create a class ```ActiveComedian``` backed by Comedian table with one field for a joke.
  * Add a method on this class ```say_joke``` that prints the ```ActiveComedian```'s joke to the terminal
  * Create a command line app that creates 3 ```ActiveComedian```s and then calls each ones ```say_joke``` method
6. Create a class ```ReallyActiveComedian``` backed by a different table that again has only one field for a joke
  * ```ReallyActiveComedian``` should inherit from ```ActiveComedian```
  * Add a method ```say_joke_twice``` that calls the comedians ```say_joke``` method twice. You should not rewrite the ```say_joke``` method
  * Create a command line app that creates 3 ```ReallyActiveComedians```s and calls each one's ```say_joke_twice``` method
7. Create a ```Numbers``` class in ```numbers.rb```
  * all methods in the ```Numbers``` class you can test out right in the ```numbers.rb``` file
  * Create a *class* method ```sort``` that takes an array of numbers and sorts them in ascending order, returning the result. Be sure to write your own algorithm and not use an existing sorting method.
  * Create a *class* method ```reverse``` that takes an array of numbers and reverses the order, returning the result
  * Create a *class* method ```reverse_sort``` that calls the previously written methods ```reverse``` and ```sort``` on an array of numbers and returns the result.

