var fs = require('fs');
var titanic = fs.readFileSync('./titanic.txt');
titanic=titanic.toString().split(", ");
var inception=fs.readFileSync('./inception.txt');
inception=inception.toString().split(", ");
var similar=[]
// for(var i=0; i < titanic.length; i++){
// 	if(titanic[i]==inception[inception.indexOf(titanic[i])]){
// 	console.log(titanic[i])
// 	similar.push(titanic[i])
// 	}
// }
titanic.forEach(function(actor){
if(inception.indexOf(actor) != -1){
	console.log(actor)
	similar.push(actor)
}
});