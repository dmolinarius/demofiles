import sqlite3

personnes = [
    {'id': 'jad', 'Prénom': 'Jean', 'Nom': 'Aymard', 'email': 'jeannot@caramail.fr'},
    {'id': 'rde', 'Prénom': 'Raymond', 'Nom': 'Deubaze', 'email': 'rdeubaze@ec-lyon.fr'},
    {'id': 'epe', 'Prénom': 'Elsa', 'Nom': 'Plique', 'email': 'elsap@wanadoo.fr'},
    {'id': 'jte', 'Prénom': 'Justine', 'Nom': 'Titgoute', 'email': 'justine421@gmail.com'},
    {'id': 'jpu', 'Prénom': 'Jean', 'Nom': 'Peuplu', 'email': 'johnp@northwest.com'},
    {'id': 'can', 'Prénom': 'Charles', 'Nom': 'Atan', 'email': 'charlatan@ecp.fr'},
    {'id': 'jbr', 'Prénom': 'Jean', 'Nom': 'Bombeur', 'email': 'cornichon@sandwich.fr'},
    {'id': 'jdn', 'Prénom': 'Jasmine', 'Nom': 'Derien', 'email': 'jasder@ovh.com'},
    {'id': 'jcy', 'Prénom': 'John', 'Nom': 'Canary', 'email': 'piaf@facebook.com'}
]

conn = sqlite3.connect('personnes.sqlite')
c = conn.cursor()

c.execute("DROP TABLE IF EXISTS personnes")
c.execute("CREATE TABLE personnes (id PRIMARY KEY, Prénom, Nom, email)")

for p in personnes:
  c.execute('INSERT INTO personnes VALUES (?, ?, ?, ?)',
            (p['id'], p['Prénom'], p['Nom'], p['email']))

conn.commit()
