var express = require("express")
var app = express()
var fs = require("fs")
var cheerio = require("cheerio")
var request = require("request")


app.get("/", function (req, res){
// gets random word from urbandictionary, creates JSON file: output.json
	url = "http://www.urbandictionary.com/random.php";
	request(url, function(error, response, html){

		if(!error){
			var $ = cheerio.load(html);

			var randWord;
			var json = { randWord : ""};
		
			$(".word").filter(function(){
				var data = $(this)
				randWord = data.children().first().text();
				json.randWord = randWord;
			})

			fs.writeFileSync("output.json", JSON.stringify(json, null, 4), function(err){
			    console.log(randWord)
			    console.log("File successfully written!");
      })
		}
// reads JSON file, replaces hangman game word with urbandictionary word
	var gameWord = (JSON.parse(fs.readFileSync("./output.json"))).randWord

// !! keep getting error that {{URBAN_DICTIONARY}} isn't being replaced/ "unexpected token {"
	var gameCode = fs.readFileSync("./js/game.js").toString()
	
	gameCode.replace("{{URBAN_DICTIONARY}}", gameWord.toString() )
	})	
	res.end(fs.readFileSync("./index.html"))
})

app.get("/style.css", function (req, res){
	res.end(fs.readFileSync("./style.css"))
})

app.get("/js/game.js", function (req, res){
	res.end(fs.readFileSync("./js/game.js"))
})

app.get("/favicon.ico", function (req, res){
   res.end(fs.readFileSync("./favicon.jpg"))
})
app.listen(2001)







