var friends = ["Rachel Green", "Monica Geller", "Phoebe Buffay", "Chandler Bing", "Ross Geller", "Joey Tribbiani"]


var love = function(char){
  console.log("I love the character: " + char)
}

var myEach = function(arr, func){
  for (var i=0; i < arr.length; i++){
    func(arr[i]);
  }
};


myEach(friends, love);
