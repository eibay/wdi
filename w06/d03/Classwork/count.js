function count_xx(str){
  if (str.match("xx") != undefined){
    console.log(str.match("xx")[0])
  }

  for (j in str){
    console.log(str.match("x"))
  }
};


count_xx("xxxxxx marks the spot.")
