$(document).ready(function(){
	// when all of the html has been loaded and turned into the document object - point when you are ready to manipulate the DOM
		$.ajax("/babies", {success: function(data){
			// success an event just like ready, success is the function that will run when the ajax request is successfull and it will be passed the response of the request as its parameter
			parser(data)
			// calls the parser function and passes it the data
		}})
	});
	
	var parser = function(data){
		// defines the parser function
		var years = _.keys(data);
		// data is a hash, key is an array of its keys, each key is a year in the hash, gives list unique of years in the data hash
		// console.log(years);
		var container = $(".container");
		// selects the container element on the page and sets it to a variable
		_.forEach(years, function(year){
			// iterates over the years array
			var div = $('<div class="dropdown"></div>').appendTo(container);
			// adds a dropdown for the current year and saves it to a variable
			var button = $('<button class="btn btn-default dropdown-toggle" type="button" id="year-' + year + '" data-toggle="dropdown"> ' + year +'<span class="caret"></span></button>').appendTo(div);
			// adds dropdown button for the current year 
			var list = $('<ul class="dropdown-menu" role="menu"></ul>').appendTo(div);
			// adds the list container for the current year
			var names = _.uniq(_.pluck(data[year], 'name'));
			// pluck gets you a list for all the names of the year and uniq reduces that to only the uniq names
			_.forEach(names, function(name){
				// iterates over the names array
				var babies = _.where(data[year], {name: name})
				// data year represents the current year, where is looking in the current year and making an array of babies whose name match the current name
				var count = babies.length;
				// how many babies there are for that name for the current year
				var counties = _.uniq(_.pluck(babies, "county"));
				// pluck gets all the counties that that name appears in, uniq reduces that to only the uniq counties
				var html = '<li role="presentation">'; 
				html = html + '<span>' + name + '</span><br>';
				html = html + '<span> Count:' + count + '</span><br>';
				html = html + '<span> Counties:' + counties.join(", ") + '</span></li>';
				// concats all the data for the current name , join concatenates the array using a string as glue
				$(html).appendTo(list);
				// adds the current name to the current year
			});
			// 
		});
	}