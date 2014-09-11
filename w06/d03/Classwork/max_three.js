function max_three(a, b, c){
	if (a>b && a>c){
		return a
	}else if (b>a && b>c){
		return b
	}else {
		return c
	}
}


	console.log(max_three(2,5,8));
	console.log(max_three(8,0,1));
	console.log(max_three(3,10,8));