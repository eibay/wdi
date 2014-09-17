var = "neel"



function addElToLanguages(el){
var list = document.getElementById("languages_list");
var language = document.createElement("li");
language.innerText = text;
list.appendChild(language);
};

function removeEl(el){
  el.parentNode.removeChild(el);
};