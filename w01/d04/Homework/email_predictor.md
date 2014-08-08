# Email Predictor

Remember the email predictor algorithm we came up with in class? Your task is to implement this.

**Don't forget to write, think, or talk out the flow of your program without code first!!**

### Algorithm

#### Part 1 - Classification

1) Given a first/last and an email, be able to detect if it follows one of the following patterns and write the pattern letter to the terminal:
  * a. first.last (ie, jeffrey.konowitch)
  * b. first (ie, jeffrey)
  * c. firstlast (ie, jeffreykonowitch)
  * d. first_initiallast (ie, jkonowitch)
  * e. doesn't match any patterns

```ruby
name_email = ["Sean West", "sean.west@generalassemb.ly"]

# Your code should detect that the above name/email combo follows pattern a.
puts "The name/email provided follows pattern a"
```

*You may want to test several name/email pairs to make sure your code works.*

2) Given an array of name/email combos, count up the total number of times each pattern appears for a given domain name.

Given an array of inputs:
```ruby
name_email = [ 
  ["Jeffrey Konowitch", "jeff.konowitch@generalassemb.ly"],
  ["Neel Patel", "neel.patel@generalassemb.ly"],
  ["Sean West", "sean.west@generalassemb.ly"],
  ["Jake Schwartz", "j@generalassemb.ly"],
  ["Brad Jacobs", "brad@google.com"],
  ["Cynthia Silvers", "cynthia@google.com"],
  ["Summer Sanders", "summer.sanders@nickelodeon.com"],
  ["Kenan Thompson", "kenan.thompson@nickelodeon.com"]
]
```

Your code should generate the following hash: 

```ruby

{
  "generalassemb.ly" => [a: 2, b: 0, c: 0, d: 0, e: 2],
  "google.com" => [a: 0, b: 2, c: 0, d: 0, e: 0],
  "nickelodeon.com" => [a: 2, b: 0, c: 0, d: 0, e: 0],
}

```

#### Part 2 - Prediction

1) Given a name/domain name pair predict what their email address is based on the pattern that was found the most.
  * If the most found pattern was `e` then ouput "Cannot predict."

```ruby
["PJ Hughes", "generalassemb.ly"]

# Your code should output:

puts ["pj.hughes@generalassembl.ly"]
```

2) Predict a batch of email addresses at once:

```ruby
[
  ["PJ Hughes", "generalassemb.ly"],
  ["Eric Schmidt", "google.com"],
  ["Kel Mitchell", "nickelodeon.com"]
]

# Your code should output:
puts [
  "pj.hughes@generalassemb.ly",
  "eric@google.com",
  "kel.mitchell@generalassemb.ly",
]
```