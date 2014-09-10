// ruby
// def number(num1, num2)
// 	if num1 || num2 > 0
// 		return "true"
// 	else 
// 		return "false"
// end
// end
// number(1, -1)
// number(-1, 1)
// number(-4, -5)

///////// Positive Negative Exercise: ///////// 

// part 1
// function number(num1, num2) {
// 	if (num1 > 0 || num2 > 0)  
// 		{ console.log("true"); 
// 		}
// 	else
// 		{ console.log("false");
// 	};
// };
// number (1, -1)
// number (-1, 1)
// number (-4, -5)


//part 2
// function number(num1, num2, condition){
// 	var product = num1 * num2;

// 	if (product < 0 && condition == false){
// 		return true
// 	} else if (num1 < 0 && num2 < 0 && condition == true  ) {
// 		return true
// 	} else {
// 		return false
// 	};
// };
// number(1, -1, false)
// number(1, 1, false)
// number(1, 1, true)
// number(-3, -1, true)

///////// Count xx Exercise ///////// 
  // count_xx("abcxx")
  // // 1
  // count_xx("xxx")
  // // 2
  // count_xx("xxxx")
  // // 3

function count_xx(str){
	var string = str.split("");

};
count_xx("abcxx")
count_xx("xxx")
count_xx("xxxx")