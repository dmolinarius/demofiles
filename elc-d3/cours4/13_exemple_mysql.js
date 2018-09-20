var connect = require('connect')
  , serveStatic = require('serve-static')
  , mysql = require('mysql')
  , connection = mysql.createConnection({
      host: 'localhost',
      // Les lignes suivantes sont évidemment à adapter en fonction de votre base de données
      user: 'user',
      password: 'password',
      database: 'user',
      // ATTENTION : la ligne ci-dessous depend du comportement du serveur mysql
      // A commenter donc, si problèmes de caractères accentués...
      // Puisque mysql s'entête à penser que le client utilise le codage LATIN1 et que
      // SET NAMES 'utf8' n'y change rien, on informe notre driver que les données reçues
      // et émises sont codées en latin1...  
      charset: 'LATIN1_SWEDISH_CI'
    })
   , select = function(table,field,value) {
       return "SELECT * FROM `"+table+"` "+(field ? " WHERE `"+field+"`='"+value+"'" : '');
     }
   , element = function(tag,content) {
       return "<"+tag+">"+content+"</"+tag+">";
     }
   , app = connect()
     .use(serveStatic('htdocs'))       // serveur statique

     .use(function(req,res,next) {        // requête mysql
       var info = req.url.split('/')
         , verb = info[1] || ''
         , table = info[2] || ''
         , field = info[3] || ''
         , value = info[4] || ''
         , html = "<!DOCTYPE html><meta charset=\"utf-8\"><title>"+verb+"</title>\n" +
           "<style> table{margin:auto;border-collapse:collapse;box-shadow:5px 5px 5px #888;}" +
           "th,td{border:2px solid #888;padding:5px 0.5em;}th{color:white;background-color:#888}</style>";
       ;
       if ( verb !== 'select' ) return next();

       connection.query( select(table,field,value), function(err, results) {
         var headers_done = false, headers = '';
         var content = '', row;
         if ( err ) {
            res.writeHead(500, { 'Content-Type': 'text/plain; charset=utf-8' });
            res.end('Problème de connexion à la base de données : '+err);
         }
         results.forEach( function(obj,n) {
           row = '';
           for ( var k in obj ) {
             if ( obj.hasOwnProperty(k) ) {
               if ( ! headers_done ) headers += element('th',k);
               row += element('td','('+typeof(obj[k])+') '+obj[k]);
               console.log(n+': '+k+' = '+'('+typeof(obj[k])+')'+obj[k]);
             }
           }
           if ( ! headers_done ) { content += element('tr',headers); headers_done = true; }
           content += element('tr',row);
         });
         html += element('table',content);
         res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' });
         res.end(html);
       });
     })

     .use(function(req,res) {    // 404 NOT FOUND
        res.writeHead(404, { 'Content-Type': 'text/plain; charset=utf-8' });
        res.end('Désolé, le document demandé est introuvable...');
     })
;
require('http').createServer(app).listen(8080);
