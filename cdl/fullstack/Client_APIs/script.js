function init_footer() {

  var body = document.querySelector('body')
    , date = new Date(document.lastModified)
    , div, a, img
  ;
  body.appendChild( document.createElement('hr'));

  div = document.createElement('div');
  div.style.position = 'absolute';
  div.className = 'tiny';
  div.textContent = '\u00A9 Daniel Muller';
  body.appendChild(div);

  div = document.createElement('div');
  div.style.position = 'absolute';
  div.style.right = '2em';
  div.className = 'tiny';
  div.textContent = 'Dernière modification : '+date.toLocaleDateString();
  body.appendChild(div);

  img = document.createElement('img');
  img.src = 'html5-badge-h-solo.png';
  img.width = '63';
  img.height = '64';
  img.alt = img.title = 'HTML5 Powered';

  a = document.createElement('a');
  a.href = 'http://validator.w3.org/check?uri=referer';
  a.appendChild(img);

  div = document.createElement('div');
  div.style.textAlign='center';
  div.appendChild(a);

  body.appendChild(div);
}

init_toggles = function() {
  var toggles = document.querySelectorAll('span.toggle')
    , n
  ;
  for ( n = 0; n < toggles.length; n++ ) {
    toggle = toggles[n];
    toggle.parentNode.style.overflow = 'hidden';
    toggle.onclick = function(e) {
      var h = ((typeof(e.toggleClosed) == 'undefined') ? this.parentNode.style.height : !e.toggleClosed);
      this.parentNode.style.height = ( h ? '' : '1em' );
      this.firstChild.nodeValue = ( h ? '-' : '+' );
      this.title = ( h ? 'Cliquer pour fermer' : 'Cliquer pour ouvrir' );
    };
    toggle.onclick({toggleClosed: (toggle.firstChild.nodeValue == '+')});
  }
};
