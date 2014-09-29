function mergeObj(obj, otherObj) {
  for (var attr in otherObj) 
    obj[attr] = otherObj[attr];
  return obj; 
}