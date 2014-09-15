args=process.argv
fs=require('fs');



	
	fs.readFile(args[2], function(err, data){

			var count=data.toString().split("\n").length-1;

			console.log(count);

	});



