// 9. Define a function `initials` that takes a person's name as input and returns their initials.

//   Use loops for this instead of an enumerator like map.

//   It should worked both with and without a middle name being provided.

//   ```javascript
//   initials('Neel Jayendra Patel');
//   // NJP
//   ```


var initials = function(name){
	i= 0
	array_names = []
	var split_name = name.split(" "); 
	while (i < split_name.length){
		array_names.push(split_name[i].charAt(0));
			i+= 1;
	} 

	return array_names;
};

console.log(initials("Iris C Martinez"));