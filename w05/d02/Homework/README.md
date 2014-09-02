##Week05 Day02
---

###ActiveRecord and Algorithms

**Part 1**:
**Write a command line app that prints prime numbers**
- Print the prime numbers between 1-100
- Do not just copy and paste these numbers, you should programmatically determine which numbers are prime
- Your program should run once and then exit
- Here is a snippet of sample output:
```
2
3
5
7
9
11
13
...
```

**Part 2**:
**Persist Numbers**

**Make a model that holds just a single number**
- Use ActiveRecord for persistance
- Do not add anything to your model that is unnecessary

**Create ```add_nums.rb``` to add numbers to the database**
- generates 30 random numbers and saves them to the database
- numbers do not need to be prime
- this should output an error and quit if there are already numbers in the database
- **result:** running ```ruby add_nums.rb``` should add 30 numbers to the database

**Create ```remove_nums.rb``` to remove numbers from the database**
- automatically removes all numbers from the database
- this should leave your table of numbers completely empty
- be sure there are no errors if the table of numbers is already empty
- **result:** running ```ruby remove_nums.rb``` should remove all persisted numbers

**Create a ```print_nums.rb``` that prints the persisted numbers that are prime**
- Add the instance method ```isPrime``` to your number model
- Print all numbers in the database that are prime using the ```isPrime``` instance method
- Make sure to sort the numbers in descending order (highest to lowest)
- Your program should run once and then exit
- **result:** running ```ruby print_nums.rb``` should print all persisted prime numbers

You should now be able to repeatedly run these three programs in order without errors:
```
ruby remove_nums.rb
ruby add_nums.rb
ruby print_nums.rb
```

---
###Part 2 Algorithms

1. Count the number of "xx" in the given string. We'll say that overlapping is allowed, so "xxx" contains 2 "xx".

  ```ruby
  count_xx("abcxx")
  #=> 1
  count_xx("xxx")
  #=> 2
  count_xx("xxxx")
  #=> 3
  ```

2. We want make a package of **goal** kilos of chocolate. We have small bars (1 kilo each) and big bars (5 kilos each). Return the number of small bars to use, assuming we always use big bars before small bars. Return -1 if it can't be done.

  ```ruby
  def make_chocolate(small, big, goal)
    # your code here
  end

  make_chocolate(4, 1, 9)
  #=> 4
  make_chocolate(4, 1, 10)
  #=> -1
  make_chocolate(4, 1, 7)
  #=> 2
  ```

3. Return an array that contains the exact same numbers as the given array, but rearranged so that all the zeros are grouped at the start of the array. The order of the non-zero numbers does not matter. So [1, 0, 0, 1] becomes [0 ,0, 1, 1]. You may modify and return the given array or make a new array.

  ```ruby
  zeroFront([1, 0, 0, 1])
  #=> [0, 0, 1, 1]
  zeroFront([0, 1, 1, 0, 1])
  #=> [0, 0, 1, 1, 1]
  zeroFront([1, 0})
  #=> [0, 1]
  ```
4. Write a method called `countr` that takes a string and returns the sum of each of it's letters position in the alphabet
  - *EXAMPLE:*
    - Calling the method with a string of "dog" would return `24` because "d" is 4th letter in the alphabet, "o" is the 14th, and "g" is the 7th. Adding all of these numbers together results in `24`

  ```ruby
  def countr(string, alphabet)
    # enter your code here
  end

  countr("dog", alphabet)
  #=> 24
  ```

5. Write a method called 'palindrome' that takes a string and checks if that string is a palindrome. If it is, have it return `true`, otherwise have it return `false`
  - *EXAMPLE:*

  ```ruby
  def palindrome(string)
    # enter your code here
  end

  palindrome("hello")
  #=> false

  palindrome("racecar")
  #=> true
  ```
