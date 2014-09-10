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


//######### RUBY CODE ###############//
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



// bottles of beer

function ninetyNine(container, item) {
  var i = 99;
  while(i < -1) {
    console.log(i + container + " of " + item + " on the wall!");
    console.log(i + container + " of " + item + "!");
    console.log("take one down, pass it around");
    console.log(i-1 + container + " of " + item + " on the wall");

    i = i - 1;
  };
};

ninetyNine("baskets", "eggs");
ninetyNine("bottles", "beer");



// while true infinite loop
while(true) {
  console.log("true");
};










