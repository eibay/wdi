args=process.argv
function listNumbers(num1, num2){
for(var i= num1; i <= num2 ; i++){
	console.log(i)
}
}

listNumbers(parseInt(args[2]), parseInt(args[3]))


