zoo={}
mammals=[]
reptiles=[]

zoo[:mammals]=[]
zoo[:reptiles]=[]

zoo[:mammals].push("dog","cat","gorilla")
zoo[:reptiles].push("snake","aligator")

zoo[:mammals] << "Tejal"

specific=zoo[:mammals].index("Tejal")
puts specific



