#!/bin/bash
#
#SBATCH --job-name=Anneal_train
#SBATCH --cpus-per-task=8
#SBATCH --partition=sm-gpu-1
#SBATCH --time=120:00:00
#SBATCH --mem=500G
#SBATCH --output=/data2/mukhtar_lab/tzhengz/new_attemp/0_preproc_dataset/subset_Arabidopsis/train/trainandtest/Anneal-lr4-epoch10/test.out
#SBATCH --error=/data2/mukhtar_lab/tzhengz/new_attemp/0_preproc_dataset/subset_Arabidopsis/train/trainandtest/Anneal-lr4-epoch10/test.err
#SBATCH --mail-type=all
#SBATCH --mail-user=tzhengz@clemson.edu
module load python3.8/3.8.4

python /data2/mukhtar_lab/tzhengz/new_attemp/0_preproc_dataset/subset_Arabidopsis/train/1_hyperopt_BCE_best.py /data2/mukhtar_lab/tzhengz/new_attemp/0_preproc_dataset/subset_Arabidopsis/data/subset_Arabidopsis_train_test_10000bp.h5 --trails ../../Anneal-lr4-epoch10/hyperopt_trails/params.p --gpu-device 0 --mode "train" --lr 1e-4
python /data2/mukhtar_lab/tzhengz/new_attemp/0_preproc_dataset/subset_Arabidopsis/train/1_hyperopt_BCE_best.py /data2/mukhtar_lab/tzhengz/new_attemp/0_preproc_dataset/subset_Arabidopsis/data/subset_Arabidopsis_train_test_10000bp.h5 --trails ../../Anneal-lr4-epoch10/hyperopt_trails/params.p --gpu-device 0 --mode "test"

