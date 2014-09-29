function tellJoke(name){
	return name+' ,You wanna here a joke? Your face';
}

console.log(tellJoke('Conor'))


function hello(name){

	return 'Hello '+name;
}

console.log(hello('Conor'))


function helloEveryone(names){
	names.forEach(function(name){
		console.log('Hello '+ name)
	})
}

helloEveryone(['conor', 'steven', 'paul', 'john'])

function returnHello(names){
	var greetings=[];

	names.forEach(function(name){

		greetings.push('Hello '+ name)	

	})

	return greetings

}

console.log(returnHello(['conor', 'steven', 'paul', 'john']))

function double(num){
	return num*2

}

console.log(double(2))


function quadruple(num){

	return double(num)*2;

}

console.log(quadruple(4))

var coolDudes={conor:'blue', steven:'green', paul: 'yellow', john:'mauve'}
var coolDudes2={jimmy: 'purple', kyle: 'orange', brendan:'rose'}

function favColors(colors){
	var names = Object.keys(colors);
	names.forEach(function(name){

		console.log(name+'\'s favorite color is ' + colors[name])
	})
}

favColors(coolDudes)

function combine(hash1, hash2){
	
	var first=Object.keys(hash1)
	first.forEach(function(combine){
		hash2[combine]=hash1[combine]
	})
	return hash2
}

combine(coolDudes, coolDudes2)









