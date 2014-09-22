function howBig(str) {
	if (str.length>5) {
		console.log('big');
	} else if (str.length>3) {
		console.log('medium');
	} else {
		console.log('small');
	}
};

howBig('go');