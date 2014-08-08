# No enumerators or methods!

### Part 1 - Classification

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

# setup my classification hash for each domain name

classifications = {}

i = 0
while i < names_emails.length
  email = names_emails[i][1]

  domain_name = email.split("@")[1]

  classifications[domain_name] = { a: 0, b: 0, c: 0, d: 0, e: 0 }

  i += 1
end

# Count up the patterns for each domain
#
# Patterns
# a. first.last (ie, jeffrey.konowitch)
# b. first (ie, jeffrey)
# c. firstlast (ie, jeffreykonowitch)
# d. first_initiallast (ie, jkonowitch)
# e. doesn't match any patterns

i = 0
while i < names_emails.length
  name = names_emails[i][0].downcase
  email = names_emails[i][1]

  fname = name.split(" ")[0]
  lname = name.split(" ")[1]
  
  prefix = email.split("@")[0]
  domain_name = email.split("@")[1]

  case prefix
  when "#{fname}.#{lname}"
    classifications[domain_name][:a] += 1
  when "#{fname}"
    classifications[domain_name][:b] += 1
  when "#{fname}#{lname}"
    classifications[domain_name][:c] += 1
  when "#{fname[0]}#{lname}"
    classifications[domain_name][:d] += 1
  else
    classifications[domain_name][:e] += 1
  end

  i += 1
end

puts classifications

### Part 2 - Prediction

to_predict = [
  ["PJ Hughes", "generalassemb.ly"],
  ["Eric Schmidt", "google.com"],
  ["Kel Mitchell", "nickelodeon.com"]
]

predictions = []

i = 0
while i < to_predict.length
  name = to_predict[i][0].downcase
  domain_name = to_predict[i][1]

  fname = name.split(" ")[0]
  lname = name.split(" ")[1]
  
  case classifications[domain_name].values.max
  when classifications[domain_name][:a]
    predictions.push("#{fname}.#{lname}@#{domain_name}")
  when classifications[domain_name][:b]
    predictions.push("#{fname}@#{domain_name}")
  when classifications[domain_name][:c]
    predictions.push("#{fname}#{lname}@#{domain_name}")
  when classifications[domain_name][:d]
    predictions.push("#{fname[0]}#{lname}@#{domain_name}")
  when classifications[domain_name][:e]
    predictions.push("Cannot predict this!")
  end

  i += 1
end

puts predictions