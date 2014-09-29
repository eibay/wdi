var year = document.URL.split("/").slice(-1)[0]
var tableRow = document.createElement("tr")
var nameTD = document.createElement("td")
var countyTD = document.createElement("td")
var genderTD = document.createElement("td")
var countTD = document.createElement("td")

tableRow.appendChild(nameTD)
tableRow.appendChild(countyTD)
tableRow.appendChild(genderTD)
tableRow.appendChild(countTD)

tableRow.id = "dummy"


jQuery.get("/names", callBack, "json")

function callBack(feed) {
	var list = extractByYear(feed.data, year)
	list.forEach(function(item) {
		nameTD.innerText = item[9]
		countyTD.innerText = item[10]
		genderTD.innerText = item[11]
		countTD.innerText = item[12]
		document.querySelector("tbody").appendChild(tableRow.cloneNode(true))
	})
	
}

function extractByYear(arr, year) {
	var output = []
	arr.forEach(function(item) {
		if (item[8] == year) {
			output.push(item)
		}
	})
	return output
}






