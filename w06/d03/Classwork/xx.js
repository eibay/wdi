// # Count the number of "xx" in the given string. We'll say that overlapping is allowed, so "xxx" contains 2 "xx".

// #   count_xx("abcxx")
// #   // 1
// #   count_xx("xxx")
// #   // 2
// #   count_xx("xxxx")
// #   // 3

function count_xx(str) {
  var i = 0;

  var output = 0;

  while (i < str.length) {
    if (str.charAt(i) == 'x' && str.charAt(i+1) == 'x') {
        output += 1
    }
    i +=1;
  }
  return output;
};

console.log(count_xx("abcxx"));

console.log(count_xx("xxx"));

console.log(count_xx("xxxx"));