function maxOfThree(int1, int2, int3) {
	var array = [int1, int2, int3]
	return array.sort()[2]
}

ans = maxOfThree(1, 4, 6)
console.log(ans)