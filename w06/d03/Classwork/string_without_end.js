// Given a string, return a version without the first and last char, so "Hello" yields "ell". The given string length should be at least 2.

// withoutEnd('Hello')
// // 'ell'
// withoutEnd('java')
// // 'av'
// withoutEnd('coding')
// // 'odin'

// Algorithm pseudocode :

// We have to strip the first and last characters from a string and return the output

function withoutEnd(str) {

  console.log(str.slice(1, -1))

};

withoutEnd('Hello')

withoutEnd('java')

withoutEnd('coding')


