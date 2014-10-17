
$(function(){

	$('#dance_button').click(function() {
		var $cat = $('#cat')

		if ($cat.hasClass("already_moved")) {
			$cat.animate({
				left: "-=800px",
				marginTop: "-=450px"
			}, 3000);
			$cat.removeClass("already_moved");
		} else {
			$cat.animate({
					left: "+=800px",
					marginTop: "+=450px"
			}, 3000);
			$cat.addClass("already_moved");
		}
	});

});
