#Wednesday Lab

##Create a web app to keep track of breeds of dogs

**create a main page to add and list current breeds**
- On your main page should be a form to submit a new breed of dog
- This main page should also list current breeds of dogs in the database

**deleting breeds**
- Next to each breed of dog add a button that when clicked deletes that breed of dog and returns to the main page

**editing breeds**
- Next to each breed of dog should be an edit button that take you to an edit page
- On the edit page the user can submit a modified name for that breed. Once submitted they should return to the main page

##Create command line interfaces to this web server
*HTTParty can send any type of request to any server, meaning that we can use it to hit our own servers.*

Here is how we might send a post request to our own server
```HTTParty.post("http://127.0.0.1:4567", {:body => {:age => 5}})```

Note that the second argument to ```HTTParty.post``` is a hash with one key/value pair where the key is ```:body``` and the value is a hash of the params. In this example we have one param ```age``` that has the value ```5```. There, of course, could be multiple params sent.

HTTParty can form PUT and DELETE requests in a similar fashion.

Also note that our server has to be running for this to actually work.

**Create a command line app to delete a breed**.
- the app should list all current breeds and then prompt the user for the name of a breed to delete
- hit our own server as if it was an API and delete that specific breed of dog
- your app should not loop, just run once and then exit (you can loop while developing your app if it helps you test it out)

**Create another command line app to update a breed**.
- the app should list all current breeds and then prompt the user for the name of a breed to update
- ask the user for the updated name of that breed
- do not loop. run once and then exit
