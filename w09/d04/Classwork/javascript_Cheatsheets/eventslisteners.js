

//document.onclick = function() {
//	alert("You clicked somewhere in the document");
//};

function prepareEventHandlers() {	
	var myImage = document.getElementById("mainImage");
	myImage.onclick =  function() {
		alert("You clicked the image");
	}
}

window.onload = function() {
	// prep anything we need to
	prepareEventHandlers();
};

myelement.onclick = function() {
	// stuff to do
	// this is an anonymous function
	// this is anonymous because we dont have to call it by name
	// it will be called when myelement is clicked
};

document.addEventListener('click', myFunction, true);

// dom needs to be loaded before you can change it, once per page

window.onload = function() {

	// call all scripts here
}