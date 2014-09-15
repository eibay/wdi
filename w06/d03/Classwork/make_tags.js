
// 5. Make Tags

//   The web is built with HTML strings like "<i>Yay</i>" which draws Yay as italic text. In this example, the "i" tag makes <i> and </i> which surround the word "Yay". Given tag and word strings, create the HTML string with tags around the word, e.g. "<i>Yay</i>".

//   ```javascript
//   makeTags('i', 'Yay')
//   // '<i>Yay</i>'
//   makeTags('i', 'Hello')
//   // '<i>Hello</i>'
//   makeTags('cite', 'Yay')
//   // '<cite>Yay</cite>'
//   ```



var make_tags = function(tag, string){
 return ("<" + tag + ">" + string + "</" + tag + ">");
};

console.log(make_tags("i", "Yay"));
console.log(make_tags("i", "Hello"));
console.log(make_tags("cite", "Yay"));