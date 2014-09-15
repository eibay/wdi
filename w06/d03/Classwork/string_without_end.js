
// 4. String Without End


//   Given a string, return a version without the first and last char, so "Hello" yields "ell". The given string length should be at least 2.


//   ```javascript
//   withoutEnd('Hello')
//   // 'ell'
//   withoutEnd('java')
//   // 'av'
//   withoutEnd('coding')
//   // 'odin'
//   ```


var string_without_ends = function(str){
var length = str.length; {
	return str.substring(1, length-1)
	}
};

console.log(string_without_ends("Hello"));
console.log(string_without_ends("java"));
console.log(string_without_ends("coding"));
