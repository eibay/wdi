function doSomething(){
	console.log(this);
};

var self=this
$(function(){

	$(".button").on("click", function(){
		$(body).append('<h1>Hello</h1>')


	});


});
