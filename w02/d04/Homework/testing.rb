parsed_response = {"Search"=>
	[
	{"Title"=>"Donkey Punch", "Year"=>"2008", "imdbID"=>"tt0988849", "Type"=>"movie"}, 
	{"Title"=>"Julien Donkey-Boy", "Year"=>"1999", "imdbID"=>"tt0192194", "Type"=>"movie"}, 
	{"Title"=>"Donkey Skin", "Year"=>"1970", "imdbID"=>"tt0066207", "Type"=>"movie"}, 
	{"Title"=>"Donkey Xote", "Year"=>"2007", "imdbID"=>"tt0419704", "Type"=>"movie"}, 
	{"Title"=>"Donkey Kong Country", "Year"=>"1994", "imdbID"=>"tt0241385", "Type"=>"game"}, 
	{"Title"=>"Nestor, the Long-Eared Christmas Donkey", "Year"=>"1977", "imdbID"=>"tt0076448", "Type"=>"movie"}, 
	{"Title"=>"Drop the Dead Donkey", "Year"=>"1990â€“1998", "imdbID"=>"tt0098781", "Type"=>"series"}, 
	{"Title"=>"Donkey Kong 64", "Year"=>"1999", "imdbID"=>"tt0233601", "Type"=>"game"}, 
	{"Title"=>"Donkey Kong", "Year"=>"1981", "imdbID"=>"tt0176664", "Type"=>"game"}, 
	{"Title"=>"Donkey", "Year"=>"2009", "imdbID"=>"tt1389083", "Type"=>"movie"}
	]
}


movie = hash["Search"]
movie[0]["Year"]
movie[1]
print movie


puts parsed_response["Search"][0]
