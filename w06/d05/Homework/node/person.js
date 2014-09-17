var users []

function createPerson(first_name, adjective) {
var first_names = ["Dexter", "Lancelot", "Chad", "Juliet", "Carrie", "Maximillion", "Chastity", "Deborah", "Emmet"];
var adjectives = ["Bold", "Brave", "Fierce", "Lillylivered", "Intrepid", "Pugnacious", "Intransigent"];

if (path == "/user/create" && method == "POST") {
		var first_name = first_names[Math.floor(Math.random()*first_names.length)];
		var adjective = adjectives[Math.floor(Math.random()*adjectives.length)];
		var name = first_name  + " the " + adjective;

		var new_user = {
			id: current_id,
			name: name
		}

		users.push(new_user);
		current_id++;

		response.end(JSON.stringify(new_user));

	} else {
		response.end("<h1>ERROR</h1>");
	};

});
