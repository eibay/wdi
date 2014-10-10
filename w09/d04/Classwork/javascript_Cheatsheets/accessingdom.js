// grab single element
var myTitleLink = document.getElementById("mainTitle");

// information about the node
console.log("This is a node of type: ", myTitleLink.nodeType);
console.log("Inner HTML: ", myTitleLink.innerHTML);
console.log("Child nodes: ", myTitleLink.childNodes.length);

// how many links?
var myLinks = document.getElementsByTagName("a");
console.log("Links: ", myLinks.length);



// here are some extra examples of combining these:

// First, grab a div called "homeNav"
var navItems = document.getElementById("homeNav");

// get information about that node
console.log("This is a node of type: ", navItems.nodeType);
console.log("Inner HTML: ", navItems.innerHTML);
console.log("Child nodes: ", navItems.childNodes.length);

// how many ordered lists?
var orderedLists = document.getElementsByTagName("ol");
console.log("Ordered lists: ", orderedLists.length);

// narrowing down the links further - use another element, not the whole document.
var myLinks = navItems.getElementsByTagName("a");
console.log("Links in navItems: ", myLinks.length);

// or even combined
var x = document.getElementById("mainNav").getElementsByTagName("a");
console.log("Links in mainNav: ", x.length);

var myFirstList = document.getElementbyId("abc");
var limitedList = myFirstList.getElementsByTagName("li");

// Changing the dom

var mainContent = document.getElementById("mainContent");
mainContent.setAttribute("align","right");

mainTitle = document.getElementById("mainTitle");
console.log(mainTitle.innerHTML);

var sidebar = document.getElementById("sidebar");
console.log(sidebar.innerHTML);

var arrayOfH1s = mainContent.getElementsByTagName("h1");
arrayOfH1s[0].innerHTML = "This is a new title";

var ul = document.getElementById("bestList");
var els = ul.getElementsByTag("li");




