Reflection  
========== 

`ActiveRecord` vs. `model.rb` 
-----------------------------

`model.rb` is a pedagogic tool, written by Jeff, Sean & Neel to help make `ActiveRecord`'s magic less confusing on our information-overloaded brains. 

Just as our classes which inherited from `model.rb` thus gained the ability to interface w/ a text file containing an array of JSON data, `ActiveRecord` will send queries to PostgreSQL, which will handle organization of our data in a more sophistocated way than simple JSON text makes possible. 

For example, w/ PostgreSQL, retrieving data from a db will be more efficent than when we had to load the JSON entire file in order to get the material we needed. Furthermore, PostgreSQL is more efficient because finding an object inside an array is often a longer operation than finding it inside a relational database, which behaves more like a hash. Furthermore, PostgreSQL will keep track of history.  

Dude, like, what is `ActiveRecord` *DOING*?! 
--------------------------------------------

`ActiveRecord`'s primary functionality to create ruby classes whose objects have SQL queries associated w/ their attributes. It can also send these SQL queries to the db associated w/ the application, thus to record them. 