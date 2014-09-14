var http = require('http');
var redis= require('redis')

var client = redis.createClient();

var characters = [
	{name: "Fred Flinstone", age: "40",  id: 1},
	{name: "Barey Rumble", age: "39", id: 2},
	{name: "Steve Rogers", age: "89", id: 3},
	{name: "Bruce Wayne", age: "38", id: 4},
	{name: "Frodo", age: "28", id:5},
	{name: "Homer Simpson", age: "40", id: 6}
	];


client.on('connect', function () {
		console.log("Redis Connected")
  });


var server = http.createServer(function(req, res){




	if(req.url=="/user/create" && req.method=="POST"){

		

		var names = ["Joe", "Bob", "Arnold", "Goku", "Steve", "Loser", "CoolGuy", "FFFF"];
		var ages = ["20", "30", "40", "80", "40", "20", "90", "60"];
		var rand_name=Math.floor(Math.random() * (names.length));
		var rand_age=Math.floor(Math.random() * (ages.length));
		rand_name=names[rand_name];
		rand_age=ages[rand_age];
		client.get("characters", function(err, characters){

				var array=JSON.parse(characters);
				var new_character={name: rand_name, age: rand_age, id: array.length+1};
				array.push(new_character);
				new_json=JSON.stringify(array);
				client.del("characters");
				client.set("characters", new_json, redis.print);
				res.end(JSON.stringify(new_character));
				

		});
		
		
	}

	else if(req.url.split("/")[1]=="user"){

	

		var user_id=parseInt(req.url.split("/")[2]);
			var character="";
		client.get("characters", function(err, json_return){
			
			var array=JSON.parse(json_return);
		
			array.forEach(function(the_character){
				
					var character="";

				if(the_character["id"]==user_id){

					
					res.end(JSON.stringify(the_character))
					

				}
			});
		});

		

				


}

	else if(req.url.indexOf("users"))
	{
		
		var params=req.url.split("?");
		var page_length=req.url.split("page_length=")[1];
		var page_num=req.url.split("page=")[1];


		if(page_num != 1){
		var results_start=(parseInt(page_length))*(parseInt(page_num)-1);
		var results_finish=(parseInt(page_num)*parseInt(page_length))-1;
	}
	else
	{
		var results_start=0;
		var results_finish=parseInt(page_length)-1;
	}
	debugger;

		client.get("characters", function(err, json_return){

			array=JSON.parse(json_return);

	

			if(array.length < results_start){


				res.end(JSON.stringify("There are not this many users to return"))
			}
			else
			{

					var new_array=[];
					for(var i=results_start; i <= results_finish; i++)
					{

						debugger;
							if(array[i] != null){
							new_array.push(array[i])
						}


					}

					res.end(JSON.stringify(new_array))


			}



	});
	}




});




server.listen(3000);
