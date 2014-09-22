function howBig(str) {
	if (str.length < 3) 
		return "small";
	else if (str.length >= 3 && str.length <= 5) 
		return "medium";
	else 
		return "big"; 
}