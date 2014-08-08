require 'pry'
############### #1 FIRST PART ##################

# #example data input
name_email = ["Sean West", "sean.west@generalassemb.ly"]

def categorize(name_email) ########
# Part 1 - Classification


  # Declaring variables
  name = name_email[0].downcase.split(" ") #Sean West" ---- "Sean West"
    名 = name[0] # "Sean" ---- "Sean West"
    姓 = name[1] # "West" ---- "Sean West"

  email = name_email[1] # "sean.west@generalassemb.ly" ---- "Sean West"
    email_head = email.split("@")[0] # "sean.west" ---- "Sean West"
    email_tail = email.split("@")[1]

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
  
#### just shows the users the types of patterns
  puts "\nThe pattern types are: "
  puts " "
  taxonomy.each do |α, 电邮, count|
    puts "pattern #{α}: #{电邮}"
  end


########## .each loop style!!
  taxonomy.each do |α, 电邮, count| #had it called "email" but it was confusing
  

    if 电邮 == email_head
      puts "\n#{电邮}@#{email_tail} is category '#{α}'. " #may need hash
    # else 
    #   puts "\n#{email} is category 'e': other. "  ### IF I INCLUDE THIS, IT KEEPS PUTTING IT!

    ##### tried with another if statement
      # if 电邮 != email_head
      #   puts "\n #{电邮}@#{email_tail} is category 'e'. "
      # end
    end
  end

####### this is the while loop - BEWARE - if user inputs nonconforming data, INFINITE LOOP,
### ### hence my preference for the each loop
#   n = 0
#   while taxonomy[n][1] != email_head 
#     # predicted_email = n + "@generalassemb.ly"
#   n += 1
#   end
#   puts "#{taxonomy[n][1]} is category #{taxonomy[n][0]}"


end ####### for method categorize(name_email)
# binding.pry ###########################################################################



###### examples 
categorize(["adrian lin", "adrian@gmail.com"])
categorize(["jeffrey konowitch", "jkonowitch@generalassemb.ly"])
categorize(["name lastname", "pikachu@pokemon.com"])
categorize(["jeffrey konowitch", "jeffrey.konowitch@generalassemb.ly"])
categorize(["jeffrey konowitch", "jeffreykonowitch@generalassemb.ly"])


