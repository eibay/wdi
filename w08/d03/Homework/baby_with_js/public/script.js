var year = '2012';
var sortedBabies = [];

$.get('http://127.0.0.1:4567/babies', function(data){

	var babynames = $.parseJSON(data);
	sortedBabies = babynames['data'];

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

	//table methods
	function setYear(babies){
		var babiesByYear = _.filter(sortedBabies, function(baby){ 
			return baby[8] == year;
		});
		setTable(babiesByYear);
	}

	function setTable(babies){
		$('.table').empty();
		babies.forEach(function(baby) {
			$('.table').append('<tr><td>' + baby[9] + '</td><td>' + baby[10] + '</td><td>' + baby[11] + '</td><td>' + baby[12] + '</td></tr>');
			console.log(babies.length);
		})
	}

	//add events to dropdowns
	$('.year').on('change', function(){
		year = $('.year option:selected').text();
		var babiesByYear = _.filter(sortedBabies, function(baby){ 
			return baby[8] == year;
		});
		setTable(babiesByYear);
	})

	$('.county').on('change', function(){
		var county = $('.county option:selected').text();
		var babiesByCounty = _.filter(sortedBabies, function(baby){ 
			return baby[10] == county;
		});
		setTable(babiesByCounty);
		sortedBabies = babiesByCounty;
	})

	$('.gender').on('change', function(){
		var gender = $('.gender option:selected').text()[0];
		var babiesByGender = _.filter(sortedBabies, function(baby){ 
			return baby[11] == gender;
		});
		setYear(babiesByGender);
		sortedBabies = babiesByGender;
	})
});

// <ul class="dropdown-menu" role="menu" aria-labelledby="year">
// 			<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
// $('year')