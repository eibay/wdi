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



// var blues_name = first_initial["t"] + middle_initial["d"] + last_initial["s"]

// console.log(blues_name)


var blues_name = {};
var Blues_Name_random = function(){
	blues_name["first"] = first_initial[Math.floor(Math.random()*first_initial.length)];
	blues_name["second"] = middle_initial[Math.floor(Math.random()*middle_initial.length)];
	blues_name["third"] = last_initial[Math.floor(Math.random()*last_initial.length)];
	// blues_name["id"] = id[Math.floor(Math.random()*id.length)];
	blues_name_JSON = JSON.stringify(blues_name)
	return blues_name_JSON
}

console.log(Blues_Name_random())
// console.log(blues_name_JSON)



