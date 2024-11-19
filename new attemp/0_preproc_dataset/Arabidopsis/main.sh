#!/bin/bash
#
#SBATCH --job-name=pre0
#SBATCH --cpus-per-task=10
#SBATCH --partition=sm-bigmem-1
#SBATCH --time=120:00:00
#SBATCH --mem=800G
#SBATCH --output=/data2/mukhtar_lab/tzhengz/new_attemp/0_preproc_dataset/Test_Arabidopsis/prepare.out
#SBATCH --error=/data2/mukhtar_lab/tzhengz/new_attemp/0_preproc_dataset/Test_Arabidopsis/prepare.err
#SBATCH --mail-type=all
#SBATCH --mail-user=tzhengz@clemson.edu

#python 0_proc_prom_region_seq.py ./Arabidopsis_thaliana.TAIR10.dna.toplevel.fa ./Arabidopsis_thaliana.TAIR10.59.gtf 10000 10000 >Arabidopsis_updown10000bp.fa 2>log.Arabidopsis_updown10000bp.fa

#python 0_onehot_genome.py ./Arabidopsis_updown10000bp.fa ./Arabidopsis_updown10000bp.onehot.p

python 1_MAGIC_MCA.py

Onehot=/data2/mukhtar_lab/tzhengz/new_attemp/0_preproc_dataset/Test_Arabidopsis/Arabidopsis_updown10000bp.onehot.p
GTF=/data2/mukhtar_lab/tzhengz/new_attemp/0_preproc_dataset/Test_Arabidopsis/gtf_annotation.csv
Label=/data2/mukhtar_lab/tzhengz/new_attemp/0_preproc_dataset/Test_Arabidopsis/subset_Arabidopsis_mincell20_t1e-3.p
Annotation=/data2/mukhtar_lab/tzhengz/new_attemp/0_preproc_dataset/Test_Arabidopsis/cell_metadata_with_subset_Arabidopsis.txt

python 2_propare_datasets.py train_test_split $Onehot $Label $Annotation ./data/Arabidopsis.train_test_1000bp.h5 10000
python 2_propare_datasets.py cross_valid $Onehot $Label $Annotation ./cross_vaild/ 10000
