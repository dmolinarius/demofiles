# demo2/serveur.py

import http.server
import socketserver

# numéro du port TCP utilisé par le serveur
server_port = 8080

# Classe dérivée pour traiter les requêtes entrantes du serveur
class RequestHandler(http.server.SimpleHTTPRequestHandler):

  # nom du serveur
  server_version = "demo2/serveur/0.2"

  # sous-répertoire racine des documents statiques
  static_dir = 'client'
  
  # surcharge du constructeur pour imposer 'client' comme sous-répertoire racine
  def __init__(self, *args, **kwargs):
    super().__init__(*args, directory=self.static_dir, **kwargs)

# instanciation et lancement du serveur
httpd = socketserver.TCPServer(("", server_port), RequestHandler)
httpd.serve_forever()
