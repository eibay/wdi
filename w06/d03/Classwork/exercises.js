// function posNeg(a, b, bool) {
// 	if(a > 0 && b < 0 || a < 0 && b > 0) {
// 		console.log(true);
// 	} else if(a > 0 && b > 0) {
// 		console.log(false);
// 	} else if(a < 0 && b < 0 && bool == true) {
// 		console.log(true);
// 	} else {
// 		console.log(false);
// 	};
// }

// function posNeg(num1, num2)
// 	var product = num1 * num2;

// 	if (product < 0) {
// 		return true
// 	} else {
// 		return false
// 	};
// };

// posNeg(1, -1, false)
//   // true
// posNeg(1, 1, false)
//   // false
// posNeg(1, 1, true)
//   // false
// posNeg(-3, -1, true)
  //true

///
function count_xx(string) {
	var str = string;
	var count = 0;

	if(str.search("xx") == -1) {
			return 0; 
	} else if(str.search("xx")) {
			for (i = 0; i < str.length; i++) {
				if(str.search("xx", i)); {
					count++;
				}
			}
	}
	return count;
};

console.log(count_xx("abcxx"));
    // 1
console.log(count_xx("xxx"));
    // 2
console.log(count_xx("xxxx"));
    // 3