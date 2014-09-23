


function howbig(string){
  if (string.length) < 3){
  return "small"
} else if (string.length < 5 && string.length > 3){
  return "medium"
} else if (string.length > 5){
  return "big"
}

}