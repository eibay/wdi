path = "/the_forest?animal=monkeys&food=bananas"

values = {
	path: "the_forest",
	query_params: {
	animal: "monkeys",
	food: "bananas"
	}

}

the_forest = path_split[1].split("?")[0]
animal = path_split[1].split("?")[1].split("=")[0] 
monkeys = path_split[1].split("?")[1].split("=")[1].split("&")[0]   
food = path_split[1].split("?")[1].split("=")[1].split("&")[1]   
bananas = path_split[1].split("?")[1].split("=")[2]   

[:path] = the_forest
[:query_params][:animal] = animal
[:query_params][:food] = bananas 