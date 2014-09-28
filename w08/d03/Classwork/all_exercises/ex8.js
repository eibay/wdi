function combineHash(hash1, hash2){
  var grand_hash
  hash1_keys = Object.keys(hash1);
  hash2_keys = Object.keys(hash2);
  hash1_vals = [];
  hash1_keys.map(function(v){
    hash1_vals.push(hash1_keys[v]);
  })
  return (hash1_vals);
}

console.log(combineHash({test: 'hi'}, {whoa: 'yes'}));
