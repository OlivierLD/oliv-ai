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

from nltk.sem import chat80
rows = chat80.sql_query('corpora/city_database/city.db', q)
for r in rows: print(r[0], end=" ")
