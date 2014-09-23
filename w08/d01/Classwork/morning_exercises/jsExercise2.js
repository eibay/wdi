function howBig(string){
	if(string.length < 3){
		return "small";
	}else if(string.length > 3 && string.length < 5){
		return "medium"
	}else{
		return "big"
	};
};