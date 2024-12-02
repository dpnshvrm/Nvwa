import magic
import numpy as np
import scanpy as sc
import pandas as pd
import os
#from sys import argv

#singlecell, magicsinglecell, singlecelllabel = argv[1:3]
#adata = sc.read("D:/Nvwa/data/preparation/Arabidopsis/ARABI.h5ad")
adata = sc.read("/data2/mukhtar_lab/tzhengz/new_attemp/0_preproc_dataset/subset_Arabidopsis/subset_Arabidopsis.h5ad")
#adata = sc.read(singlecell)
print(adata)

sc.pp.normalize_total(adata, target_sum = 1e5)
sc.pp.filter_genes(adata, min_cells = 20)
sc.pp.filter_cells(adata, min_genes = 50)
print(adata)

sc.pp.log1p(adata, base = 2)
df_adata = pd.DataFrame(adata.X.toarray(), columns = adata.var_names, index = adata.obs_names)

magic_op = magic.MAGIC()
df_adata_magic = magic_op.fit_transform(df_adata)

#adata_magic = sc.AnnData(df_adata_magic)
#adata_magic.write("MCA_MAGIC_merge_E95_E105_raw.h5ad", compression = True)
#adata_temp = sc.read("./MCA_MAGIC_merge_E95_E105_raw.h5ad")
#df_adata_magic = pd.DataFrame(adata_temp.X, columns = adata_temp.var_names, index = adata_temp.obs_names)

df_adata_magic2 = df_adata_magic*100
df_adata_magic2 = df_adata_magic2.astype(int)
df_adata_magic2 = df_adata_magic2/100

#df2csv(df_adata_magic2,"HCL_MAGIC_int.csv")
adata_magic2 = sc.AnnData(df_adata_magic2)
#adata_magic2.write(magicsinglecell, compression = True)
#adata_magic2.write("D:/Nvwa/data/preparation/Arabidopsis/ARABI_MAGIC.h5ad", compression = True)
adata_magic2.write("subset_Arabidopsis_MAGIC.h5ad", compression = True)

df = adata_magic2.to_df().T
df[df >= 0.001] = 1
df[df < 0.001] = 0
#df.to_pickle(singlecelllabel)
#df.to_pickle("D:/Nvwa/data/preparation/Arabidopsis/Arabidopsis_mincell20_t1e-3.p")
df.to_pickle("/data2/mukhtar_lab/tzhengz/new_attemp/0_preproc_dataset/subset_Arabidopsis/subset_Arabidopsis_mincell20_t1e-3.p")
print(df.sum(0))
print(df.sum(0)/df.shape[0])


#import numpy as np
#import scanpy as sc
#import pandas as pd
#import os

#adata = sc.read("/data2/mukhtar_lab/tzhengz/new_attemp/0_preproc_dataset/Arabidopsis/data_10000/prepare_dataset/ARABI_MAGIC.h5ad")
#print(adata)
#sc.pp.filter_genes(adata, min_cells = 10)
#print(adata)

#df = adata.to_df().T
#df[df >= 0.001] = 1
#df[df < 0.001] = 0
#df.to_pickle("/data2/mukhtar_lab/tzhengz/new_attemp/0_preproc_dataset/Arabidopsis/data_10000/prepare_dataset/Arabidopsis_mincell20_t1e-3_10000.p")
#print(df.sum(0))
#print(df.sum(0)/df.shape[0])
