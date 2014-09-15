
console.log('hello')

function count_xx(str){
	var i = 0;

	var john = 0;
	while (i<str.length) {

		if (str.charAt(i) == 'x' && str.charAt(i+1) == 'x') {
        john += 1;
		}

     i+=1;
   }

   return john;
}

var num = count_xx("seanxxx");
var msg = 'the answer is' + num;
console.log(msg);

