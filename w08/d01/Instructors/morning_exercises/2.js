function howbig(string){
	if (string.length < 3) {
		return 'small';
	} else if (string.length >= 3 && string.length <=5) {
		return 'medium';
	} else if (string.length > 5) {
		return 'big';
	}
}

console.log(howbig('elephant'));
console.log(howbig('me'));
console.log(howbig('dice'));
