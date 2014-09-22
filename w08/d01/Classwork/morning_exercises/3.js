function stringInfo(string) {
	return {key: string.length,
					original: string,
					splitBySlash: string.split('').join('/')
				};
}

console.log(stringInfo('elephant'));