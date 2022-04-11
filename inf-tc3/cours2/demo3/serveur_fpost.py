import http.server
import socketserver
from urllib.parse import urlparse, parse_qs

# définition du nouveau handler
class RequestHandler(http.server.SimpleHTTPRequestHandler):

  # nom du serveur
  server_version = "demo3/serveur_fpost"

  # sous-répertoire racine des documents statiques
  static_dir = '/client'

  # traitement des requêtes GET
  def do_GET(self):
    self.init_params()

    # on vérifie si le chemin commence par /service
    if self.path_info[0] == "service":
      response = '<!DOCTYPE html><title>hello</title><meta charset="utf-8">' +\
        '<p>Bonjour {} {}</p>'.format(self.params['Prenom'][0],self.params['Nom'][0])
      self.send(response)

    else:
      # on modifie le chemin d'accès en insérant un répertoire préfixe
      self.path = self.static_dir + self.path

      # on traite la requête via la classe parent
      http.server.SimpleHTTPRequestHandler.do_GET(self)

  # traitement des requêtes POST
  def do_POST(self):
    self.init_params()
    if self.path_info[0] == 'service':
      response = '<!DOCTYPE html><title>hello</title>' + \
        '<meta charset="utf-8"><p>Bonjour {} {}</p>' \
        .format(self.params['Prenom'][0],self.params['Nom'][0])
      self.send(response)
    else:
      self.send_error(405)

  # envoi d'une réponse
  def send(self,body):
     self.send_response(200)
     self.end_headers()
     encoded = bytes(body, 'UTF-8')
     self.wfile.write(encoded)

  # récupération des arguments de la requête
  def init_params(self):
    # analyse de l'adresse
    info = urlparse(self.path)
    self.path_info = info.path.split('/')[1:]
    self.query_string = info.query
    self.params = parse_qs(info.query)

    # récupération du corps
    length = self.headers.get('Content-Length')
    ctype = self.headers.get('Content-Type')
    if length:
      self.body = str(self.rfile.read(int(length)),'utf-8')
      if ctype == 'application/x-www-form-urlencoded' : 
        self.params = parse_qs(self.body)

# instanciation et lancement du serveur
httpd = socketserver.TCPServer(("", 8080), RequestHandler)
httpd.serve_forever()
