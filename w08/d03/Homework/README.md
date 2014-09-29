### Baby Names

Build an html table using twitter bootstrap that lists:

| Name | County | Gender | Count |
|------|--------|--------|-------|
|jennifer|westchester|F|23|
|brad|suffolk|M|55|

for each baby name in the `ny-public-names.json` file.

1. Build the table using erb - iterate through the json with ruby and generate all of the HTML on the server.
  * This should be on a per year basis `/2012`
  * `/2011`

2. JS - make a copy of your work and put the copy in a new folder called `baby_with_js`
  * Delete the code which renders the table server side, and instead make an ajax call (using jQuery ajax) to retrieve all of the baby names from your server after the page loads.
  * Then render the table dynamically in the DOM. You can use [underscore.js](http://underscorejs.org/) to work with the big JSON data structure.
  * Should also be year-paginated, ie `/2012` gives all the baby names in 2012...

**Bonus**

Make two dropdowns above the table, one for county and one for gender. When you select a county or gender from the list, the table data should be filtered dynamically (ie with JavaScript no refresh) to include only the data selected in the dropdown.
