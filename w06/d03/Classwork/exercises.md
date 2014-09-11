### JS Exercises

http://autotelicum.github.io/Smooth-CoffeeScript/literate/js-intro.html

1. Positive Negative

  Given 2 integers, return true if one is negative and one is positive.

  ```javascript
  posNeg(1, -1)
  // true
  posNeg(-1, 1)
  // true
  posNeg(-4, -5)
  // false
  ```

  Enhancement: Given 2 integers, return true if one is negative and one is positive **except** if the third argument is true, then return true only if both are negative.

  ```javascript
  posNeg(1, -1, false)
  // true
  posNeg(1, 1, false)
  // false
  posNeg(1, 1, true)
  // false
  posNeg(-3, -1, true)
  //true
  ```

2. Count xx

  Count the number of "xx" in the given string. We'll say that overlapping is allowed, so "xxx" contains 2 "xx".

  ```javascript
    count_xx("abcxx")
    // 1
    count_xx("xxx")
    // 2
    count_xx("xxxx")
    // 3
  ```

3. Sum 10

  Given 2 integers, return true if one if them is 10 or if their sum is 10.

  ```javascript
  makes10(9, 10)
  // true
  makes10(9, 9)
  // false
  makes10(1, 9)
  // true
  ```

4. String Without End


  Given a string, return a version without the first and last char, so "Hello" yields "ell". The given string length should be at least 2.


  ```javascript
  withoutEnd('Hello')
  // 'ell'
  withoutEnd('java')
  // 'av'
  withoutEnd('coding')
  // 'odin'
  ```

5. Make Tags

<<<<<<< HEAD
  The web is built with HTML strings like "<i>Yay</i>" which draws Yay as italic text. In this example, the "i" tag makes <i> and </i> which surround the word "Yay". Given tag and word strings, create the HTML string with tags around the word, e.g. "<i>Yay</i>".
=======
  The web is built with HTML strings like "<i>Yay</i>" which draws Yay as italic text. In this example, the "i" tag makes `<i>` and `</i>` which surround the word "Yay" -> `<i>Yay</i>`. Given tag and word strings, create the HTML string with tags around the word, e.g. "<i>Yay</i>".
>>>>>>> 78b08402659b1a693f563ecfbdead9c98a73a6d1

  ```javascript
  makeTags('i', 'Yay')
  // '<i>Yay</i>'
  makeTags('i', 'Hello')
  // '<i>Hello</i>'
  makeTags('cite', 'Yay')
  // '<cite>Yay</cite>'
  ```

6. Define a function `maxOfThree` that takes three numbers as arguments and returns the largest of them

  ```javascript
  maxOfThree(1, 4, 6)
  // 6
  ```

7. Write a command line app that takes 2 numbers and prints every number in between

  ```bash
  $ inbetween 2 6
  # 3
  # 4
  # 5
  ```

8. Write a function `filterLongWords` that takes an array of words and an integer i and returns the array of words that are longer than i.

  ```javascript
  filterLongWords(3, ["hello", "hi", "hey", "hola", "aloha"])
  // ["hello", "hola", "aloha"]
  ```

9. Define a function `initials` that takes a person's name as input and returns their initials.

  Use loops for this instead of an enumerator like map.

  It should worked both with and without a middle name being provided.

  ```javascript
  initials('Neel Jayendra Patel');
  // NJP
  ```

10. Write a command line app that returns a name randomly chosen from the cast of friends

  ```bash
  $ cast
  # Jennifer Anniston
  $ cast
  # Mathew Perry
<<<<<<< HEAD
=======
  ```

11. Namester
  1. Retrieve "Bumblebee" from the firstname list
  2. Add "Peter" to the firstnamelist
  3. Remove "Muffinmitts" from the firstnamelist
  4. Find out the index of "Scratchnsniff" in lastnamelist
  5. Combine 1 randomly selected name from `firstnamelist` and 1 randomly selected name from `lastnamelist` to form a name.
  6. Create a program that accepts how many random names a user would like as a command line argument. Then have it output that many random names.

  ```javascript
  firstnamelist = ["Bumblebee", "Banderscoop", "Broccoli", "Rinkydink", "Bombadil", "Boilerduck", "Bandicoot", "Fragglerock", "Muffinmitts", "Crumplesack", "Congleton", "Blubberbrains", "Buffalo", "Benadryl", "Butterfree", "Burberry", "Whippersnatch", "Buttermilk", "Beezlebub", "Budapest", "Boilerdang", "Blubberwhale", "Bumberstump", "Bulbasaur", "Cogglesnatch", "Liverswort", "Bodybuild", "Johnnycash", "Burgerking", "Bonaparte", "Bunsenburner", "Billiardball", "Baseballmitt", "Blubberbett", "Baseballbat", "Rumblesack", "Barister", "Danglerack", "Rinkydink", "Bombadil", "Honkytonk", "Billyray", "Bumbleshack", "Snorkeldink", "Anglerfish", "Beetlejuice", "Bedlington", "Bandicoot", "Boobytrap", "Bentobox", "Pallettown", "Wimbledon", "Hairyhog", "Buttercup", "Blasphemy", "Syphilis", "Snorkeldink", "Brandenburg", "Barbituate", "Snozzlebert", "Tiddleywomp", "Bouillabaisse", "Wellington", "Benetton", "Bendandsnap", "Timothy", "Brewery", "Bentobox", "Brandybuck"];

  lastnamelist = ["Coddleswort", "Curdlesnoot", "Calldispatch", "Humperdinck", "Rivendell", "Cuttlefish", "Lingerie", "Vegemite", "Ampersand", "Cumberbund", "Candycrush", "Clombyclomp", "Cragglethatch", "Nottinghill", "Cabbagepatch", "Camouflage","Creamsicle", "Curdlemilk", "Upperclass", "Frumblesnatch", "Crumplehorn", "Talisman", "Candlestick", "Chesterfield", "Bumbersplat", "Scratchnsniff", "Snugglesnatch", "Charizard", "Carrotstick", "Cumbertoot", "Crackerknack", "Crucifix", "Cuckatoo", "Crackletot", "Collywog", "Gigglesnort", "Capncrunch", "Covergirl", "Cumbersnatch", "Countryside","Coggleswort", "Splishnsplash", "Copperwire", "Animorph", "Curdledmilk", "Cheddarcheese", "Cottagecheese", "Crumplehorn", "Snickersbar", "Banglesnatch", "Stinkyrash", "Camelhump", "Chickenbroth", "Concubine", "Candygram", "Moldyspore", "Chuckecheese", "Cankersore", "Crimpysnitch", "Wafflesmack", "Chowderpants", "Toodlesnoot", "Clavichord", "Cuckooclock", "Oxfordshire", "Cumbersome", "Chickenstrips", "Battleship", "Commonwealth", "Cunningsnatch", "Custardbath", "Kryptonite"]
  ```
  
12. Write a command line app that takes as arguments any number of words and prints out the concatenation of them (you may have to google concatenation)

  ```bash
  $ concat hello big world
  # hellobigworld
  ```

13. **Bonus** Write the same concatenation program as in #12 except that the arguments are files. Print out the concatenation of the content of these files. Can you figure out how to redirect the output of your program to a file from the command line (consult docs for file operations in JS)

  ```bash
  $ concat ./file1.txt ./file2.txt
  # (CONTENTS OF FILE1)(CONTENTS OF FILE2)
  ```

14. **Bonus** Write a command line app that takes an English word as an argument and prints the amount of times that word was found in the text of Moby Dick.

  ```bash
  $ mobycount love
  # 31
  $ mobycount very
  # 945
>>>>>>> 78b08402659b1a693f563ecfbdead9c98a73a6d1
  ```