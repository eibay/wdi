function doSomething(){
	console.log(this);
};


$(function(){ // $(document).ready  ,  window on load

	$(".button").on("click", function(){
		console.log(this);
		doSomething(); // context is still from outside cuz its defined outside
	});

});
