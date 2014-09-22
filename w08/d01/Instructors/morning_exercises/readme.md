# Javascript Exercises

1. write a function ```makeArray``` that takes 2 words as parameters and returns an array of those 2 words
2. write a function ```howbig``` that takes a string as a parameter. The function returns:
  - "small" if the string is less than 3 characters long
  - "medium" if it is between 3 and 5 characters long
  - "big" if it is greater than 5 characters long
3. write a function ```stringInfo``` that takes a string as a parameter and returns a hash with the following key-value pairs:
  - key: ```length```, value: the string's length
  - key: ```original```, value: the string itself
  - key: ```splitBySlash```, value: the string split by the ```"/"``` string
4. The basic structure of a request to an api in node is:
```javascript
request(url, function (error, response, body) {
     //code goes here
});
```
Imagine an api endpoint at ```www.dummyapi.com/cats``` that returns an array of cat names, like ```['fluffy', 'snickers', 'hairball']``` in JSON.
  - write a request to this api that prints to the terminal the number of cat names returned.
  - NOTE: to parse JSON in javascript we can use the method ```JSON.parse```
