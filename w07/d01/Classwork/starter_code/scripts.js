function addElToLanguages(text) {

var lang = document.getElementById("languages_list");
var language = document.createElement("li");
language.innerText = text;
lang.appendChild(language);

}

function removeEl(element) {

  element.parentNode.removeChild(element);

};