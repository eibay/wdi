function sum10(num1, num2) {
	if (num1 == 10 || num2 == 10) {
		return true
	} else if (num1 + num2 == 10) {
		return true
	} else {
		return false
	}
}

ans = sum10(9, 10)

console.log(ans)

ans = sum10(9, 9)

console.log(ans)

ans = sum10(1, 9)

console.log(ans)