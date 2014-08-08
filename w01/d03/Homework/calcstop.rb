def calc_stop(start_line, start_stop, end_line, end_stop)
	subway = {
	:N => ["Times_sq", "34th", "28th", "23rd", "Union_sq", "8th"],
	:"#{6}" => ["Grand_central", "33rd", "28th", "23rd", "Union_sq", "Astor_pl"],
	:L => ["8th", "6th", "Union_sq", "3rd", "1st"],
	:Q => ["Times_sq", "34th", "Union_sq", "Canal_st"]
	}

	totalstops = (subway[start_line].index(start_stop) - subway[end_line].index(end_stop)).abs
end

subway = {
	:N => ["Times_sq", "34th", "28th", "23rd", "Union_sq", "8th"],
	:"#{6}" => ["Grand_central", "33rd", "28th", "23rd", "Union_sq", "Astor_pl"],
	:L => ["8th", "6th", "Union_sq", "3rd", "1st"],
	:Q => ["Times_sq", "34th", "Union_sq", "Canal_st"]
	}

puts calc_stop(:N, "Times_sq", :N, "23rd")

