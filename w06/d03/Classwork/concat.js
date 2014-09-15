var args = process.argv

function concat(ary) {
  str = ""
  for(i = 0; i < ary.length; i++) {
    str = str.concat(ary[i])
  };
  console.log(str);
};
debugger

concat(parseInt(args[2][0]), parseInt(args[2][1]), parseInt(args[2][2]));