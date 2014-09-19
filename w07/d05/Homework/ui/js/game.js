window.addEventListener('load', function() {
	var httpRequest = new XMLHttpRequest;
	var randomWordApiURL = "http://randomword.setgetgo.com/get.php";
	jsonp(randomWordApiURL, function(data){
		var randomWord = data.Word; 
		addSecretWord(randomWord); 
	}); 
});

function checkForLetter(letter, word) {
	var indexes = [];
	for (var i = 0; i < word.length; i++) {
		if (letter == word[i]) 
			indexes.push(i); 
	}
	return indexes; 
}

function addSecretWord(word) {
	var gameWord = document.querySelector("div.game-word");
	var spaces = word.secretify();
	gameWord.innerText = spaces;
}

String.prototype.secretify = function() {
	return this.replace(/[^\s]/g, '_').split(' ').map(function(word) {
		return word.split('').join(' ');
	}).join('  '); 
}

function jsonp(url, callback) {
    var callbackName = 'jsonp_callback_' + Math.round(100000 * Math.random());
    window[callbackName] = function(data) {
        delete window[callbackName];
        document.body.removeChild(script);
        callback(data);
    };

    var script = document.createElement('script');
    script.src = url + (url.indexOf('?') >= 0 ? '&' : '?') + 'callback=' + callbackName;
    document.body.appendChild(script);
}
