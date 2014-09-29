function inArray(arr, n) {
  for (var idx = 0; idx < arr.length; idx++) {
    if (arr[idx] == n)
      return true; 
  }
  return false; 
}