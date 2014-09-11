function makeTags(tag, word){
  var lt = "<" + tag + ">"
  var rt = "</" + tag + ">"
  console.log(lt + word + rt)
};

makeTags('i', 'Yay')
  // '<i>Yay</i>'
  makeTags('i', 'Hello')
  // '<i>Hello</i>'
  makeTags('cite', 'Yay')
  // '<cite>Yay</cite>'
