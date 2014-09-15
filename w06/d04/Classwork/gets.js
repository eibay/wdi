#!/usr/local/bin/node

var readline=require ('readline');
var user_info={};

var input=readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
var fs=require('fs');
var hmm=require('fs')

input.question("what is your name?", function(accept){
	
		user_info['name']=accept

			input.question("where are you from?", function(accept){
				user_info['from']=accept
					input.question("How old are you?", function(accept){
						user_info['age']=accept
	
	input.close()
	

	console.log(JSON.stringify(user_info));
	var to_write=fs.createWriteStream('output.txt');
	to_write.write(JSON.stringify(user_info));
	var read = fs.readFileSync('./output.txt');
	console.log(JSON.parse(read));
});
});
});



	
// 	console.log("Hey you are "+user_info[0]+" from "+user_info[1]+" and you are "+user_info[2]+" years old");	









