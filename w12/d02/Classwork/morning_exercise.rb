require 'pry'

def countingMinutes(time)
	total = 0
	ichi_one = 0
	ichi_two = 0
	ni_one = 0
	ni_two = 0

	one = time.split('-')[0]
	one_first = one.split(':')[0].to_i
	one_second = one.split(':')[1].to_i
	two = time.split('-')[1]
	two_first = two.split(':')[0].to_i
	two_second = two.split(':')[1].to_i

	if one.include?('am') && one_first == 12
		ichi_one = 0
	elsif one.include?('am')
		ichi_one = one_first
	elsif one.include?('pm') && one_first != 12
		ichi_one = one_first + 12
	end

		ichi_total = (ichi_one*100) + one_second

	if two.include?('am') && two_first == 12
		ni_one = 0
	elsif one.include?('am')
		ni_one = two_first
	elsif one.include?('pm') && one_first != 12
		ni_one = two_first + 12
	end

		ni_total = (ni_one*60) + two_second

	if ichi_total < ni_total
		total = ni_total - ichi_total
	else
		total = ichi_total - ni_total
	end

		puts total
end

countingMinutes("12:30pm-12:00am")

	# if one.include?('am')
	# 	one = one.split('am')
	# 	a = one.split(':')[0]
	# 	b = one.split(':')[1]
	# 	first = a + b
	# 	return first
	# else
	# 	one = one.split('pm')
	# 	a = one.split(':')[0]
	# 	b = one.split(':')[1]
	# 	first = a + b
	# 	return first		
	# end

	# if second.include?('am')
	# 	second = one.split('am')
	# 	a = second.split(':')[0]
	# 	b = second.split(':')[1]
	# 	second = a + b
	# 	return second
	# else
	# 	second = second.split('pm')
	# 	a = second.split(':')[0]
	# 	b = second.split(':')[1]
	# 	second = a + b
	# 	return second
	# end
