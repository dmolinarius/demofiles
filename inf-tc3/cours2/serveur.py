import http.server
import socketserver

# on crée une instance de la classe socketserver.TCPServer
# qui correspond au type de serveur qui nous convient
httpd = socketserver.TCPServer(

        # adresse IP par défaut 127.0.0.1 et port 8080
        ("", 8080),

        # gestionnaire de requêtes pour servir des ressources statiques
        http.server.SimpleHTTPRequestHandler
    )

# on démarre le serveur, qui se lance dans une boucle infinie
# en l'attente de requêtes provenant de clients éventuels...
httpd.serve_forever()
