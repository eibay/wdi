# Create a function that takes a hash of favorite colors and uses Object.keys to print out "[name] favorite color is [color]" for each name


people_hash = {
        tim: "blue",
        batman: "black",
        flash: "red"
}

def fav_color(colors)
    colors.each do |k,v|
    puts "#{k} has a favorite color of #{v}"
  end
end

fav_color(people_hash)