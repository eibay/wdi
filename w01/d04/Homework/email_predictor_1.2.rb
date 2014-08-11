

############### #1 FIRST PART ##################

# #example data input
# name_email = ["Sean West", "sean.west@generalassemb.ly"]

def categorize(name_email) ########
# Part 1 - Classification


  # Declaring variables
  name = name_email[0].downcase.split(" ") #Sean West" ---- "Sean West"
    名 = name[0] # "Sean" ---- "Sean West"
    姓 = name[1] # "West" ---- "Sean West"

  email = name_email[1] # "sean.west@generalassemb.ly" ---- "Sean West"
    email_head = email.split("@")[0] # "sean.west" ---- "Sean West"
    email_tail = email.split("@")[1]

 puts "your name is '#{name}'' and your email is '#{email}'"
  # Taxonomy of emails


    a = 名 + "." + 姓           # jeffrey.konowitch
    b = 名                     # jeffrey
    c = 名 + 姓                 # jeffreykonowitch
    d = 名.split("")[0] + 姓    # jkonowitch
    e = 0
 
    count_a = 0
    count_b = 0
    count_c = 0
    count_d = 0
    count_e = 0


  taxonomy = [["a", a, count_a], ["b", b, count_b], ["c", c, count_c], ["d", d, count_d], ["e", e, count_e]]

  
 


hash = {

}
#i don't know how to do this

  taxonomy.each do |array|
    if array[1] == email_head
      # array[2] += 1;
      hash[email] = array[2]

      hash.each do |key, value|
        value += 1
      end

    end
  end
puts hash


end ####### for method categorize(name_email)


###### examples 
# categorize(["adrian lin", "adrian@gmail.com"])
# categorize(["jeffrey konowitch", "jkonowitch@generalassemb.ly"])
# categorize(["name lastname", "pikachu@pokemon.com"])
# categorize(["jeffrey konowitch", "jeffrey.konowitch@generalassemb.ly"])
# categorize(["jeffrey konowitch", "jeffreykonowitch@generalassemb.ly"])




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

names_emails.each do |x|
  categorize(x)
end


