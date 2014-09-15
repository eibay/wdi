var companies = [
  {name: "apple", location: "cupertino"},
  {name: "google", location: "mountain view"}
];

var path = '/google';
var query = path.split("/")[1];
var result = [];

var companies_in_json = JSON.stringify(companies);
// var result = JSON.stringify(result);

function matchStuff(companies, query){
  for(var i=0;i<companies.length;i++){
    if (companies[i]['name'] == query){
       result.push(companies[i]);
       console.log(result);
    }
  }
};

matchStuff(companies, query);

console.log("####DRACONIC NAMES####")

var adj = [{"beautiful": "vorel"}, {"big": "turalisj"}, {"black":"vutha"}, {"blue":"ulhar"}];
var noun = [{"battle":"vargach"}, {"bronze":"aujir"}, {"blood":"iejir"}, {"bravery":"sveargith"}];

console.log(adj);
console.log(noun);

>>>>>>>>>>>>>>>

var display_result = [];
var name_adj = makeName(adj);
var name_noun = makeName(noun);
display_result.push(name_adj);
display_result.push(name_noun);
var name_result = JSON.stringify(display_result);
var blah = JSON.stringify(Object.keys(display_result[0]));

//   var companies_in_json = JSON.stringify(companies);
//
//
//   if (path == "/"){
//     debugger;
//     response.end(companies_in_json);
//   } else if (path == "/"+ query){
//     debugger; 
//     matchStuff(companies, query);
//     result = JSON.stringify(result);
//     response.end(result);
//   } else {
//     debugger;
//     response.end("err.");
//   }
//
// });
//
//
// server.listen(2000);
