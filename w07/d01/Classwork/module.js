


function filterDir(directory, filetype, function)
fs.readdir(directory, function(err, data){
	var new_array=[];
	data.forEach(function(file){

		if(file.match('.'+filetype))
			new_array.push(file)
	});

	return new_array


});

});
