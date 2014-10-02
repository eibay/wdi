$.ajax({
  url: 'http://api.randomuser.me/',
  dataType: 'json',
  success: function(data){
  	var email = data["results"][0]["user"]["email"];
	var username = data["results"][0]["user"]["username"];
	var state = data["results"][0]["user"]["location"]["state"];
	var array = [email, username, state];
	for(var i = 0; i < array.length; i++){
		var ul = $('ul');
		var li = $("<li>" + array[i] + "</li>");
		ul.append(li);
	}
  }
});

