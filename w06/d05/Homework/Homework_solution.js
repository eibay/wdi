var http = require('http');
var fs = require("fs");


var server = http.createServer(function(request, response){
  var path = request['url'];
  var firstAfterSlash = path.split("/")[1]
  console.log(path)
  var msg = "";
  if (path == "/create/user"){
  	var person = createPerson()
	  person_in_json = JSON.stringify(person);
	  msg = person_in_json;

	}else if (path.split("/").length == 3 {
		msg = createPerson();
	}
	response.end(msg);
});

server.listen(2000);


var companies = [
  {name: "apple", location: "cupertino"},
  {name: "google", location: "mountain view"}
];







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
array = []
function createPerson(){
	new_hash = {}
	new_hash["first"] = first_initial[Math.floor(Math.random()*first_initial.length)];
	new_hash["second"] = middle_initial[Math.floor(Math.random()*middle_initial.length)];
	new_hash["third"] = last_initial[Math.floor(Math.random()*middle_initial.length)];
	new_hash["id"] = array.length + 1; 
	array.push(new_hash)
	return array 
}

var findCompanyByName = function(compName){
	i=0 
	while (i<companies.length){
		if (compName == companies[i]["name"]){
			array.push(companies[i])
		}i++
	} return array
}

var personById = funciton(id){
	for (var i=0; i<array.length;  )
}


