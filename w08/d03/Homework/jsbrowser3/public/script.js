

window.onload = function() {
	generateButtons()
}

var master = jQuery.get("/names", success, "json")



function success(event) {
	var yearNames = extractByYear(event.data)
}

function generateButtons(array) {
	$("body").append("<div class='container'><div class='row'><div class='col-md-1 col-md-offset-4'><button type='button' class='btn btn-default dropdown-toggle' data-toggle='dropdown'>County <span class='caret'></span></button><ul class='dropdown-menu county_list' role='menu'></ul></div><div class='col-md-1 col-md-offset-1'><button type='button' class='btn btn-default dropdown-toggle' data-toggle='dropdown'>Gender <span class='caret'></span></button><ul class='dropdown-menu gender_list' role='menu'></ul></div></div></div>")
}

function extractByYear(array) {
	var year = document.URL.split("/").slice(-1)[0]
	var output = _.filter(array, function(index) {
		return index[8] == year
	})
	return output
}

function populate_county_lists(array) {
	var strings = []
	array.forEach(function(item) {
		if (_.contains(strings, item[10])) {}
		else {strings.push(item[10])}
	})
	strings = _.sortBy(strings, function(item) {
		return [item.charCodeAt(0), item.charCodeAt(1), item.charCodeAt(2), item.charCodeAt(3)]
	})
	strings.forEach(function(county) {
	$(".county_list").append("<li><a href='#'>" + county + "</a></li>")
	})
}