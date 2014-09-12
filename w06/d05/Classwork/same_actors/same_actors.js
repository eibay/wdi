var fs = require('fs')
var castInception = fs.readFileSync('./inception.txt')
var castTitanic = fs.readFileSync('./titanic.txt')

castInception = castInception.toString();
castTitanic = castTitanic.toString();

// castInception = toString(castInception);
// castTitanic = toString(castTitanic);   //why doesnt this work??

// console.log(castTitanic + castInception);

var aryInception = castInception.split(", ");
var aryTitanic = castTitanic.split(", ");

console.log(aryInception + aryTitanic);


var compare = function(ary1, ary2) {
	var listCommon = []
	ary1.forEach(function(actor) {
		for(i=0; i < ary2.length; i++) {
			if(actor == ary2[i]) {
				listCommon.push(actor);
			}
		}
	})
	console.log(listCommon);
}

compare(aryInception, aryTitanic);



// aryInception = castInception.forEach(function(actor) { 
// 	aryInception.push(actor)
// });
	


// aryTitanic = castTitanic.forEach(function(actor) {
// 	aryTitanic.push(actor)
// });

// console.log(aryTitanic + aryInception)