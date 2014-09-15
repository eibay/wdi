// 8. Write a function `filterLongWords` that takes an array of words and an integer i and returns the array of words that are longer than i.

//   ```javascript
//   filterLongWords(3, ["hello", "hi", "hey", "hola", "aloha"])
//   // ["hello", "hola", "aloha"]
//   ```

i = 0
solution =[]
var filterLongWords = function(number, array){
	while (i < array.length);{
		if (array[i].length > parseInt(number));
			return solution.push(array);
		};	i +=1
};

console.log(filterLongWords(3, ["hello", "hi", "hey", "hola", "aloha"]));
