function addElToLanguages(text){
	var list = document.getElementById("languages_list");
	var language = document.createElement("li");
	language.innerText = text;
	list.appendChild(language);
};

function removeEl(element){
	el.parentNode.removeChild(element);
};