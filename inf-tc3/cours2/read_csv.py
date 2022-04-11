import csv

personnes = []
with open('personnes.csv',encoding="utf-8") as csvfile:
    reader = csv.DictReader(csvfile,delimiter=';')
    for row in reader:
        personnes.append(dict(row))

for p in personnes:
	print(p)
