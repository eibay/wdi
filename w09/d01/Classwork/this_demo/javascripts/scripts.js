function doSomething(){
	console.log(this);
};


$(function(){

	$(".button").on("click", function(){
		console.log(this);
	});

});
