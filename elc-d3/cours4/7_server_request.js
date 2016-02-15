var http = require('http');
var server = http.createServer( function(request, response) {

/*
** analyse de la requête
*/
var html = "<!DOCTYPE html>\n" +
  "<title>Node.js server test page</title>\n" +
  "<style>body{font-family:monospace;color:#444;padding:1em;}\n" +
  "dl{margin-left:2em;}dt{margin-top: 0.5em}</style>\n";

html += "<p>request.method = " + request.method + "</p>\n";
html += "<p>request.url = " + request.url + "</p>\n";
html += "<p>request.headers = </p>\n<dl>\n";
for ( header in request.headers ) {
  if ( request.headers.hasOwnProperty(header) ) {
    html += "<dt>" + header + "</dt>\n";
    html += "<dd>" + request.headers[header] + "</dd>\n";
  }
}
html += "</dl>\n";

console.log(request.method);
console.log(request.url);
console.log(request.headers);

request.on('data', function(data) {
  console.log('[DATA] ' + data + "\n");
});


/*
** construction de la réponse
*/
  response.writeHead(200, {
    'Content-Type': 'text/html',         // entêtes de la réponse
    'Server': 'node.js cousu main',       //   ...
    'Cache-Control': 'no-store'           //   ...
  });
  response.write(html);
  response.write('<p>Bye !');
  response.end();
});
server.listen(8080);

//console.log(process);
