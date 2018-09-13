var fs = require('fs')
  , myStream = fs.createWriteStream('./writestream.out',{flags: 'a'})
  , now = new Date();
;
myStream.write(now.toString()+"\n");
