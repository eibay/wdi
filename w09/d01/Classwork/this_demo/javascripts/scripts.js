function doSomething(){
	console.log(this);
};


$(function(){

	$(".button").on("click", function(){
		console.log(this);
	});

});

// Above the keyword this is referring to the button.

// If we call the doSomething function in the console, than we get window which is basically everything as it all belongs to this huge object called window in JS.

// $(function(){ is JQuery's way of doing window.onload which we need to do bc we need the code for the button to load before the actual button.

