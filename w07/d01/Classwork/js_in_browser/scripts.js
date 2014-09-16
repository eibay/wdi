function addEl(el){
var list = document.getElementById("languages_list");
var language = document.createElement("li");
language.innerText = el;
list.appendChild(language);
};

function removeEl(el){
	el.parentNode.removeChild(el);
};

function 