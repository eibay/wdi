console.log("js file has loaded");

var name = "Daniel";

function addElToLang(text) {
	var list = document.getElementById("languages_list")
	var language = document.createElement("li");
	language.innerText = text;

	list.appendChild(language)

}

function removeEl(el) {
	el.parentNode.removeChild(el)
}