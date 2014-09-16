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
	array.push(new_hash)
	return array 
}


console.log(createPerson())

