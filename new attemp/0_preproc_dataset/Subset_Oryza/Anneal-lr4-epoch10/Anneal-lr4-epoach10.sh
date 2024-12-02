#!/bin/bash
#
#SBATCH --job-name=Anneal
#SBATCH --cpus-per-task=8
#SBATCH --partition=sm-gpu-1
#SBATCH --time=120:00:00
#SBATCH --mem=500G
#SBATCH --output=/data2/mukhtar_lab/tzhengz/new_attemp/0_preproc_dataset/subset_Oryza/train/Anneal-lr4-epoch10/test.out
#SBATCH --error=/data2/mukhtar_lab/tzhengz/new_attemp/0_preproc_dataset/subset_Oryza/train/Anneal-lr4-epoch10/test.err
#SBATCH --mail-type=all
#SBATCH --mail-user=tzhengz@clemson.edu

python /data2/mukhtar_lab/tzhengz/new_attemp/0_preproc_dataset/subset_Oryza/train/0_hyperopt_BCE_anneal.py 0 /data2/mukhtar_lab/tzhengz/new_attemp/0_preproc_dataset/subset_Oryza/data/subset_Oryza_train_test_10000bp.h5
