function initials(name){
  var nameArray = name.split(" ");
  var initials = [];
  var index = 0;
  while (index < nameArray.length){
    var initial = nameArray[index].charAt(0);
    initials.push(initial);
    index++;
  }
  console.log(initials.join());
};

initials('Neel Jayendra Patel')
