var www_auth = {
      'WWW-Authenticate': 'Basic realm="Zone à accès restreint"',
      'Content-Type': 'text/plain; charset=utf-8'
    }
  , send401 = function(res) {
      res.writeHead(401, www_auth);
      res.end('La connexion a échoué')
    }
  , basic_auth = function(req,res,next) {
      var auth = require('basic-auth')
        , credentials = auth(req)
      ;
      if ( ! credentials ) send401(res);
      else if ( credentials.name != 'root' || credentials.pass != 'password' ) {
       // en cas de tentative ratée on ajoute une temporisation
       setTimeout(send401, 5000, res);
      }
      else next();
    }
  , connect = require('connect')
  , app = connect()
     .use(basic_auth)
     .use('/reset',function(req,res) { send401(res); })
     .use(function(req,res) {
        res.writeHead(200, { 'Content-Type': 'text/plain; charset=utf8' });
        res.end('Authentification réussie...');
     })
;
app.listen(8080);

