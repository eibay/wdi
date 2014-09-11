var args = process.argv

function inbetween(a,b) {
	i = (a + 1);
	while (i < b) {
	console.log(i);
	i += 1}
}
inbetween(parseInt(args[2]), parseInt(args[3]))
