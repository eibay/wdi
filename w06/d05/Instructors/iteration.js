// var list_item = "<li>{{name}}</li>";

// var i = 0;

// while (i < friends.length) {
//   list = list + "<li>" + friends[i] + "</li>";

//   i++
// };

// for (var i = 0; i < friends.length; i++) {
//   list = list + "<li>" + friends[i] + "</li>";
// };

var friends = ["Joey", "Phoebe", "Chandler", "Rachel", "Monica", "Ross"];

var list = "<html><body><ul>";

var shmee = function(monkey_eggs) {
  list = list + "<li>" + monkey_eggs + "</li>";
}

friends.forEach(shmee);


list = list + "</ul></body></html>";

console.log(list);






