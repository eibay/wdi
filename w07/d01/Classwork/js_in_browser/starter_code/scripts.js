// var list = document.getElementById("languages").children[1]

function addEltoLanguages(text) {
	var list = document.getElementById("languagesList");
	var language = document.createElement("li");
	language.innerText = text;
	list.appendChild(language);
};


// the easy way
function removeEl(el) {
	el.parentNode.removeChild(el);
}

