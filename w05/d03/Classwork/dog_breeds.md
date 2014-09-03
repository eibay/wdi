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

##Integrate with the petfinder API
Wouldn't it be cool if there were pictures for the breeds? So cool.

![Image of pups mcgee](http://photos.petfinder.com/photos/pets/27808175/1/?bust=1384014481&width=300&-pn.jpg)

**Grab an API key from PetFinder**
- First, go to https://users.petfinder.com/my-account/register and register for an API key. Feel free to put in dummy data so that they don't spam you.
- Then go to https://www.petfinder.com/developers/api-key to obtain an API key
- Make sure everything works by substituting in your API key into this URL and pasting it into your browser http://api.petfinder.com/breed.list?key=your-key-goes-here&animal=cat&format=json Do not just click on that link. You should get some json data that does not say error or unauthorized key.

**Learn how to use the API**
- For your reference here is the API documentation https://www.petfinder.com/developers/api-docs
- We suggest using the API method pet.getRandom (search for it on the docs page) to get information for one dog, but you can use whatever method you like
- Be sure to read the doc carefully for the API method call you use
- **Hint** be sure to include ```format=json``` as a query parameter.
- Make sure you figure out how to dig into the data and get an image for a dog of that breed before moving onto the next part

**Modify your server from Part 1 to grab dog pictures from the petfinder API**
- First, create a new table in your database to handle two fields, one for breed name and one for a link to an image (not the image file itself!)
- Now, whenever you add a dog breed fetch a dog image from the petfinder API **and save the link to that image to the database**
- When you list the breeds, be sure to include an image for each dog breed **do not fetch a new image for a dog every time you list the breeds**
- When you edit a breed name make sure to refetch an image for the new breed name and modify the image link in the database
