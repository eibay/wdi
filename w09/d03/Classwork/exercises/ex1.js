var names = ["Tim", 'Jimmy Page', "Bob", "John", "Roger"]

function newArray(n) {

    var newNames = []

    for(var i = 0; i < n.length; i++) {

        newNames.push("Hello " + n[i].toUpperCase())

      }

       return newNames;

    }

console.log(newArray(names))
