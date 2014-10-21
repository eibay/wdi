function countingMinutes(string) {
	var times = string.split("-")
	var start = times[0]
	var finish = times[1]
	var startHour = times[0].split(":")[0]
	var finishHour = times[1].split(":")[0]
	var startMeridian = times[0].match(/["a", "p"]/)[0]
	var finishMeridian = times[1].match(/["a", "p"]/)[0]
	if (startMeridian == "a" && startHour == "12") {
		startHour = "0"
	}
	if (finishMeridian == "a" && finishHour == "12") {
		finishHour = "0"
	}
	var startMinute = start.split(":")[1].match(/\d+/)[0]
	var finishMinute = finish.split(":")[1].match(/\d+/)[0]
	var startInMinutes = (parseInt(startHour) * 60) + parseInt(startMinute)
	var finishInMinutes = (parseInt(finishHour) * 60) + parseInt(finishMinute)

	var diff = 0

	if (startInMinutes > finishInMinutes) {
		diff = (1440 - startInMinutes) + finishInMinutes
	}
	else {
		diff = finishInMinutes - startInMinutes
	}

	console.log(diff)
}

countingMinutes("12:30pm-12:00am")
countingMinutes("12:00am-2:30am")
countingMinutes("1:23am-1:08am")