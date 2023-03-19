import os, re

import numpy as np
import pandas as pd

df_test=pd.read_csv('/mnt/HDD8T1/tianchi/baseline/OpenBG-IMG-main/data/OpenBG-IMG/test.tsv',sep='\t',header=None)
df_result = pd.read_csv('./results/result.tsv',sep='\t',header=None)
df_test.columns=["head","relation","target"]
df_result.columns=["head", "relation", "1", "2", "3", "4","5","6","7","8","9","10"]
df = pd.merge(df_test, df_result, how='inner')
print(df["target"])
hit1 = 0
hit3 = 0
hit10 = 0
MRR = 0
for i in range(10930):
    rank = df.columns[df.loc[i].isin([df["target"][i]])]

    try:
        MRR_tmp = 1/int(rank[1])
        if int(rank[1]) <= 1:
            hit1 = hit1 + 1
        if int(rank[1]) <= 3:
            hit3 = hit3 + 1
        if int(rank[1]) <= 10:
            hit10 = hit10 + 1
    except:
        MRR_tmp = 0
    MRR = MRR + MRR_tmp

MRR = MRR/10930
hit1 = hit1/10930
hit3 = hit3/10930
hit10 = hit10/10930
print('MRR',MRR)
print('hit1',hit1)
print('hit3',hit3)
print('hit10',hit10)

