##Afternoon
---
###Part 1 - Think and Synthesize
- Open a text file and answer the following questions:
  - What is the difference between a GET and a POST request?
  - Give an example of when you would use a GET request
  - Give an example of when you would use a POST request

###Part 2 - MOAR Instagram
- Lets continue on our Instagram program from yesterday
- So far, we have added functionality to search for pictures based on tag names
  - Make sure you can search via a form, ***NOT*** just through the url

!!! QUESTION - CONFUSED - HAVE WE REALLY BEEN SEARCHING VIA THE URL? 
DOES 'SEARCH VIA FORM' MEAN VIA POST? 

yes search via form would mean you'd find the search query in request.body

- **GOAL**: Add a feature to save searches that we find interesting
- **SPEC**:
  - On the page where your pictures are displayed, add a button that says "Save Search"
  - Upon clicking this button, the tag you were searching with should be saved

MAYBE USE SOME VARIATION OF THIS: 
          elsif request.path == "/" && request.request_method == "POST"
              puppy_name = request.body.split("=")[1]
              puppies.push(puppy_name)
              client.puts puppies.join(", ")


  - Create a new view (HTML PAGE) that will display a list of all of our saved tags
    - This list should be clickable i.e. if the tag 'puppies' is on the list, I should be able to click the tag and be taken to a page showing me pictures tagged with 'puppies'
- **Things to Consider**:
  - It may be tempting to continue working off of your code for yesterday, but its never a bad idea to start fresh. More practice is a good thing.
  - How will we able to 'save' the tags?
  - Have we learned anything in Ruby that can hold and contain information for us?
    - If so, how is this applicable to solving our problem?

###Part 3 - BONUS
- At this point, we should already be able to save tags that we find interesting, but what about individual pictures?
  - Add a button next to each picture that says "Save Picture"
  - Upon clicking that button, that individual picture will be saved