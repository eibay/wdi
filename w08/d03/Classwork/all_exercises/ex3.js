
function sayHello(){
  arrNames = process.argv;
  arrNames = arrNames.splice(2);
  for(var j=0;j<arrNames.length;j++){
    console.log("Hello " + arrNames[j]);
  }
}


sayHello();
