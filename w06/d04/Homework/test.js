var cast_members = ["Joey", "Chandler", "Monica", "Ross", "Rachel", "Pheobe"]
		
function html_cast(tag, character){
	"<" + tag + ">" + character + "</" + tag + ">"
}
var array = []
x= 0 
while (x < cast_members) {
	var character = html_cast(li, cast_members[x])
	array.push(character)
	x += 1	
} return array 