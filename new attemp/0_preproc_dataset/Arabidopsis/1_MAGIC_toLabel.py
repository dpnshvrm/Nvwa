import scanpy as sc
import pandas as pd

adata= sc.read_h5ad("D:/Nvwa/data/preparation/Arabidopsis/ARABI.h5ad")
df = adata.to_df().T

df.to_pickle("D:/Nvwa/data/preparation/Arabidopsis/ARABI.p")
