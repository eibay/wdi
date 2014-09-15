var body = "";
		
		request.on('data', function(chunk) {
			body += chunk;
		});

		request.on('end', function(){
			console.log("POSTED: " + body);
			response.end("Anything");
		});