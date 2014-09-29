

function jokeFunc(){
  var jokes = ["what do you call cheese that's not yours? Nacho Cheese!", "Knock Knock, Who's there? Uhh..."];
  return jokes[parseInt((Math.random() * jokes.length))]
}

console.log(jokeFunc());
