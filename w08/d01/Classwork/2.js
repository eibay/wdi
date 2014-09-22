function howBig(string){
	if(string.length < 3){
		return 'small';
	}else if(string.length > 5){
		return 'big';
	}else{
		return 'medium';
	}
}
console.log(howBig('aa'));
console.log(howBig('aaa'))
console.log(howBig('aaaaaa'))


