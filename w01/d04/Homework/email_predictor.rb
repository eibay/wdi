require 'pry'

names_emails = [ 
  ["Jeffrey Konowitch", "jeff.konowitch@generalassemb.ly"],
  ["Neel Patel", "neel.patel@generalassemb.ly"],
  ["Sean West", "sean.west@generalassemb.ly"],
  ["Jake Schwartz", "j@generalassemb.ly"],
  ["Brad Jacobs", "brad@google.com"],
  ["Cynthia Silvers", "cynthia@google.com"],
  ["Summer Sanders", "summer.sanders@nickelodeon.com"],
  ["Kenan Thompson", "kenan.thompson@nickelodeon.com"]
]

predictives = [
  ["PJ Hughes", "generalassemb.ly"],
  ["Eric Schmidt", "google.com"],
  ["Kel Mitchell", "nickelodeon.com"]
]

target_stats = {}

index = 0


while index < names_emails.length

	first = names_emails[index][0].split(" ")[0]
	last = names_emails[index][0].split(" ")[1]
	address = names_emails[index][1]
	biz_dest = address.split("@")[1]

	target_stats[biz_dest.to_sym] = {
		a: 0,
		b: 0,
		c: 0,
		d: 0,
		e: 0
	} unless target_stats.has_key?(biz_dest.to_sym)

	pattern = false

	if address == (first + "." + last + "@" + biz_dest).downcase
		target_stats[biz_dest.to_sym][:a] += 1 
		pattern = true
	end

	if address == (first + "@" + biz_dest).downcase
		target_stats[biz_dest.to_sym][:b] += 1
		pattern = true
	end

	if address == (first + last + "@" + biz_dest).downcase
		target_stats[biz_dest.to_sym][:c] += 1
		pattern = true
	end

	if address == (first[0] + last + "@" + biz_dest).downcase
		target_stats[biz_dest.to_sym][:d] += 1
		pattern = true
	end

	target_stats[biz_dest.to_sym][:e] += 1 unless pattern

	index += 1

end

predictions = []
index = 0


while index < predictives.length
	pattern = target_stats[predictives[index][1].to_sym].max_by { |x| x[1] }[0]
	first = predictives[index][0].split(" ")[0]
	last = predictives[index][0].split(" ")[1]
	biz_dest = predictives[index][1]
	
	address = (first + "." + last + "@" + biz_dest).downcase if pattern == :a

	address = (first + "@" + biz_dest).downcase if pattern == :b

	address = (first + last + "@" + biz_dest).downcase if pattern == :c

	address = (first[0] + last + "@" + biz_dest).downcase if pattern == :d

	address = "Cannot predict" if pattern == :d

	predictions.push(address)

	index += 1
end

puts predictions