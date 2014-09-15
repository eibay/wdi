var http = require('http');
var fs = require('fs');

var boyBandMembers = [
 	{name: "Justin Timberlake", id: 1},
 	{name: "JC Chasez", id: 2},
 	{name: "Lance Bass", id: 3},
 	{name: "Joey Fatone", id: 4},
 	{name: "Chris Kirkpatrick", id: 5}
 	]
var members = ["Justin Bieber", "Chris Brown", "Brad Pitt"];


var server = http.createServer(function(request, response){
	var JSON_boybandmembers = JSON.stringify(boyBandMembers);

	var path = request["url"];
	var request = request["method"];
	var pathDynamic = path.split("/")[2]

members_in_json = JSON.stringify(boyBandMembers);


		if (path == "/user/create"){
			var newBoyBandMember = {}
			var random = Math.floor(Math.random()* ((members.length)-(members.length - 6)))
			newBoyBandMember["name"] = members[random]
			var newMemberId = boyBandMembers[boyBandMembers.length - 1]["id"]
			newBoyBandMember["id"] = parseInt(newMemberId) + 1

			members.push(newBoyBandMember)
			response.end(JSON.stringify(newBoyBandMember));
	} else if (path == "/user/" + pathDynamic){
		members.forEach(function(member))
		if members["id"] == pathDynamic
		response.end(JSON.stringify(members));

});

server.listen(2000);
