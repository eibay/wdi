function inArray(array, number){
	for(var i = 0; i < array.length; i++){
		if(array[i]==number){
			return true
		}
	}

	return false
}

console.log(inArray([2,4,5], 4))
console.log(inArray([8,3,4], 7))
