```ruby
$ pry
[1] pry(main)> emails = {}
{}
[2] pry(main)> emails["Harry"]
nil
[3] pry(main)> emails["Harry"] = "harry.potter@hogwarts.edu"
"harry.potter@hogwarts.edu"
[4] pry(main)> emails
{
    "Harry" => "harry.potter@hogwarts.edu"
}
[5] pry(main)> emails["Arthur"] = "arthur_weasley@ministryofmagic.gov.uk
[5] pry(main)* "
"arthur_weasley@ministryofmagic.gov.uk\n"
[6] pry(main)> emails
{
     "Harry" => "harry.potter@hogwarts.edu",
    "Arthur" => "arthur_weasley@ministryofmagic.gov.uk\n"
}
[7] pry(main)> emails["Hermione"] = "hermione.granger@hogwarts.edu
[7] pry(main)* "
"hermione.granger@hogwarts.edu\n"
[8] pry(main)> emails["Garrick"] = "garrick@olivanderswands.co.uk"
"garrick@olivanderswands.co.uk"
[9] pry(main)> emails
{
       "Harry" => "harry.potter@hogwarts.edu",
      "Arthur" => "arthur_weasley@ministryofmagic.gov.uk\n",
    "Hermione" => "hermione.granger@hogwarts.edu\n",
     "Garrick" => "garrick@olivanderswands.co.uk"
}
[10] pry(main)> emails["Harry"] = "harry_potter@hogwarts.edu"
"harry_potter@hogwarts.edu"
[11] pry(main)> emails
{
       "Harry" => "harry_potter@hogwarts.edu",
      "Arthur" => "arthur_weasley@ministryofmagic.gov.uk\n",
    "Hermione" => "hermione.granger@hogwarts.edu\n",
     "Garrick" => "garrick@olivanderswands.co.uk"
}
[12] pry(main)> emails["Harry Potter"] = "harry_potter@hogwarts.edu"
"harry_potter@hogwarts.edu"
[13] pry(main)> emails
{
           "Harry" => "harry_potter@hogwarts.edu",
          "Arthur" => "arthur_weasley@ministryofmagic.gov.uk\n",
        "Hermione" => "hermione.granger@hogwarts.edu\n",
         "Garrick" => "garrick@olivanderswands.co.uk",
    "Harry Potter" => "harry_potter@hogwarts.edu"
}
[14] pry(main)> emails["Arthur"]
"arthur_weasley@ministryofmagic.gov.uk\n"
[15] pry(main)> emails["Arthur"] = "arthur_weasley@ministryofmagic.gov.uk"
"arthur_weasley@ministryofmagic.gov.uk"
[16] pry(main)> emails["Hermione"] = "hermione.granger@hogwarts.edu"
"hermione.granger@hogwarts.edu"
[17] pry(main)> emails
{
           "Harry" => "harry_potter@hogwarts.edu",
          "Arthur" => "arthur_weasley@ministryofmagic.gov.uk",
        "Hermione" => "hermione.granger@hogwarts.edu",
         "Garrick" => "garrick@olivanderswands.co.uk",
    "Harry Potter" => "harry_potter@hogwarts.edu"
}
[18] pry(main)> print emails
{"Harry"=>"harry_potter@hogwarts.edu", "Arthur"=>"arthur_weasley@ministryofmagic.gov.uk", "Hermione"=>"hermione.granger@hogwarts.edu", "Garrick"=>"garrick@olivanderswands.co.uk", "Harry Potter"=>"harry_potter@hogwarts.edu"}nil
[19] pry(main)> emails
{
           "Harry" => "harry_potter@hogwarts.edu",
          "Arthur" => "arthur_weasley@ministryofmagic.gov.uk",
        "Hermione" => "hermione.granger@hogwarts.edu",
         "Garrick" => "garrick@olivanderswands.co.uk",
    "Harry Potter" => "harry_potter@hogwarts.edu"
}
[20] pry(main)> emails.key("harry_potter@hogwarts.edu")
"Harry"
[21] pry(main)> emails.delete("Harry Potter")
"harry_potter@hogwarts.edu"
[22] pry(main)> emails
{
       "Harry" => "harry_potter@hogwarts.edu",
      "Arthur" => "arthur_weasley@ministryofmagic.gov.uk",
    "Hermione" => "hermione.granger@hogwarts.edu",
     "Garrick" => "garrick@olivanderswands.co.uk"
}
[23] pry(main)> zoo = {}
{}
[24] pry(main)> zoo["Sam"] = "Lion"
"Lion"
[25] pry(main)> zoo
{
    "Sam" => "Lion"
}
[26] pry(main)> zoo["Yogi"] = "Bear"
"Bear"
[27] pry(main)> zoo
{
     "Sam" => "Lion",
    "Yogi" => "Bear"
}
[28] pry(main)> exit
DarthNeel ~/code/wdi/rosencrantz/w01/d03/Instructors
$ ls
Readme.md     fast_food.rb  hashes.rb
DarthNeel ~/code/wdi/rosencrantz/w01/d03/Instructors
$ cp fast_food.rb fast_food_with_hashes.rb
DarthNeel ~/code/wdi/rosencrantz/w01/d03/Instructors
$ ls
Readme.md                 fast_food_with_hashes.rb
fast_food.rb              hashes.rb
DarthNeel ~/code/wdi/rosencrantz/w01/d03/Instructors
$ ruby fast_food_with_hashes.rb
1
7
9
9
DarthNeel ~/code/wdi/rosencrantz/w01/d03/Instructors
$ ruby fast_food_with_hashes.rb
1
7
9
9
DarthNeel ~/code/wdi/rosencrantz/w01/d03/Instructors
$ pry
[1] pry(main)> menu = {"Soda" => 1, "Chicken Tenders" => 6, "Fries" => 2, "Cheeseburger" => 7, "Deluxe Triple Hamburger and Bacon Combo" => 18, "Pizza" => 9, "Kale Salad" => 6}
{
                                       "Soda" => 1,
                            "Chicken Tenders" => 6,
                                      "Fries" => 2,
                               "Cheeseburger" => 7,
    "Deluxe Triple Hamburger and Bacon Combo" => 18,
                                      "Pizza" => 9,
                                 "Kale Salad" => 6
}
[2] pry(main)> person = {
[2] pry(main)*   name: "Neel"
[2] pry(main)* }
{
    :name => "Neel"
}
[3] pry(main)> "name".to_sym
:name
[4] pry(main)> fav_artists = {Radiohead: ["Ok, Computer", "In Rainbows"]}
{
    :Radiohead => [
        [0] "Ok, Computer",
        [1] "In Rainbows"
    ]
}
[5] pry(main)> fav_artists[:Beatles]  = []
[]
[6] pry(main)> fav_artists
{
    :Radiohead => [
        [0] "Ok, Computer",
        [1] "In Rainbows"
    ],
      :Beatles => []
}
[7] pry(main)> fav_artists[:Beatles]
[]
[8] pry(main)> fav_artists[:Beatles].push("The White Album")
[
    [0] "The White Album"
]
[9] pry(main)> fav_artists
{
    :Radiohead => [
        [0] "Ok, Computer",
        [1] "In Rainbows"
    ],
      :Beatles => [
        [0] "The White Album"
    ]
}
[10] pry(main)> fav_artists[:Beatles]
[
    [0] "The White Album"
]
[11] pry(main)> fav_artists[:Beatles].push("Sgt Peppers")
[
    [0] "The White Album",
    [1] "Sgt Peppers"
]
[12] pry(main)> fav_artists[:Beatles]
[
    [0] "The White Album",
    [1] "Sgt Peppers"
]
[13] pry(main)> fav_artists[:Beatles][1]
"Sgt Peppers"
[14] pry(main)> fav_artists[:Beatles]
[
    [0] "The White Album",
    [1] "Sgt Peppers"
]
[15] pry(main)> fav_artists[:Beatles].push("Abbey Road")
[
    [0] "The White Album",
    [1] "Sgt Peppers",
    [2] "Abbey Road"
]
[16] pry(main)> fav_artists
{
    :Radiohead => [
        [0] "Ok, Computer",
        [1] "In Rainbows"
    ],
      :Beatles => [
        [0] "The White Album",
        [1] "Sgt Peppers",
        [2] "Abbey Road"
    ]
}
[17] pry(main)> fav_artists[:Beatles].push("Revolver", "HELP")
[
    [0] "The White Album",
    [1] "Sgt Peppers",
    [2] "Abbey Road",
    [3] "Revolver",
    [4] "HELP"
]
[18] pry(main)> exit
DarthNeel ~/code/wdi/rosencrantz/w01/d03/Instructors
$


```
