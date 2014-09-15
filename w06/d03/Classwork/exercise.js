

// 3. Sum 10

//   Given 2 integers, return true if one if them is 10 or if their sum is 10.

//   ```javascript
//   makes10(9, 10)
//   // true
//   makes10(9, 9)
//   // false
//   makes10(1, 9)
//   // true
//   ```


var sum_10 = function(number_1, number_2){
	if (number_1 + number_2 == 10) {
		return true;
	} else if (number_1 == 10){
		return true;
	} else if (number_2 == 10){
		return true;
	} else 
		return false;
}
}


console.log(sum_10(9, 10));
console.log(sum_10(9, 9));
console.log(sum_10(1, 9));




// 5. Make Tags

//   The web is built with HTML strings like "<i>Yay</i>" which draws Yay as italic text. In this example, the "i" tag makes <i> and </i> which surround the word "Yay". Given tag and word strings, create the HTML string with tags around the word, e.g. "<i>Yay</i>".

//   ```javascript
//   makeTags('i', 'Yay')
//   // '<i>Yay</i>'
//   makeTags('i', 'Hello')
//   // '<i>Hello</i>'
//   makeTags('cite', 'Yay')
//   // '<cite>Yay</cite>'
//   ```

// 6. Define a function `maxOfThree` that takes three numbers as arguments and returns the largest of them

//   ```javascript
//   maxOfThree(1, 4, 6)
//   // 6
//   ```

// 7. Write a command line app that takes 2 numbers and prints every number in between

//   ```bash
//   $ inbetween 2 6
//   # 3
//   # 4
//   # 5
//   ```

// 8. Write a function `filterLongWords` that takes an array of words and an integer i and returns the array of words that are longer than i.

//   ```javascript
//   filterLongWords(3, ["hello", "hi", "hey", "hola", "aloha"])
//   // ["hello", "hola", "aloha"]
//   ```

// 9. Define a function `initials` that takes a person's name as input and returns their initials.

//   Use loops for this instead of an enumerator like map.

//   It should worked both with and without a middle name being provided.

//   ```javascript
//   initials('Neel Jayendra Patel');
//   // NJP
//   ```

// 10. Write a command line app that returns a name randomly chosen from the cast of friends

//   ```bash
//   $ cast
//   # Jennifer Anniston
//   $ cast
//   # Mathew Perry
  ```