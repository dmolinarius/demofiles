import sqlite3
conn = sqlite3.connect('personnes.sqlite')

c = conn.cursor()
c.execute("DROP TABLE IF EXISTS personnes")
c.execute("CREATE TABLE personnes (id PRIMARY KEY, Prénom, Nom, email)")
conn.commit()
