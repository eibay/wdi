$.get( "/ny-baby-names.json", function(data) {
	var year = window.location.pathname.split('/')[1];

	var filter = _.filter(data["data"], function(baby){ 
		return baby[8] == year; 
	});
	var table = $(".babies")
	table.append('<tr><td>Name</td><td>County</td><td>Gender</td><td>Count</td></tr>')
	var counties=[];

	$('.container').prepend('<select class="counties"><option selected disabled hidden value="">Choose A County</option></select>')
	$('.container').prepend('<select class="gender"><option selected disabled hidden value="">Choose A Gender</option><option value="F">Female</option><option value="M">Male</option></select>')

	_.each(filter, function(baby){
		var tr = table.append(	'<tr><td>'+baby[9]+'</td><td>'+baby[10]+'</td><td>'+baby[11]+'</td><td>'+baby[12]+'</td></tr>');  
		if(counties.indexOf(baby[10]) == -1){
			counties.push(baby[10])
			$('.counties').append('<option value="'+baby[10]+'">'+baby[10]+'</option>')
		}
	});
	$('.counties').on('change', function(){

		var filterAgain=_.filter(filter, function(lessbabies){
			return lessbabies[10]==event.target.value
		})
		table.html('');
		_.each(filterAgain, function(babyagain){
			var tr = table.append(	'<tr><td>'+babyagain[9]+'</td><td>'+babyagain[10]+'</td><td>'+babyagain[11]+'</td><td>'+babyagain[12]+'</td></tr>')
		})
	});
		$('.gender').on('change', function(){
		var filterAgain=_.filter(filter, function(lessbabies){
			return lessbabies[11]==event.target.value
		})
		table.html('');
		_.each(filterAgain, function(babyagain){
			var tr = table.append(	'<tr><td>'+babyagain[9]+'</td><td>'+babyagain[10]+'</td><td>'+babyagain[11]+'</td><td>'+babyagain[12]+'</td></tr>')
		})
	});
});
