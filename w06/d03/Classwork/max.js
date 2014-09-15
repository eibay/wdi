// function maxOfThree(num1, num2, num3) {

//   console.log(Math.max(num1, num2, num3));

// };

// maxOfThree(1, 4, 6)


function maxOfThree(num1, num2, num3) {

if (num1 > num2) {

    if (num1 > num3) {

      return num1

    } else {

      return num3

    };

} else {

    if(num2 > num3) {

      return num2

    } else {

        return num3

    }

}

};

 maxOfThree(1, 4, 6)