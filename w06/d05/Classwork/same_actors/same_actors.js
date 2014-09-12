var fs = require('fs');

var titanic_array = (fs.readFileSync("./titanic.txt").toString().split(", "));

var inception_array = (fs.readFileSync("./inception.txt").toString().split(", "));

  var compare = function(ary1, ary2) {
  var sameActor = []
  ary1.forEach(function(actor) {
    ary2.forEach(function(actor2){
      if(actor == actor2) {
        sameActor.push(actor2);
      }
    })
  })
  console.log(sameActor);
}

compare(titanic_array, inception_array);



 // console.log(titanic_array)

 // console.log(inception_array)

