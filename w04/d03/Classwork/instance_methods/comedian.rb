class Comedian
	def initialize(attributes)
		@name = attributes["name"]
		@age = attributes["age"]
		@joke = attributes["joke"]
	end 


	def show_info
		return  " #{@name} is a #{@age} year old comedian. Here's joke: #{@joke}" 
	end

end
comedians = []

info = {"name" => "Mitch", "age" => 43, "joke" =>"I was gonna stay overnight at my friends place, he said 'You’re gonna have to sleep on the floor.'…. Damn gravity. You got me again. You know how badly I want to sleep on the wall"}
info2 = {"name" => "jerry", "age" => 56, "joke" =>"“I’ll tell you what I like about Chinese people … They’re hanging in there with the chopsticks, aren’t they? You know they’ve seen the fork. They’re staying with the sticks. I’m impressed by that. I don’t know how they missed it. A Chinese farmer gets up, works in the field with the shovel all day … Shovel … Spoon … Come on … There it is. You’re not plowing 40 acres with a couple of pool cues …”"}
info3 = {"name" => "robin", "age" => 53, "joke" => "Cricket is basically baseball on Valium."}


mitch = Comedian.new(info)

jerry = Comedian.new(info2)

robin = Comedian.new(info3)

comedians.push(mitch, jerry, robin)

comedians.each do |a|
 puts a.show_info
end 