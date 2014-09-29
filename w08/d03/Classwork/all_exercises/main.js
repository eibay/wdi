var fs = require('fs');
var http = require('http');
var httpClient = require('request');
var url = require('url');

var xhr = new XMLHttpRequest();
console.log('XMLHttpRequest');

xhr.open('GET', '/names');
xhr.send();
xhr.addEventListener('load', function(ev){
      console.log('Loaded Names');
});