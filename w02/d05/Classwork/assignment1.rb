paths = "/the_forest?animal=monkeys%food=bananas"
path1 = paths.split("?")[0]
path = path1.split("/")[1]
query_params = paths.split("?")[1]
query_params.split("%") 

query1= query_params.split("%")[0]
query2 = query_params.split("%")[1] 
pos1=query1.split("=")[0]
pos2=query2.split("=")[0]
position1= query1.split("=")[1].to_s
position2= query2.split("=")[1].to_s


hash = { }
hash[pos1.to_sym] = position1
hash[pos2.to_sym] = position2

mainhash ={}
mainhash[:queryparams] = hash
mainhash[:path] = path

