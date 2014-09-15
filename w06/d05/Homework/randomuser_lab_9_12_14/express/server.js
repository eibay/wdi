var express=require("express");
var bodyParser = require('body-parser')
var dbConfig = {
  client: 'pg',
  connection: {
    host: 'localhost',
    user: 'Conor',
    database: 'characters',
    charset: 'utf8'
  }
};
var knex = require('knex')(dbConfig);
var bookshelf = require('bookshelf')(knex);
var jade=require("jade");
var request=require('request');
var Promise = require("bluebird");

var app=express();
app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())
var router=express.Router();

app.set('bookshelf', bookshelf);
var bookshelf = app.get('bookshelf');
app.use("/", router);
app.set('views', "./views");
app.set('view engine', 'jade');
app.use(express.static(__dirname + '/public'));


router.get("/", function(req, res){

	var page=1;
	if(parseInt(req.query.page) > 1){
	 page=parseInt(req.query.page);
	}
	var next_page=page+1;
	var previous_page=page-1;


		request({
		  uri: "http://127.0.0.1:3000/users?page="+page+"&page_length=5",
		  method: "GET",
			}, function(error, response, body) {
		  	var users=JSON.parse(body);
		  	debugger;
		  	res.render('index.jade', {users: users, next_page: next_page, title: 'My Characters Site', previous_page: previous_page})
		});
});

router.get("/user/:id", function(req,res){
	
		request({
		  uri: "http://127.0.0.1:3000/user/"+req.params.id,
		  method: "GET",
			}, function(error, response, body) {
		  	var user=JSON.parse(body);

		  	var Comment = bookshelf.Model.extend({
 			  tableName: 'comments'
				});

		  	var comment = new Comment();
			 comment.where({character_id: parseInt(req.params.id)})
  			.fetchAll()
			  .then(function(comments) {
					debugger;
			    res.render('user.jade', {user: user, title: user.name, comments: comments.models})
			  });

		  	
		});
});

router.post("/addcomment/:id", function(req, res){
	var id=req.params.id;



	var Comment = bookshelf.Model.extend({
  tableName: 'comments'
	});
	Comment.forge({content: req.body.content, character_id: parseInt(id), author: req.body.user}).save().then(function() {

        res.redirect("/user/"+id)
      });
});


router.post("/adduser", function(req,res){


			request({
		  uri: "http://127.0.0.1:3000/user/create",
		  method: "POST",
			}, function(error, response, body) {
		  	var user=JSON.parse(body);


		  	res.redirect("/user/"+user.id)
		});

});
app.listen(2000)