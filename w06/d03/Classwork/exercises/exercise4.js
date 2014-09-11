function withoutEnd(str) {
	var last = str.length - 2
	return str.substr(1, last)
}

ans = withoutEnd("Hello")
console.log(ans)

ans = withoutEnd('java')
console.log(ans)

ans = withoutEnd('coding')
console.log(ans)