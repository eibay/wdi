

window.onload = function() {
var master = jQuery.get("/names", success, "json")	
}




function success(event) {
	generateButtons()
	var yearNames = extractByYear(event.data)
	populateLists(yearNames)
	createTable()
	displayTable(yearNames)
}

function generateButtons(array) {
	$("body").append("<div class='container'><div class='row'><div class='col-md-1 col-md-offset-4 btn-group'><button type='button' class='btn btn-default dropdown-toggle' data-toggle='dropdown'>County <span class='caret'></span></button><ul class='dropdown-menu county_list' role='menu'></ul></div><div class='col-md-1 col-md-offset-1'><button type='button' class='btn btn-default dropdown-toggle' data-toggle='dropdown'>Gender <span class='caret'></span></button><ul class='dropdown-menu gender_list' role='menu'></ul></div></div></div>")
}

function extractByYear(array) {
	var year = document.URL.split("/").slice(-1)[0]
	var output = _.filter(array, function(index) {
		return index[8] == year
	})
	return output
}

function createTable() {
	$(".container").append("<div class='row'><header class='col-md-8 col-md-offset-2'><table class='table table-bordered table-striped'><thead><tr><th data-field='name'>Name</th><th data-field='county'>County</th><th data-field='gender'>Gender</th><th data-field='count'>Count</th></tr></thead></table></header></div>")	
}

function displayTable(array) {
	array.forEach(function(item) {
		$(".table").append("<tr id='last'>")
		$("#last").append("<td>" + item[9] + "</td>").append("<td>" + item[10] + "</td>").append("<td>" + item[11] + "</td>").append("<td>" + item[12] + "</td>")
		$("#last").removeAttr("id", null)
	})
}

function populateLists(array) {
	var strings = []
	array.forEach(function(item) {
		if (_.contains(strings, item[10])) {}
		else {strings.push(item[10])}
	})
	strings = _.sortBy(strings, function(item) {
		return [item.charCodeAt(0), item.charCodeAt(1), item.charCodeAt(2), item.charCodeAt(3)]
	})
	strings.forEach(function(county) {
	$(".county_list").append("<li><a class='county_item' href='#"+ county + "'>" + county + "</a></li>")
	})
	$(".county_item").click(array, displayCountyTable)
	$(".gender_list").append("<li><a class='gender_item' href='#male'>Male</a></li>").append("<li><a class='gender_item' href='#female'>Female</a></li>")
	$(".gender_item").click(array, displayGenderTable)
}

function displayCountyTable(feed) {
	$("tbody").detach()
	var list = _.filter(feed.data, function(item){
		return item[10] == feed.target.innerText
	})
	displayTable(list)
}

function displayGenderTable(feed) {
	$("tbody").detach()
	var list = _.filter(feed.data, function(item){
		return item[11] == feed.target.innerText[0]
	})
	displayTable(list)
}



