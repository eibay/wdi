var favColors = {
  cheryl: "blue",
  clayton: "blue", 
  conor: "blue", 
  tess: "blue", 
  sean: "red", 
  natassia: "purple", 
  nadia: "cerulean", 
  sylvia: "black",
  lady: "green"
}; 

function printColors(hash) {
  var keysArr = Object.keys(hash);
  for (var k = 0; k < keysArr.length; k++) {
    var str = keysArr[k] + " favorite color is " + hash[keysArr[k]]; 
    console.log(str); 
  } 
}