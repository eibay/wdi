require 'socket'
require 'pry'
require 'json'
require 'httparty'
require 'parse_url'

server = TCPServer.new 2000

loop do
  ## http://musicbrainz.org/ws/2/artist/?query=artist:[***ARTIST_NAME***]&fmt=json
  ## response["artist"][3] ===> artist info
  ## response["artist"][3]["id"] ==> ID of artist

  ## response["artist"].each do |x| puts x["country"] end yields countries of the outputted artists
  # not all artist entries are going to have a country

  # response["artist"].each do |x| puts x["name"] end
  # outputs all the names of the artists

  #Using Mayhem as an example
  #{
#                 "id" => "c5f9e699-7b0d-4030-86dd-7acc8250d147",
#               "type" => "Group",
#              "score" => "100",
#               "name" => "Mayhem",
#          "sort-name" => "Mayhem",
#            "country" => "NO",
#               "area" => {
#                "id" => "6743d351-6f37-3049-9724-5041161fff4d",
#              "name" => "Norway",
#         "sort-name" => "Norway"
#     },
#     "disambiguation" => "Norwegian Black metal band",
#          "life-span" => {
#         "begin" => "1983",
#         "ended" => nil
#     },
#               "tags" => [
#         [0] {
#             "count" => 3,
#              "name" => "norwegian"
#         },
#         [1] {
#             "count" => 1,
#              "name" => "metal"
#         },
#         [2] {
#             "count" => 4,
#              "name" => "black metal"
#         },
#         [3] {
#             "count" => 1,
#              "name" => "norsk"
#         }
#     ]
# }

  # "disambiguation" -> possible genre?
  # life-span hash -> "begin", "ended" keys
  # get artist tags for MAYHEM -> response["artist"][0]
  #
  # response["artist"][0]["tags"].each do |x|
  #        puts x["name"] end
 # yields -> norwegian
            # metal
            # black metal
            # norsk













  client.close
end
