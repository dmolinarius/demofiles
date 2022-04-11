import csv

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

with open('personnes.csv', 'w', encoding='utf-8', newline='\n') as f:
    fieldnames = ['id', 'Prénom', 'Nom', 'email']
    writer = csv.DictWriter(f, fieldnames=fieldnames, delimiter=';')

    writer.writeheader()
    for p in personnes:
        writer.writerow(p)
