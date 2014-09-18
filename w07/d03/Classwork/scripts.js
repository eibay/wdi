window.onload = function(){

	var input = document.children[0];
	var unorderList= document.querySelector("ul");

	input.addEventListener("keydown", function(feed){
		if(feed.keyIdentifier=='Enter'){
			var text = feed.target.value
			console.log(text);
			var listItem=document.createElement("li");
			listItem.innerText= text;
			unorderList.appendChild(listItem);

		};
		
	});


};