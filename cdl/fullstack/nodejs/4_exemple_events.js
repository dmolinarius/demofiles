var http = require('http');
http.get( 'http://nodejs.org', function(response) {
  response.setEncoding('utf-8');
  response.on('data', function(data) {
    console.log('[DATA]',data);
  });
  response.on('end', function() {
    console.log('[END]');
  });
});
