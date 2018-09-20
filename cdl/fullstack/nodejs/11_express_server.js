var express = require('express')
  , app = express()
;
app.get('/*',express.static(__dirname + '/htdocs'));
app.get('/user/:id', function(req,res,next){
  if ( parseInt(req.params.id,10) ) {
    res.send('User id : '+req.params.id);
  }
  else next();
});
app.post('/*',function(req,res){
  res.send('POST request to '+req.originalUrl);
});
app.get('/*',function(req,res) {
  res.writeHead(404, { 'Content-Type': 'text/plain; charset=utf8' });
  res.end('Désolé, le document demandé est introuvable...');
});
app.listen(8080);
