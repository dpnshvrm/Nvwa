#!/bin/bash
#
#SBATCH --job-name=preArabi
#SBATCH --cpus-per-task=10
#SBATCH --partition=sm-bigmem-1
#SBATCH --time=120:00:00
#SBATCH --mem=800G
#SBATCH --output=/data2/mukhtar_lab/tzhengz/new_attemp/0_preproc_dataset/subset_Arabidopsis/prepare.out
#SBATCH --error=/data2/mukhtar_lab/tzhengz/new_attemp/0_preproc_dataset/subset_Arabidopsis/prepare.err
#SBATCH --mail-type=all
#SBATCH --mail-user=tzhengz@clemson.edu

##if there is "up10000down10000" in log.log.Arabidopsis_updown10000bp.fa, it means this code is done.
python 0_proc_prom_region_seq.py ./Arabidopsis_thaliana.TAIR10.dna.toplevel.fa ./Arabidopsis_thaliana.TAIR10.59.gtf 10000 10000 >Arabidopsis_updown10000bp.fa 2>log.Arabidopsis_updown10000bp.fa
## edit modification.R input_file to your updown10000bp.fa
Rscript ./modification.R

python 0_onehot_genome.py ./Arabidopsis_updown10000bp.fa ./Arabidopsis_updown10000bp.onehot.p
##change adata = sc.read("your .h5ad files") /adata_magic2.write("your_MAGIC.h5ad", compression = True) /df.to_pickle("your mincell20_t1e-3.p")
python 1_MAGIC_MCA.py

Onehot=/data2/mukhtar_lab/tzhengz/new_attemp/0_preproc_dataset/subset_Arabidopsis/Arabidopsis_updown10000bp.onehot.p
GTF=/data2/mukhtar_lab/tzhengz/new_attemp/0_preproc_dataset/subset_Arabidopsis/gtf_annotation.csv
Label=/data2/mukhtar_lab/tzhengz/new_attemp/0_preproc_dataset/subset_Arabidopsis/subset_Arabidopsis_mincell20_t1e-3.p
Annotation=/data2/mukhtar_lab/tzhengz/new_attemp/0_preproc_dataset/subset_Arabidopsis/cell_metadata_with_subset_Arabidopsis.txt


mkdir data
mkdir cross_vaild
python 2_propare_datasets.py train_test_split $Onehot $Label $Annotation ./data/subset_Arabidopsis_train_test_10000bp.h5 10000
python 2_propare_datasets.py cross_valid $Onehot $Label $Annotation ./cross_vaild/ 10000
