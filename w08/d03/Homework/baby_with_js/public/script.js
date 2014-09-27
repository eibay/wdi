var year = '2012';

$.get('http://127.0.0.1:4567/babies', function(data){

	var babynames = $.parseJSON(data);

	// var year = window.location.pathname.split('/')[1];
	//create dropdowns
	var allyears = _.pluck(babynames["data"], [8]);
	var years = _.uniq(allyears, false);
	years.forEach(function(year){	
		$('.year').append('<option value="' + year + '">' + year + '</option>')
	})

	var allcounties = _.pluck(babynames["data"], [10]);
	var counties = _.uniq(allcounties, false);
	counties.forEach(function(county){
		$('.county').append('<option value="' + county + '">' + county + '</option>')	
	})

	//add events to dropdowns
	$('.year').on('change', function(){
		year = $('.year option:selected').text();
		var babiesByYear = _.filter(babynames["data"], function(baby){ 
			return baby[8] == year;
		});
		setTable(babiesByYear);
	})

	$('.county').on('change', function(){
		var county = $('.county option:selected').text();
		var babiesByCounty = _.filter(babynames["data"], function(baby){ 
			return baby[10] == county;
		});
		setTable(babiesByCounty);
	})

	$('.gender').on('change', function(){
		var gender = $('.gender option:selected').text()[0];
		var babiesByGender = _.filter(babynames["data"], function(baby){ 
			return baby[11] == gender;
		});
		setTable(babiesByGender);
	})
	
	function setTable(babies){
		$('.table').empty();
		babies.forEach(function(baby) {
			$('.table').append('<tr><td>' + baby[9] + '</td><td>' + baby[10] + '</td><td>' + baby[11] + '</td><td>' + baby[12] + '</td></tr>');
			console.log(babies.length);
		})
	}
});

// <ul class="dropdown-menu" role="menu" aria-labelledby="year">
// 			<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
// $('year')