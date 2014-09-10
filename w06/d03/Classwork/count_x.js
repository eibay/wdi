

// ruby: 
// def count_xx("thing")
// 	return thing.include?("xx")
// end 



function count_xx(thing){
	return ("thing".search("xx"));
}

a = "xxhelloxx"

console.log(count_xx(a))