// ### JS Exercises

// http://autotelicum.github.io/Smooth-CoffeeScript/literate/js-intro.html

// 1. Positive Negative

//   Given 2 integers, return true if one is negative and one is positive.

//   ```javascript
//   posNeg(1, -1)
//   // true
//   posNeg(-1, 1)
//   // true
//   posNeg(-4, -5)
//   // false
//   ```

//   Enhancement: Given 2 integers, return true if one is negative and one is positive 
//   **except** if the third argument is true, then return true only if both are negative.

//   ```javascript
//   posNeg(1, -1, false)
//   // true
//   posNeg(1, 1, false)
//   // false
//   posNeg(1, 1, true)
//   // false
//   posNeg(-3, -1, true)
//   //true
//   ```


  function posNeg(num1, num2) 
  {
    if ((num1 > 0 && num2 < 0) || (num1 < 0 && num2 > 0)) 
    {
      return true;
    }
    else 
    { 
      return false;
    };
  };

  posNeg(1, -1)
  posNeg(-1, 1)
  posNeg(-4, -5)



function posNeg2(num1, num2, veracity)
{
  if (veracity == true)
  {
    if (num1 < 0 && num2 < 0)
    {
      return true;
    };
  }
  else
  {
    if ((num1 > 0 && num2 < 0) || (num1 < 0 && num2 > 0)) 
    {
      return true;
    }
    else
    {
      return false;
    };
  };
};

posNeg2(1, -1, false)
  // true
  posNeg2(1, 1, false)
  // false
  posNeg2(1, 1, true)
  // false
  posNeg2(-3, -1, true)
  //true






function posNeg(x, y, truth) {
  if (x * y < 0) {
    console.log(true)
  }
  else {
    console.log(false)
  };
};


// ######### RUBY CODE ###############//
// def count_xx(string)
//   spling = string.split("")
//   i = 0
//   count = 0

//   while i < string.length
//     if spling[i] == "x" && spling[i+1] == "x"
//       count += 1
//     end
//     i += 1
//   end
//   return count

// end



function countXX(str) {
  var spling = str.split("");
  var i = 0;
  var count = 0;

  while(i < str.length) {
    if ((spling[i] == "x") && (spling[i+1] == "x")) {
      count = count + 1;
    };
    i = i + 1;
  };
  console.log(count);

};

countXX("xx"); //#=> 2
countXX("xxx"); //#=> 3
countXX("xxxx"); //#=> 4

countXX("xx0000000000000xx"); //#=> 2
countXX("xxx0000000xx"); //#=> 3
countXX("xseanxxx"); //#=> 2


// bottles of beer

function ninetyNine(container, item) {
  var i = 99;
  while(i > 0) {
    console.log(i + " " + container + " of " + item + " on the wall!");
    console.log(i + " " +  container + " of " + item + "!");
    console.log("take one down, pass it around");
    console.log(i-1 + " " +  container + " of " + item + " on the wall");

    i = i - 1;
  };
};

ninetyNine("baskets", "eggs");
ninetyNine("bottles", "beer");



// while true infinite loop
while(true) {
  console.log("true");
};


//3
  // Given 2 integers, return true if one if them is 10 or if their sum is 10.

  // ```javascript
  // makes10(9, 10)
  // // true
  // makes10(9, 9)
  // // false
  // makes10(1, 9)
  // // true
  // ```

function makes10(x, y) {
  if((x == 10) || (y == 10)) {
    console.log("true")
  }
  else if(x + y == 10) {
    console.log("true")
  }
  else {
    console.log("false")
  }
}
makes10(10, 5)
makes10(5,10)
makes10(5,5)
makes10(5,3)



//4
String Without End


  Given a string, return a version without the first and last char, 
  so "Hello" yields "ell". The given string length should be at 
  least 2.


  ```javascript
  withoutEnd('Hello')
  // 'ell'
  withoutEnd('java')
  // 'av'
  withoutEnd('coding')
  // 'odin'
  ```

function withoutEnd(str) {
  if(str.length > 1) {
    var x = str.split("")
    var i = 0
    var ary = []

    while(i < str.length - 2) {
      ary.push(x[i+1])
      i = i + 1
    }
    ary = ary.join("")
  }
  console.log(ary)
}

withoutEnd("hello")
withoutEnd('java')
withoutEnd('coding')
withoutEnd("ul")



//5
5. Make Tags

  The web is built with HTML strings like "<i>Yay</i>" 
  which draws Yay as italic text. In this example, the "i" 
  tag makes <i> and </i> which surround the word "Yay". 
  Given tag and word strings, create the HTML string with 
  tags around the word, e.g. "<i>Yay</i>".

  ```javascript
  makeTags('i', 'Yay')
  // '<i>Yay</i>'
  makeTags('i', 'Hello')
  // '<i>Hello</i>'
  makeTags('cite', 'Yay')
  // '<cite>Yay</cite>'
  ```

function makeTags(tag, text) {
  console.log("<"+tag+">"+text+"<"+tag+">");
}
makeTags('i', 'Yay')
makeTags('i', 'Hello')
makeTags('cite', 'Yay')



//6
// 6. Define a function `maxOfThree` that takes three numbers as 
// arguments and returns the largest of them

//   ```javascript
//   maxOfThree(1, 4, 6)
//   // 6
//   ```
function maxOfThree(x,y,z) {
  console.log(Math.max(x,y,z));
};
maxOfThree(1, 4, 6)



function maxOfThree(x,y,z) {
  mx = [x,y,z]
  for(i=0; i < arguments.length; i++) {
    if(mx[0] < mx[1]) {
      mx.push(mx[0])
      mx.splice(0,1)
    }
  }
  console.log(mx[0])
  console.log("rearranged array: " + mx)
}
maxOfThree(1, 4, 6)
maxOfThree(6,4,1)
maxOfThree(4,6,1)
maxOfThree(1,6,4)

maxOfThree(1,2,3,4,5)




//7
// 7. Write a command line app that takes 2 numbers and 
// prints every number in between

//   ```bash
//   $ inbetween 2 6
//   # 3
//   # 4
//   # 5
//   ```

var args = altTwixt.argv //["node" "filename.js" "x" "y"]
function altTwixt(x,y) {
  var i = 1;
  while(i < y - x) {
    console.log(x+i)
    i = i + 1;
  }
}

altTwixt(parseInt(args[2]), parseInt(args[3]));

altTwixt(2,6)

//8
// 8. Write a function `filterLongWords` that takes an array of words and 
// an integer i and returns the array of words that are longer than i.

//   ```javascript
//   filterLongWords(3, ["hello", "hi", "hey", "hola", "aloha"])
//   // ["hello", "hola", "aloha"]
//   ```
function filterLongWords(x, aryWords) {
  var i = 0;
  var output = [];
  while(i < aryWords.length) {
    if(aryWords[i].length > x) {
      output.push(aryWords[i]);
      
    }
    i = i + 1;
  }
  console.log(output);
}
filterLongWords(3, ["hello", "hi", "hey", "hola", "aloha"])



function filterLongWords(int, array) {
        list = []
        for(var i = 0; i < array.length; i++) {
                if(array[i].length > int) {
                        list.push(array[i]);
                }
        }
        console.log(list);
}

//9
9. Define a function `initials that takes a persons name as input 
and returns their initials.

  Use loops for this instead of an enumerator like map.

  It should worked both with and without a middle name being provided.

  javascript
  initials('Neel Jayendra Patel');
  // NJP


function initials(str) {
  var spling = str.split(" ");
  var i = 0;
  var output = []
  while(i < str.length) {
    output.push(spling[i][0]);
    i = i + 1;
  }
  output = output.join("")
  console.log(output)
}
initials('Neel Jayendra Patel');

//10

// 10. Write a command line app that returns a name randomly chosen from the cast of friends

//   ```bash
//   $ cast
//   # Jennifer Anniston
//   $ cast
//   # Mathew Perry
  ```
// function randomName(ary) {
//   console.log(ary(rand(ary.length)))
// }

// randomName(["rachel", "jennifer"]);
// //object is not a function


//11
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
  
  //11.1
  console.log(firstnamelist[0]);
  //11.2
  firstnamelist.push("Peter");
  //11.3
  indexOfNameToRemove = firstnamelist.indexOf("Muffinmitts");
  firstnamelist.splice(8,1);
  //11.4
  lastnamelist.indexOf("Scratchnsniff");  
  //11.5
  randFirst = Math.floor(Math.random() * firstnamelist.length);
  randLast = Math.floor(Math.random() * lastnamelist.length);
  
  name = firstnamelist[randFirst] + " " + lastnamelist[randLast];


//12


12. Write a command line app that takes as arguments any number of words and 
prints out the concatenation of them (you may have to google concatenation)

  ```bash
  $ concat hello big world
  # hellobigworld
  ```
function concat(ary) {
  str = ""
  for(i = 0; i < ary.length; i++) {
    str = str.concat(ary[i])
  };
  console.log(str);
};
concat(["hello", "big", "world"]);


13. **Bonus** Write the same concatenation program as in #12 except that 
the arguments are files. Print out the concatenation of the content of 
these files. Can you figure out how to redirect the output of your 
program to a file from the command line (consult docs for file operations 
  in JS)

  ```bash
  $ concat ./file1.txt ./file2.txt
  # (CONTENTS OF FILE1)(CONTENTS OF FILE2)
  ```

14. **Bonus** Write a command line app that takes an English word 
as an argument and prints the amount of times that word was found in 
the text of Moby Dick.

  ```bash
  $ mobycount love
  # 31
  $ mobycount very
  # 945
  ```














