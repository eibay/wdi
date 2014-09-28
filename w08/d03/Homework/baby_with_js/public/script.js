var selectedBabies = [];
var year = '2012';
var county = 'All Counties';
var gender = 'A';

$.get('http://127.0.0.1:4567/babies', function(data){

	var babynames = $.parseJSON(data);
	selectedBabies = babynames['data'];
	
	// create dropdowns
	var allyears = _.pluck(babynames["data"], [8]);
	var years = _.uniq(allyears, false);
	years.forEach(function(year){	
		$('.year').append('<option value="' + year + '">' + year + '</option>')
	});

	var allcounties = _.pluck(babynames["data"], [10]);
	var counties = _.uniq(allcounties, false).sort();
	counties.forEach(function(county){
		$('.county').append('<option value="' + county + '">' + county + '</option>')	
	});

	// reset table
	function setTable(){

		$('.table tbody tr :gt(3)').remove();
		$('.year').val(year);

		if (county != 'All Counties') {
			var babiesByCounty = _.filter(selectedBabies, function(baby){ 
				return baby[10] == county;
			});
		} else {
			babiesByCounty = selectedBabies;
		}

		if (gender != 'A') {
			var babiesByGender = _.filter(babiesByCounty, function(baby){ 
				return baby[11] == gender;
			});
		} else {
			babiesByGender = babiesByCounty;
		}

		var babiesByYear = _.filter(babiesByGender, function(baby){ 
			return baby[8] == year;
		});

		babiesByYear.forEach(function(baby) {
			$('.table').append('<tr><td>' + baby[9] + '</td><td>' + baby[10] + '</td><td>' + baby[11] + '</td><td>' + baby[12] + '</td></tr>');
			console.log(babiesByYear.length);
		})

	}

	// dropdowns events
	$('.year').change(function(){
		year = $('.year option:selected').text();
		setTable();
	});

	$('.county').on('change', function(){
		county = $('.county option:selected').text();
		setTable();
	});

	$('.gender').on('change', function(){
		gender = $('.gender option:selected').text()[0];
		setTable();
	});
});