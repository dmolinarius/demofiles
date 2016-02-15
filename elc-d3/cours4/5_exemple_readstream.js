var fs = require('fs')
  , myStream = fs.createReadStream('./5_exemple_readstream.js')
;
myStream.setEncoding('utf-8');
myStream.on('data', function(data) {
  console.log(data);
});
