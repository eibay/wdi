window.onload = function() {
	$("body").append("<div class='container'>")
	$(".container").append("<header class='col-md-8 col-md-offset-2 table_container'>")
	$(".table_container").append("<table class='table table-bordered table-striped'>")
	$(".table").append("<thead>")
	$("thead").append("<tr>")
	$("tr").append("<th data-field='name'>name</th>").append("<th data-field='county'>county</th>").append("<th data-field='gender'>gender</th>").append("<th data-field='count'>count</th>")

	var name_path = "/data/" + document.URL.split("/").slice(-1)

	jQuery.get(name_path, callBack, "json")

	function callBack(feed) {
		var list = feed
		feed.forEach(function(item) {
			$(".table").append("<tr id='last'>")
			$("#last").append("<td>" + item[9] + "</td>").append("<td>" + item[10] + "</td>").append("<td>" + item[11] + "</td>").append("<td>" + item[12] + "</td>")
			$("#last").removeAttr("id", null)
		})
	}
}