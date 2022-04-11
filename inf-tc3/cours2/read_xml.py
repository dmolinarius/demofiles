from lxml import etree

personnes = []
doc = etree.parse("personnes.xml")
for p in doc.getroot():
    personne = {}
    for a in p:
        personne[a.tag] = a.text
    personnes.append(personne)

for p in personnes:
	print(p)
