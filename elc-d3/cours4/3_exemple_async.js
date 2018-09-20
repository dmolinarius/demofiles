var http = require('http');

http.get('http://nodejs.org/', function(res) {
  console.log(res.headers);
});
console.log('hello,world');
