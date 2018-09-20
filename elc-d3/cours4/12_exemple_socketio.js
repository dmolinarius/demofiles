/*
** pour utiliser ce serveur, il faut charger la page /ioclient.html
*/
var connect = require('connect')
  , serveStatic = require('serve-static')
  , app = connect()
  , http = require('http')
  , server = http.createServer(app)
  , io = require('socket.io').listen(server)
  , port = 8080
;

/*
** static resource server middleware
*/
app.use(serveStatic('htdocs'));


/*
** 404 Not found custom middleware
*/
app.use(function(request,response) {
  response.writeHead(404, { 'Content-Type': 'text/plain; charset=utf8' });
  response.end('Désolé, le document demandé est introuvable...');
});


/*
** start server
*/
server.listen(port);


/*
** socket connection listener
*/
io.on('connection', function (socket) {
  console.log('client connected');
  socket.emit('hello',{'this': 'is my data'});
});
