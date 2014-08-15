url = "/the_forest?animal=monkey&food=bananas" 
url2 = url.split("?")


#print url2 #["/the_forest", "animal=monkey&food=bananas"]


url3=url2[1].split("&") 

#print url3 #["animal=monkey", "food=bananas"]

url4= []

url3.each do |a|
url4.push a.split("=")
end

#print url4 #[["animal", "monkey"], ["food", "bananas"]]


sym1= url2[0].to_sym
big_hash ={}

big_hash[:path] = url2[0]
small_hash={}

array1=[]
url4.each do |a|
	array1.push a[0].to_sym 
end

array2=[]
url4.each do |b|
	array2.push b[1].to_s
end

print array1
print array2


array1

# puts url4



# first_param = url4[0][0].to_sym 
# first_string = url4[0][1].to_s


# second_param = url4[1][0].to_sym 
# second_string = url4[1][1].to_s

# small_hash[first_param]= first_string
# small_hash[second_param]= second_string

# big_hash[:query_params] = small_hash

# print big_hash




# url3=[]
# url2.each do |a|
# 	url3.push a.to_sym
# end
=begin what we want:

{
	path: "the forest",
	query_params: {
		animal: "monkeys"
		food: "bananas"
	}
}

=end