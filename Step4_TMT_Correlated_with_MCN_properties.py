# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""
# Relationship between MCN proeprties and TMT B-A scores  

import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd


sns.set(style='white',color_codes=True)

path = '***\\data.csv'
iris = pd.read_csv(path, header=None, names=['C','L','Ge','Le', 'TMTBA_Scores'])

sns.jointplot(x="C", y="TMTBA_Scores",
              data=iris,
              joint_kws={'color':'grey','line_kws':{'color':'darkblue'}},
              marginal_kws={'color':'darkblue'},
              kind="reg")

plt.savefig('***\\TMT_Correlated_with_MCN_C.eps', format='eps', dpi=1000)

#plt.show()


