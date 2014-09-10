
function posNeg(num1, num2, boolean) {
	if(boolean==true){
		if((num1 < 0)&&(num2 < 0)) {
			return true
		} else {
			return false
		}
	} else{
	if(num1*num2 < 0)
	{
		return true
	} else {
		return false
	}
}
};
 // console.log(posNeg(1, -1, false));
 //  // true
 //  console.log(posNeg(1, 1, false));
 //  // false
 //  console.log(posNeg(1, 1, true));
 //  // false
 //  console.log(posNeg(-3, -1, true));
 //  //true
 function count_xx(string) {
 	var array=string.split("")
 	var prev_letter=""
 	count=0
 	for(i=0; i<array.length; i++) {
 		if (array[i]=="x" && prev_letter=="x") {
 			count=count+1;
 			prev_letter=array[i];
 		} else {
 			prev_letter=array[i];
 		}
	}
 	return count
 }






console.log(count_xx("xxabbcxxix"))

