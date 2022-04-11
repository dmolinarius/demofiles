from lxml import etree

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

# création de l'arbre XML en mémoire
root = etree.fromstring('<personnes/>')
for p in personnes:
    personne = etree.SubElement(root, 'personne')
    for a in ['id','Prénom','Nom','email']:
            etree.SubElement(personne, a).text = p[a]

# sérialisation dans un fichier
with open('personnes.xml', 'wb') as f:
    f.write(etree.tostring(root, pretty_print=True, encoding='UTF-8'))
