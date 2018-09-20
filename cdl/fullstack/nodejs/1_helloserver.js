var server = require('http').createServer( function(req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end("hello, world\n");
});
server.listen(8080);
console.log('Adresse du serveur: http://localhost:8080/');
