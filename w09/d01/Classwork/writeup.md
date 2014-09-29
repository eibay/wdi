##What is a Single Page Application? 

A Single Page Application is a kind of web application that only uses one HTML/XTML document. The server only sends out one such document, along w/ the JavaScript, the stylesheets, etc. This document is then made to look like multiple views, updated to reflect the activity of users, using extensive DOM manipulation. 

##Why is AJAX important in making one? 

The document has to send out data reflecting the users' activities. It also has to request data necessary to the application's functions. Instead of doing this by sendin' out requests for pages, which are formed on the server, it does this by sending out requests for data, and then the page is reformulated to reflect this data. 

##Where does Backbone fit into this? 

Backbone is a client-side JavaScript framework, just as Sinatra is a server-side Ruby framework, for building web applications. It is described in terms of Observers & Subjects, corresponding to views & models. 