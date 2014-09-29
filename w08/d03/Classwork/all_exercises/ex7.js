var hash_attack = require("./ex6.js");

function colorsLuvsIt(hash_attack){
  var hash_keys = Object.keys(color_hash);
  var vals = hash_keys.map(function(v){
    return color_hash[v];
  })
  return vals
}

colorsLuvsIt();
