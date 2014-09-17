window.onload = function() {
var userInput = document.getElementById("user_input");

		userInput.addEventListener("keypress", function(){
			var textbox = document.getElementById("user_input");
			var text = textbox.value;
			if (event.keyIdentifier == "Enter") {
                var event = {keyIdentifier: "Enter"};
				event.keyIdentifier
				var listItem = document.createElement("li");
				console.log(event.keyIdentifier)
				// listItem.innerText = text;
				listItem.innerHTML = "<h3>" + text + "</h3>";

				var list = document.getElementById("list");
				list.appendChild(listItem);

				textbox.value = "";
			}
		});
   }



		// function addToList(){}

		// button.addEventListener("click", addToList);


// 		var deleteButton = document.getElementById("delete_button");

// 		deleteButton.addEventListener("click", function(){
// 			var textbox = document.getElementById("user_input");
// 			var text = textbox.value;

// 			var list = document.getElementById("list");
// 			var listItems = list.children;

// 			for( var i = 0; i < listItems.length; i++){
// 				if(listItems[i].innerText == text){
// 					listItems[i].parentNode.removeChild(listItems[i]);
// 				};
// 			}

// 			textbox.value = ""
// 		});

// 	};

// 	$("#id_of_textbox").keyup(function(event){
//     if(event.keyCode == 13){
//         $("#id_of_button").click();
//     }
// });
