function doSomething(){
	console.log(this);
};

doSomething();

$(function(){

	$(".button").on("click", function(){
		console.log(this);
		doSomething();
	});

});
