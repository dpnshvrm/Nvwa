library(rhdf5)
file_path <- "D:/Nvwa/Dataset_Human/Dataset.Human_Chrom8_train_test.h5"
h5ls(file_path)
library(zellkonverter)
library(SingleCellExperiment)
sce <- readH5AD("D:/Nvwa/14703003/Drosophila_Fig1_adata.h5ad")
library(Biostrings)

# Read FASTA 
input_file <- "D:/Nvwa/data/preparation/Arabidopsis/Arabidopsis_updown500bp.fa"
sequences <- readDNAStringSet(input_file)

#  'R', 'W', 'Y' to 'N'
modified_sequences <- chartr("WSMKRY", "NNNNNN", sequences)


output_file <- "D:/Nvwa/data/preparation/Arabidopsis/Arabidopsis_updown500bp.fa"
writeXStringSet(modified_sequences, filepath = output_file)

##create annotation files
library(Seurat)
data <- readRDS(file = "D:/cross-species-studies_rice_vs_At/cross-species-studies_rice_vs_At/training data for rice and arab/Arabidopsis/1_Arabidopsis_PlantscGRN.rds")


cell_info <- data.frame(
  Cell = colnames(data),
  Species = "Arabidopsis",
  Celltype = data@meta.data$cellType,
  Cluster = data@meta.data$seurat_clusters
  
)

write.table(cell_info, file = "D:/Nvwa/data/preparation/Arabidopsis/cell_metadata_with_Arabidopsis.txt", sep = "\t", row.names = FALSE, quote = FALSE)
