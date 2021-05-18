import nltk

nltk.data.show_cfg('grammars/book_grammars/sql0.fcfg')

from nltk import load_parser
cp = load_parser('grammars/book_grammars/sql0.fcfg')
query = 'What cities are located in China'
trees = list(cp.parse(query.split()))
answer = trees[0].label()['SEM']
answer = [s for s in answer if s]
q = ' '.join(answer)
print(q)

userInput = input("[Return] to move on.")

from nltk.sem import chat80
rows = chat80.sql_query('corpora/city_database/city.db', q)
for r in rows: 
    print(r[0], end=" ")

print()

userInput = input("[Return] to move on.")

nltk.boolean_ops()

read_expr = nltk.sem.Expression.fromstring
read_expr('-(P & Q)')
read_expr('P & Q')
read_expr('P | (R -> Q)')
read_expr('P <-> -- P')

val = nltk.Valuation([('P', True), ('Q', True), ('R', False)])
print(val['P'])

userInput = input("[Return] to move on.")

dom = set()
g = nltk.Assignment(dom)
m = nltk.Model(dom, val)

print(m.evaluate('(P & Q)', g))
print(m.evaluate('-(P & Q)', g))
print(m.evaluate('(P & R)', g))
print(m.evaluate('(P | R)', g))

userInput = input("[Return] to move on.")
print("Done")
