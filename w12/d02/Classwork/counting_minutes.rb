require "pry"

def counting_minutes(string)
	times = string.split("-")
	start = times[0]
	finish = times[1]
	start_hour = start.split(":")[0]
	finish_hour = finish.split(":")[0]
	start_meridian = start.scan(/[a, p]/)[0]
	finish_meridian = finish.scan(/[a, p]/)[0]
	start_hour = "0" if start_hour == "12" && start_meridian == "a"
	finish_hour = "0" if finish_hour == "12" && finish_meridian == "p"
	start_minute = start.split(":")[1].scan(/\d+/)[0]
	finish_minute = finish.split(":")[1].scan(/\d+/)[0]
	start_in_minutes = (start_hour.to_i * 60) + start_minute.to_i
	start_in_minutes += 720 if start_meridian == "p"
	finish_in_minutes = (finish_hour.to_i * 60) + finish_minute.to_i
	finish_in_minutes += 720 if finish_meridian == "p"

	diff = 0
	if start_in_minutes > finish_in_minutes
		diff += (1440 - start_in_minutes) + finish_in_minutes
	else
		diff = finish_in_minutes - start_in_minutes
	end

	puts diff


end

counting_minutes("12:00am-2:30am")

counting_minutes("12:30pm-12:00am")

counting_minutes("1:23am-1:08am")