path = "/the_forest?animal=monkey&food=bananas&drink=coca_cola&drug=cocaine&accessories=hat"   

# parsedpath = {path: path.split('/')[1].split('?')[0], 
# 	query_params: {path.split('?')[1].split('=')[0].to_sym => path.split('&')[0].split('=')[1], 
# 		path.split('&')[1].split('=')[0].to_sym => path.split('&')[1].split('=')[1]}}

def parse_query(url)
	path = url.split('?')[0]
	queries = url.split('?')[1].split('&') 

	indiv_q = {}

	queries.each do |q| 
		query = q.split('=')[0].to_sym
		param =  q.split('=')[1]
		indiv_q[query] = param
	end

	params = {
    path: path,
    query_params: indiv_q
  }
 
  return params
end

puts parse_query(path) 