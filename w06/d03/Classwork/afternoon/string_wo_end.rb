#String Without End
#Given a string, return a version 
#without the first and last char, 
#so "Hello" yields "ell". The given string length 
#should be at least 2.

#javascript withoutEnd('Hello') // 
#'ell' withoutEnd('java') // 'av' withoutEnd('coding') 
#// 'odin'

string = "hello"

i = 0

chopped = ""

while i < string.length
	if i == 0 || i == string.length - 1
	
	else
		chopped = chopped + string[i]
	end

	i = i + 1
end