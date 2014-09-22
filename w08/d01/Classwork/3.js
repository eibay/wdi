function stringInfo(string){
	return {length: string.length, original: string, splitBySlash: string.split("/")}
}

console.log(stringInfo('conor/alsoconor'))