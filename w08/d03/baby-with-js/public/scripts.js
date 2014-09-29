
var babylist = $.get( "./ny-baby-names.json", function() {
	alert( "success" );
	var babies = $.parseJSON(babylist);
	var names = babies["data"];
	var div = document.querySelector("div")
	var table = document.createElement("table")
	table.setAttribute('class', "table table-bordered table-condensed")
	var tr = document.createElement("tr")
	var name = document.createElement("th")
	name.innerText = "name"
	var county = document.createElement("th")
	county.innerText = "county"
	var gender = document.createElement("th")
	gender.innerText = "gender"
	var count = document.createElement("th")
	count.innerText = "count"
	tr.appendChild(name)
	tr.appendChild(county)
	tr.appendChild(gender)
	tr.appendChild(count)
	table.appendChild(tr)
	div.appendChild(table)


})
.done(function() {
	alert( "second success" );
})
.fail(function() {
	alert( "error" );
})
.always(function() {
	alert( "finished" );
});




