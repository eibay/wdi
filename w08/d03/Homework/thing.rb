    require 'json'

    babys = JSON.parse(File.read('./public/ny-baby-names.json'))

    babys = babys["data"]

    # babys.each do |baby|
    #    puts baby[8] +  "   " + baby[9]
    # end
    arr = []

    babys.each do |baby|
        if baby[8] == "2012" && baby[9]=="ZOEY"
            # arr.push(baby[9])
            puts baby[8] + "   " + baby[9] + "   " + baby[10] + "   " + baby[11] + "   " + baby[12]
        end
    end

    puts arr.sort

    # babys[1..400].each do |baby|
    #     if baby[8] == "2012"
    #         puts baby[8] +  "   " + baby[9]
    #     end
    # end

    # i = 0

    # while i <= 100

    # end

# # this is the year
#   babys["data"][1][8]
# # this is the name
#   babys["data"][1][9]
# # this is the county
#   babys["data"][1][10]
# # this is the gender
#   babys["data"][1][11]
# # this is the count
#   babys["data"][1][12]