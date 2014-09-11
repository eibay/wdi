

// ruby: 
// def count_xx("thing")
// 	return thing.include?("xx")
// end 


// return ("thing".search("xx"));


function count_xx(thing){
	var i = 0;
	var counter = 0;
	while (i < thing.length) {
		if (thing.charAt(i) == "x" && thing.charAt(i+1) == "x"){
			counter += 1;
		}		
		i += 1;
	}
	return counter
}

var num = count_xx("xxhelloxx");


var msg = "that answer is " + num;
console.log(msg)


