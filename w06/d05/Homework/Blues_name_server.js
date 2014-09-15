var http = require('http');

var first_initial = [
	"Fat",
	"Buddy",
	"Sitcky",
	"Old",
	"Texas",
	"Hollerin'",
	"Ugly",
	"Brown",
	"Happy",
	"Bone",
	"Curly",
	"Pretty",
	"Jailhouse",
	"Peg Leg",
	"Red",
	"Sleepy",
	"Bald",
	"Skinny",
	"Blind",
	"Big",
	"Yella",
	"Toothless",
	"Screamin'",
	"Fat Boy",
	"Washboard",
	"Steel-Eye",
]

var middle_initial = [
	"Bones",
	"Money",
	"Harp",
	"Legs",
	"Eyes",
	"Lemon",
	"Killer",
	"Hips",
	"Lips",
	"Fingers",
	"Boy",
	"Liver",
	"Gumbo",
	"Foot",
	"Mama",
	"Back",
	"Duke",
	"Dog",
	"Bad Boy",
	"Baby",
	"Chicken",
	"Pickles",
	"Sugar",
	"Willy",
	"Tooth",
	"Smoke"
]



var last_initial = [
	"Jackson",
	"McGee",
	"Hopkins",
	"Dupree",
	"Green",
	"Brown",
	"Jones",
	"Rivers",
	"Malone",
	"Washington",
	"Smith",
	"Parker",
	"Lee",
	"Thompkins",
	"King",
	"Bradly",
	"Hawkins",
	"Jefferson",
	"Davis",
	"Franklin",
	"White",
	"Jenkins",
	"Bailey",
	"Johnson",
	"Blue",
	"Allison"
]

var id = Array.apply(null, {length: 100}).map(Number.call, Number);


var all_names =[
	{"first":"Pretty","second":"Tooth","third":"Green","id":42},
	{"first":"Bald","second":"Lemon","third":"Rivers","id":44}
	]

var Blues_Name_random = function(){
	var blues_name = {};
	blues_name["first"] = first_initial[Math.floor(Math.random()*first_initial.length)];
	blues_name["second"] = middle_initial[Math.floor(Math.random()*middle_initial.length)];
	blues_name["third"] = last_initial[Math.floor(Math.random()*last_initial.length)];
	blues_name["id"] = id[Math.floor(Math.random()*id.length)];
	all_names.push(blues_name)
	var blues_name_JSON = JSON.stringify(all_names)
	return blues_name_JSON
}

var server = http.createServer(function(request, response){
	console.log("Connection from client has been made")
	var path = request["url"];
	var method = request["method"];


	console.log("Client is attempting to reach " + path + " with method  " + method)
	if (method == "POST" && path.split("/")[1] == "user" && path.split("/")[2] == "create"){
		var names = Blues_Name_random().toString()
		response.end(names)
	} // shows all Blues names created
		else if (method = "get" && path == '/'){
			var names = JSON.stringify(all_names)
			response.end(names)


	} // route /user/user_id
	 else if (path.split("/")[1] == 'user' && path.split("/").length == 3){
		var user_id = path.split("/")[2]
		debugger
		i = 0
		while (i < all_names.length){
			debugger
			if (all_names[i]["id"] == user_id){
				var specific_name = JSON.stringify(all_names[i])
				return specific_name
			} else{
				response.end("Error")
			} i++
		} response.end(specific_name)
	} 
	// else if (method = "GET" && path == '/users'){


	// }	
	else {
		
	}
})

server.listen(2000);








