
function addLang(text){

var list = document.getElementById("languages");
var language = document.createElement("li");
language.innerText = text;
list.appendChild(language);

};

function removeEl(el){
	el.parentNode.removeChild(el)
};
