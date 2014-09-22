function howbig(string) {
	if(string.length < 3){
		return 'small';
	} else if(string < 6){
		return 'medium';
	} else {
		return 'big';
	}
}