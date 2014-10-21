require 'pry'
def counting_minutes(range)
	times = range.split('-')
	first_time = times[0]
	second_time = times[1]
	if(second_time.split(':')[0].to_i <= first_time.split(':')[0].to_i)
		hours = (second_time.split(':')[0].to_i)+12
		minutes = second_time.split(':')[1].slice(0,2)
		second_time = "#{hours}:#{minutes}#{second_time.split(':').slice(2,2)}"
	end
	
	if(first_time.length == 7)
		if(first_time.slice(5,2)=='am')
			hours = first_time.split(':')[0].to_i*60
			minutes = first_time.split(':')[1].slice(0,2).to_i
			first_total = hours+minutes
		else
			hours = (first_time.split(':')[0].to_i*60)+720
			minutes = first_time.split(':')[1].slice(0,2).to_i
			first_total = hours+minutes
		end
	else
		if(first_time.slice(4,2)=='am')
			hours = first_time.split(':')[0].to_i*60
			minutes = first_time.split(':')[1].slice(0,2).to_i
			first_total = hours+minutes
		else
			hours = (first_time.split(':')[0].to_i*60)+720
			minutes = first_time.split(':')[1].slice(0,2).to_i
			first_total = hours+minutes
		end
	end
	if(second_time.length == 7)
		if(second_time.slice(5,2)=='am')
			hours = second_time.split(':')[0].to_i*60
			minutes = second_time.split(':')[1].slice(0,2).to_i
			second_total = hours+minutes
		else
			hours = (second_time.split(':')[0].to_i*60)+720
			minutes = second_time.split(':')[1].slice(0,2).to_i
			second_total = hours+minutes
		end
	else
		if(second_time.slice(4,2)=='am')
			hours = second_time.split(':')[0].to_i*60
			minutes = second_time.split(':')[1].slice(0,2).to_i
			second_total = hours+minutes
		else
			hours = (second_time.split(':')[0].to_i*60)+720
			minutes = second_time.split(':')[1].slice(0,2).to_i
			second_total = hours+minutes
		end
	end
	return (first_total - second_total).abs
end

binding.pry