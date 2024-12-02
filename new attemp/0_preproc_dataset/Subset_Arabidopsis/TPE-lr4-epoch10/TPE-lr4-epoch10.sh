#!/bin/bash
#
#SBATCH --job-name=TPE_Arabidopsis
#SBATCH --cpus-per-task=8
#SBATCH --partition=sm-gpu-1
#SBATCH --time=120:00:00
#SBATCH --mem=500G
#SBATCH --output=/data2/mukhtar_lab/tzhengz/new_attemp/0_preproc_dataset/subset_Arabidopsis/train/TPE-lr4-epoch10/test.out
#SBATCH --error=/data2/mukhtar_lab/tzhengz/new_attemp/0_preproc_dataset/subset_Arabidopsis/train/TPE-lr4-epoch10/test.err
#SBATCH --mail-type=all
#SBATCH --mail-user=tzhengz@clemson.edu

python /data2/mukhtar_lab/tzhengz/new_attemp/0_preproc_dataset/subset_Arabidopsis/train/0_hyperopt_BCE_TPE.py 1 /data2/mukhtar_lab/tzhengz/new_attemp/0_preproc_dataset/subset_Arabidopsis/data/subset_Arabidopsis_train_test_10000bp.h5
