# -*- coding: utf-8 -*-
import csv

fname = 'abs 2011 age sex pop.csv'
fields = [ 
  'code1',
	'code2',
	'code3',
	'code4',
	'rollup',
	'sa2name',
	'Males',
	'Females',
	'Persons',
	'blank1',
	'Sex Ratio',
	'blank2',
	'Median age of Males',
	'Median age of Females',
	'Median age of Persons',
	'blank3',
	'People aged 0–14 years',
	'People aged 15–64 years',
	'People aged 65 years and over']

f = open(fname, 'r')

dr = csv.DictReader(f, fieldnames=fields)

rows = []
codes = {}

for row in dr:

	
	for field in fields[:4]:
		if row[field]:
			codes[field] = row[field]

	if row['sa2name'] and len(codes) == 4: 
		for field in fields[:4]:
			row[field] = codes[field]
		row['sa2code'] = ''.join([codes[x] for x in fields[:4]])

		new_row = row.copy()
		# remove the old codes
		[new_row.pop(x) for x in fields[:4]]

		# remove blanks
		new_row = dict(filter(lambda x: x[1], new_row.items()))
		rows.append(new_row)

new_fields = rows[0].keys()
ofname = 'abs2011_age_sex_pop.csv'
of = open(ofname, 'w')
dw = csv.DictWriter(of, new_fields)
dw.writeheader()
dw.writerows(rows)
of.close()
