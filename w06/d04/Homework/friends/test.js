path.(split(?))[0]

	var path = 'hello?name=yaniv'
	var thing = path.split('?')[0];


	path needs to be '/hello'

// var rand = Math.floor(Math.random() * 5);
// var cast = ['Jennifer Aniston', 'Courteney Cox', 'Lisa Kudrow', 'Matt LeBlanc', 'Matthew Perry', 'David Schwimmer'];
// character = cast[rand];

// thing = ("<html><body><h2>" + character + "</h2></body></html>");


var cast = ['Jennifer Aniston', 'Courteney Cox', 'Lisa Kudrow', 'Matt LeBlanc', 'Matthew Perry', 'David Schwimmer'];

var taggedString = [];
i = 0;

while (i < cast.length) {
	taggedString.push('<li>' + cast[i]+ '</li>');
	i += 1;
}

var html = taggedString.join();
html = html.replace(/,/g, '');

thing = ("<html><body><ul>" + html + "</ul></body></html>");

console.log(thing);


// var cast = ['Jennifer Aniston', 'Courteney Cox', 'Lisa Kudrow', 'Matt LeBlanc', 'Matthew Perry', 'David Schwimmer'];
// var taggedString = [];
// i = 0;

// while (i < cast.length) {
// 	taggedString.push('<li>' + cast[i]+ '</li>');
// 	i += 1;
// }

// var html = taggedString.join();
// html = html.replace(/,/g, '');

// thing = ("<html><body><ul>" + html + "</ul></body></html>");

// console.log(thing);




// Jennifer Aniston, Rachel Green
// Courteney Cox, Monica Geller 
// Lisa Kudrow, Phoebe Buffay
// Matt LeBlanc, Joey Tribbiani
// Matthew Perry, Chandler Bing
// David Schwimmer, Ross Geller 