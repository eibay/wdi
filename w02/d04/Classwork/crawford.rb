

css2 = <<HERE_BE_CSS 
div {
	margin-left: auto;
	margin-right: auto;
	margin-top: 15px;
	background-color: {{avatar2}};
	border: 20px orange;
	border-radius: 10px;
	padding: 10px;
	display: inline-block;
}
HERE_BE_CSS
p css2

# using Nastassia's url as an example 
avatar = "https://avatars.githubusercontent.com/u/689206?v=2"
p avatar 
avatar2 = avatar.split '/'
p avatar2
avatar2 = avatar2[4].split '?'
p avatar2[4]
p avatar2

avatarArr = []
p avatarArr

avatarArr = avatar2[0].split ''
p avatar2[0]
p avatarArr

avatarArr.delete_at 6 
p avatarArr 

avatar2 = avatarArr.join '' 
p avatar2
avatar2 = '#' + avatar2
p avatar2

css2 = css2.gsub '{{avatar2}}', avatar2 
p css2