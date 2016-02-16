var connect = require('connect')
  , serveStatic = require('serve-static')
  , app = connect()
     .use(serveStatic('htdocs'))
     .use(function(request,response) {
        response.writeHead(404, { 'Content-Type': 'text/plain; charset=utf8' });
        response.end('Désolé, le document demandé est introuvable...');
     })
;
app.listen(8080);
