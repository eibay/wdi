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