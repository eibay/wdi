$.get('http://127.0.0.1:4567/babies', function(data){

	var babynames = $.parseJSON(data);

	// var year = window.location.pathname.split('/')[1];

	var babies = _.filter(babynames["data"], function(baby){ 
		return baby[8] == 2012;
	});

	babies.forEach(function(baby) {
		$('.table').append('<tr><td>' + baby[9] + '</td><td>' + baby[10] + '</td><td>' + baby[11] + '</td><td>' + baby[12] + '</td></tr>');
	})
});