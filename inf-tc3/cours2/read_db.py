import sqlite3

conn = sqlite3.connect('personnes.sqlite')
conn.row_factory = sqlite3.Row
c = conn.cursor()

c.execute("SELECT * FROM personnes ORDER By Nom,Prénom")
a = c.fetchall()

personnes = []
for r in a:
    personne = {}
    for k in r.keys():
        personne[k] = r[k]
    personnes.append(personne)

for p in personnes:
	print(p)
