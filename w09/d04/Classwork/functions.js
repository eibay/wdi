// 1) Write a function that returns a randomly selected name

// Do not change the inside of the function throughout, cant change the arguments it takes in the definition of the function.

// Make up the names of the array and if u call it five different times it shld return different names.

// 2) Part 2 has to call the first one

// Write JS in the browser to show 1 message box with a name(call the method you made in #1 to get the name)

// 3) Part three pops up when a button is clicked, not right away.

// Now have a button in html that pops up this message box when clicked.

// 4) u dynamically create the tags when clicked and not hardcoded.

// Now create a list of 5 <li> tags of random names when the button is clicked.

// Output - one name each time a different one.


// var names = ["Mr. Rogers", "Johnny Bananas", "Princess Consuela", "Superman", "Aquaman"]

// console.log(randomName(names))

// They have to provide a list of users to choose from but they can also change it. More customizable - ME

// They cant customzie the list of names from the outside - Janine

function randomName(x) {

  var name = x[Math.floor(Math.random()*x.length)];

  return name;

}



// Below is another way to do the same thing with slightly less customization for the user.

// function randomName() {

//   var names = ["Mr. Rogers", "Johnny Bananas", "Princess Consuela", "Superman", "Aquaman"]

//   var name = names[Math.floor(Math.random()*names.length)];

//   return name;

// }

// Index.html page version for the above commented code is only console.log(randomName())






// <!DOCTYPE html>
// <html lang="en">
// <head>
//   <meta charset="UTF-8">
//   <title>JS exercise</title>
//   <script src="functions.js"></script>
// </head>
// <body>

//   <!-- <button>Push for love</button> -->

//   <script type="text/javascript">

//   var names = ["Mr. Rogers", "Johnny Bananas", "Princess Consuela", "Superman", "Aquaman"]

//   var button = document.createElement("button")

//   button.innerText = "Search"
//   document.body.appendChild(button)



//     button.addEventListener("click", function() {

//       var name = randomName(names)

//       var ul = document.createElement("ul")
//       var li = document.createElement("li")
//       console.log(li)

//         li.innerText = name
//         ul.appendChild(li)
//         document.body.appendChild(ul)


//         alert(name)

// });


//   </script>

// </body>
// </html>


