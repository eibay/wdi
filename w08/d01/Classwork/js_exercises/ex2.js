function howbig(string){
  if (string.length<3){
    return "small"
  } else if (string.length == 3 || string.length == 4 || string.length == 5){
    return "medium"
  } else if (string.length > 5){
    return "big"
  }
}
