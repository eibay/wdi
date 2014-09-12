# Friday Lab 9/12/14

##Random User API

We will be creating a legit JSON-based API in Node that we hit from a ruby web app serving html to the user.

###Part 1: Serving JSON

Returning JSON from your server instead of HTML involves using the ```JSON.stringify``` method.

Here is a sample server, copy this into a javascript file and run it for yourself.

```js
var http = require('http');

var companies = [
  {name: "apple", location: "cupertino"},
  {name: "google", location: "mountain view"}
];

var server = http.createServer(function(request, response){
  companies_in_json = JSON.stringify(companies);
  response.end(companies_in_json);
});

server.listen(2000);
```
The key part here is ```JSON.stringify(companies)``` which turns the array of hashes into a string. This string is then spit back out to the browser just as we would with a string of html in ```response.end(companies_in_json)```.

####Exercise:
  - Modify this code to support two paths
  - ```GET /```
    - Should return every company in JSON (i.e. the same result as the original code sample)
  - ```GET /name```
    - Should return in JSON just the hash for the company of that name
    - ```/apple``` should return ```{name: "apple", location: "cupertino"}``` in JSON



###Part 2

####Node API
*Making our own RandomUser.me API*

This API will act like randomuser.me and return in JSON one newly created random user. **We are not using the actual randomuser.me API, we are creating our own better version.** The user's should fit a theme such as "Possible Future Game of Thrones Characters" or "Imaginary Boy Band Members".

**The API endpoints are**:
  - ```POST /user/create```
    - creates a new user and returns that users info in JSON
    - takes no parameters.
  - ```GET /user/user_id```
    - returns a single user's info given the user_id
  - ```GET /users```:
    - returns a paginated list of users that have been created in the system
    - Query Param: ```page_length```: how many users to return per page
    - Query Param: ```page_num```: the page number we are currently on
    - Example: ```GET /users?page_length=5&page_num=3``` would return the 11th  to 15th user in the system. This should return no users if there are less than 11 users in the system.

####Ruby Web App

This will be a web app to generate and view random users and then leave comments/notes about these random users
  - ```GET /```: The main page
    - List 5 users at a time
    - Have a button that creates a new random user and then redirects to that user's page
    - Each listed user should have a link to there page
  - ```GET /user/user_id```
    - Shows the information for that one randomly generated user
    - Allows the posting of a comment about this randomly generated user
    - Shows all previous comments

###Bonus
  1. Have your Node API persist it's users with ![](http://redis.io/images/redis.png)
