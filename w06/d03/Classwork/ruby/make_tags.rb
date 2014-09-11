# The web is built with HTML strings like "Yay" which draws Yay as italic text. In this example, the "i" tag makes and which surround the word "Yay". Given tag and word strings, create the HTML string with tags around the word, e.g. "Yay".

# makeTags('i', 'Yay')
# // '<i>Yay</i>'
# makeTags('i', 'Hello')
# // '<i>Hello</i>'
# makeTags('cite', 'Yay')
# // '<cite>Yay</cite>'

def maketags(tag, word)
	puts "<#{tag}>#{word}</#{tag}>"
end

maketags("i", "Yay")
maketags("i", "Hello")
maketags("cite", "Yay")