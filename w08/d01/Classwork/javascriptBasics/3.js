
function stringInfo(string){
  var hash = {}
  hash.length = string.length
  hash.original = string
  hash["splitBySlash"] = string.split("/")
  return hash
}