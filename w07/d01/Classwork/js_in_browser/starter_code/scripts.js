function createChild(id, what, content){

	var element=document.getElementById(id);
	var item=document.createElement(what);
	item.innerText=content;
	element.appendChild(item)

}
