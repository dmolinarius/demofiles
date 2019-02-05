
init_sources = function() {
   // var zones = document.getElementsByClassName("source");
   var zones = document.getElementsByTagName('PRE');
   for ( var n = 0; n < zones.length; n++ ) {
     zone = zones[n];
     if ( zone.className.indexOf('source') == -1 ) continue;
     info = zone.id.match(/source_(.*)$/);
     if ( info[1] ) {
       var c = (zone.className.indexOf('on') == -1 ? '+' : '-');
       zone.innerHTML = '<span class="toggle">' + c + '</span>' +
         document.getElementById("js_"+info[1]).innerHTML.replace(/</g,"&lt;");
     }
   }
};

init_toggles = function() {
   // var toggles = document.getElementsByClassName("toggle");
   var toggles = document.getElementsByTagName('SPAN');
   for ( var n = 0; n < toggles.length; n++ ) {
     toggle = toggles[n];
     if ( toggle.className.indexOf('toggle') == -1 ) continue;
     toggle.parentNode.style.overflow = 'hidden';
     toggle.onclick = function(e) {
       if ( typeof(e.toggleClosed) != 'undefined' ) { // force state
         var h = ! e.toggleClosed;
       }
       else { // toggle state
         var h = this.parentNode.style.height; // '1em' or ''
       }
       this.parentNode.style.height = ( h ? '' : '1em' );
       this.firstChild.nodeValue = ( h ? '-' : '+' );
       this.title = ( h ? 'Cliquer pour fermer' : 'Cliquer pour ouvrir' );
     };
     var closed = (toggle.firstChild.nodeValue == '+' );
     toggle.onclick({toggleClosed: closed}); // initialize state
   }
};

init_buttons = function() {
   // var buttons = document.getElementsByClassName("button");
   var buttons = document.getElementsByTagName('SPAN');
   for ( var n = 0; n < buttons.length; n++ ) {
     button = buttons[n];
     if ( button.className.indexOf('button') == -1 ) continue;

     button.addEventListener('mousedown',function() { this.style.borderStyle = 'inset'; });
     button.addEventListener('mouseup',function() { this.style.borderStyle = 'outset'; });
     button.addEventListener('mouseout',function() { this.style.borderStyle = 'outset'; });
   }
};
