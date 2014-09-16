function addEltoLanguages(text){
var list = document.getElementById("languages_list");
var language = document.createElement("li");
language.innerText = text;
list.appendChild(language);
};
// to create list item in languages


function removeEl(el){
el.parentNode.removeChild(el);

};

//could do loop or indexof
