$.get( "/ny-baby-names.json", function(data) {
	var year = window.location.pathname.split('/')[1];
	

	
	if(window.location.pathname=="/popularity"){
		$('.popularity').on('click', function(){


			var filter = _.filter(data["data"], function(baby){ 
				return baby[9] == $('#name').val().toUpperCase(); 
			});
			
			var counts=[0,0,0,0,0,0]
			_.each(filter, function(baby){
				if(baby[8]=="2012"){
					counts[5] += parseInt(baby[12])
				}
				else if(baby[8]=="2011"){
					counts[4] += parseInt(baby[12])
				}
				else if(baby[8]=="2010"){
					counts[3] += parseInt(baby[12])
				}
				else if(baby[8]=="2009"){
					counts[2] += parseInt(baby[12])
				}
				else if(baby[8]=="2008"){
					counts[1] += parseInt(baby[12])
				}
				else if(baby[8]=="2007"){
					counts[0] += parseInt(baby[12])
				}
			});
			

			var canvas = document.getElementById('chart');
			
			var width=$(document).width()*.43;
			var height=width/2;
			canvas.setAttribute("height", height)
			canvas.setAttribute("width", width)
			var ctx = canvas.getContext("2d");
			var myData = {
				labels : ["2007","2008","2009","2010","2011","2012"],
				datasets : [
				{

					strokeColor : "#69B0AC",
					pointColor : "#D0104C",
					pointStrokeColor : "#fff",
					data : counts
				}

				]
			}
			var options={
				scaleShowGridLines : false,
				bezierCurve : false,
				datasetFill : false
			}
			$('.chartTitle').text('Popularity of Name '+ $('#name').val()+' in New York')

			var myChart = new Chart(ctx).Line(myData, options);
			$('.popularity').on('click', function(){
				myChart.destroy()
			});

		})
}




else{
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
}
});









// $( "#test, #test2" ).sortable({
//       connectWith: ".testing"
//     }).disableSelection();












