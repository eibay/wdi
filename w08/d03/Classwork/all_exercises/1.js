function joker(){
	return 'I\'m gonna change my facebook username to NOBODY so that way when people post crappy posts,and i press the like button it will say NOBODY likes this'
}

console.log(joker());

function hello(name){
	return 'Hello ' + name;
}

console.log(hello('Eric'));

function hellos(namearray) {
	namearray.forEach(function(name){
		console.log(hello(name));
	});
}

hellos(['Eric', 'Maria', 'Conor', 'Clayton']);

function double(number) {
	return number * 2;
}

console.log(double(100));

function quadruple(number) {
	return double(double(number));
}

console.log(quadruple(4));

peopleColors = {eric: 'blue', maria: 'pink', conor: 'black', clayton: 'grey'};
function faveColors(hash) {
	var keys = Object.keys(hash);
	keys.forEach(function(key) {
		console.log(key + '\'s favorite color is ' + hash[key]);
	})
}
faveColors(peopleColors)

function combineHashes(hash1, hash2) {
	for(item in hash1) {
		hash2[item] = hash1[item];
	}
	return hash2;
}

people2Colors = {dan: 'red', crawford: 'purple', sho: 'green'}

console.log(combineHashes(peopleColors, people2Colors));


