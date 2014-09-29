function addEltoLang(text) {
	var list = document.getElementById("languages_list")

	var lang = document.createElement("li")
	lang.innerText = text
list.appendChild(lang);
}

function removeEl(el){
	el.parentNode.removeChild(el)
}