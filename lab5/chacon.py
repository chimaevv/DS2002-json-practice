import json
import pandas as pd

with open('../data/schacon.repos.json', 'r') as f:
    d = json.load(f)

rlist = []
for r in d[:5]:
    rec = {
        'name': r['name'],
        'html_url': r['html_url'],
        'updated_at': r['updated_at'],
        'visibility': r['visibility']
    }
    rlist.append(rec)

df = pd.DataFrame(rlist)
df.to_csv('chacon.csv', index=False, header=False)

