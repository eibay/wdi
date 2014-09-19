require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'

get "/:query" do
  content_type :json

  url = URI.encode("https://api.instagram.com/v1/tags/#{query}/media/recent?client_id=e13705fe74364dfc8f6fc9c5f562c549")

  pic_result = HTTParty.get(url)

# pic_result = {
#        "attribution" => nil,
#               "tags" => [
#         [ 0] "summer",
#         [ 1] "fashion",
#         [ 2] "tired",
#         [ 3] "food",
#         [ 4] "instalike",
#         [ 5] "makeup",
#         [ 6] "iphonesia",
#         [ 7] "throwback",
#         [ 8] "niallhoran",
#         [ 9] "friends",
#         [10] "jj_forum",
#         [11] "boyfriend",
#         [12] "webstagram",
#         [13] "20",
#         [14] "sun",
#         [15] "iphoneonly",
#         [16] "snow",
#         [17] "lol",
#         [18] "bestoftheday",
#         [19] "hashgram",
#         [20] "nofilter",
#         [21] "shoutout"
#     ],
#           "location" => {
#          "latitude" => 32.1241777,
#              "name" => "עין הנציב",
#         "longitude" => 34.7960458,
#                "id" => 406640494
#     },
#           "comments" => {
#         "count" => 1,
#          "data" => [
#             [0] {
#                 "created_time" => "1411115850",
#                         "text" => "@hashgramapp #fashion #bestoftheday #instalike #niallhoran #boyfriend #summer #makeup #food #shoutout #friends #throwback #jj_forum #lol #snow #nofilter #iphonesia #tired #sun #iphoneonly #webstagram #hashgram",
#                         "from" => {
#                            "username" => "idoshabtay",
#                     "profile_picture" => "http://photos-e.ak.instagram.com/hphotos-ak-xpf1/10537264_675003415917532_581456331_a.jpg",
#                                  "id" => "363626147",
#                           "full_name" => "ido shabtay"
#                 },
#                           "id" => "812821126493368400"
#             }
#         ]
#     },
#             "filter" => "Normal",
#       "created_time" => "1411115775",
#               "link" => "http://instagram.com/p/tHt-58kfGP/",
#              "likes" => {
#         "count" => 3,
#          "data" => [
#             [0] {
#                        "username" => "gray_allday",
#                 "profile_picture" => "http://photos-h.ak.instagram.com/hphotos-ak-xfa1/10448992_261261924061639_467134334_a.jpg",
#                              "id" => "1370406789",
#                       "full_name" => "gray_allday"
#             },
#             [1] {
#                        "username" => "urevive.health",
#                 "profile_picture" => "http://photos-d.ak.instagram.com/hphotos-ak-xaf1/10607940_330558210438635_944357124_a.jpg",
#                              "id" => "1476296526",
#                       "full_name" => "Kevin | Urevive"
#             },
#             [2] {
#                        "username" => "erynjorinscay",
#                 "profile_picture" => "http://images.ak.instagram.com/profiles/profile_1316318359_75sq_1399740770.jpg",
#                              "id" => "1316318359",
#                       "full_name" => "Colleen  Zeller"
#             }
#         ]
#     },
#             "images" => {
#              "low_resolution" => {
#                "url" => "http://scontent-a.cdninstagram.com/hphotos-xaf1/t51.2885-15/10576147_1507323222840664_791066726_a.jpg",
#              "width" => 306,
#             "height" => 306
#         },
#                   "thumbnail" => {
#                "url" => "http://scontent-a.cdninstagram.com/hphotos-xaf1/t51.2885-15/10576147_1507323222840664_791066726_s.jpg",
#              "width" => 150,
#             "height" => 150
#         },
#         "standard_resolution" => {
#                "url" => "http://scontent-a.cdninstagram.com/hphotos-xaf1/t51.2885-15/10576147_1507323222840664_791066726_n.jpg",
#              "width" => 640,
#             "height" => 640
#         }
#     },
#     "users_in_photo" => [],
#            "caption" => {
#         "created_time" => "1411115775",
#                 "text" => "🌴 🏊 #20",
#                 "from" => {
#                    "username" => "idoshabtay",
#             "profile_picture" => "http://photos-e.ak.instagram.com/hphotos-ak-xpf1/10537264_675003415917532_581456331_a.jpg",
#                          "id" => "363626147",
#                   "full_name" => "ido shabtay"
#         },
#                   "id" => "812820493228961854"
#     },
#               "type" => "image",
#                 "id" => "812820492683702671_363626147",
#               "user" => {
#                "username" => "idoshabtay",
#                 "website" => "",
#         "profile_picture" => "http://photos-e.ak.instagram.com/hphotos-ak-xpf1/10537264_675003415917532_581456331_a.jpg",
#               "full_name" => "ido shabtay",
#                     "bio" => "",
#                      "id" => "363626147"
#     }
# }

  pic_result.response.body
end
