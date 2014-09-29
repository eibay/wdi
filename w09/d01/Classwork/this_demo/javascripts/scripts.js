function doSomething(){
	console.log(this);
};

// $ is jQuery's way of doing window onload
$(function(){

// doSomething(); owned by the window

// the owner, "this", refers to the button/HTML element
	$(".button").on("click", function(){
		console.log(this);
		doSomething();  // still owned by the window even though it is defined outside

	});

});

