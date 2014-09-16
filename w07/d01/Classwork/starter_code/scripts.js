function addElToLangs(text) {
	var langs = document.getElementById("lang_list");
	var new_lang = document.createElement("li");
	new_lang.innerText = text;
	langs.appendChild(new_lang);
}

function removeLang(element) {
	element.parentNode.removeChild(element);
}

var header = document.getElementById("page_heading");

header.style.color = "green"