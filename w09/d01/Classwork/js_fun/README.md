1. Write a function that takes an array of integers and an integer as arguments. The function should return true if the given integer appears in the array, and false if it does not. **do not use [].indexOf**

  Ie.

  ```javascript
  inArray([2,4,5], 4);
  // true

  inArray([8,3,4], 7);
  // false
  ```

2. AJAX/DOM 
  
  1. Simple
    * Create an html page and a button.
    * When you press the button you should see a list with names and street address of 10 wifi hotspots in NYC.
      * Make an ajax call to this endpoint to get the wifi hotspot data - `https://data.cityofnewyork.us/api/views/4u6b-frhh/rows.json`

  2. Challenge
    * Create an input tag
    * When a user enters a zip code in the input box they should see up to 10 wifi hotspots in that zip code
    * This filtering should happen on "keyups"