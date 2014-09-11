# String Without End

# Given a string, return a version without the first and last char, so "Hello" yields "ell". The given string length should be at least 2.

# withoutEnd('Hello')
# // 'ell'
# withoutEnd('java')
# // 'av'
# withoutEnd('coding')
# // 'odin'

def withoutend(string)

 edited = string.slice(1, string.length - 2)
 puts edited

end

withoutend("Hello")
withoutend("java")
withoutend("coding")