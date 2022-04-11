import json

with open('personnes.json',encoding="utf-8") as jsonfile:
    personnes = json.load(jsonfile)

for p in personnes:
	print(p)
