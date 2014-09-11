

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
function count_xx(string) {
 	var array=string.split("");
 	var prev_letter="";
 	var count=0;
 	for(i=0; i<array.length; i++) {
 		if (array[i]=="x" && prev_letter=="x") {
 			count+=1;
 		} 
 		prev_letter=array[i];
	}
 	return count
 }

 function makes10(num1, num2){
 if(num1==10 || num2==10 || num1+num2==10){
 	return true
 } else {
 	return false
 }
}

console.log(makes10(9, 10))
// true
console.log(makes10(9, 9))
// false
console.log(makes10(1, 9))
true

function withoutEnd(string){
	var str=string.substr(1).substr(0, string.length-1);
	return str
}
console.log(withoutEnd("hello"))


function makeTags(str1, str2){
	var new_str="<"+str1+">"+str2+"</"+str1+">";
	return new_str
}
console.log(makeTags("i", "hello"))

function maxOfThree(num1, num2, num3){
	var array=[num1, num2, num3];
	return Math.max.apply(Math, array)
}

console.log(maxOfThree(4,9,8))

function filterLongWords(num, array){
var new_array=[]
for (i=0; i < array.length; i++){
	if(array[i].length > num)	
	new_array.push(array[i])
}
return new_array
}

console.log(filterLongWords(3, ["hello", "hi", "hey", "hola", "aloha"]))



function initials(string){
	var array=string.split(" ")
	var initials=[]
	for (i=0; i < array.length; i++){
			initials.push(array[i].substr(0, 1))

		}

		return initials.join("")
}


console.log(initials('Neel Patel'))

















