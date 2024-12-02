library(Biostrings)

# Read FASTA 
input_file <- "/data2/mukhtar_lab/tzhengz/new_attemp/0_preproc_dataset/subset_Arabidopsis/Arabidopsis_updown10000bp.fa"
sequences <- readDNAStringSet(input_file)

#  'R', 'W', 'Y' to 'N'
modified_sequences <- chartr("WSMKRDY", "NNNNNNN", sequences)


output_file <- "/data2/mukhtar_lab/tzhengz/new_attemp/0_preproc_dataset/subset_Arabidopsis/Arabidopsis_updown10000bp.fa"
writeXStringSet(modified_sequences, filepath = output_file)

library(Seurat)
data <- readRDS(file = "/data2/mukhtar_lab/tzhengz/new_attemp/0_preproc_dataset/subset_Arabidopsis/subset_Arabidopsis.rds")
Idents(data) <- 'cellType'
cell_info <- data.frame(
  Cell = colnames(data),
  Species = "Arabidopsis",
  Celltype = data@meta.data$cellType,
  Cluster = data@meta.data$seurat_clusters

)

write.table(cell_info, file = "/data2/mukhtar_lab/tzhengz/new_attemp/0_preproc_dataset/subset_Arabidopsis/cell_metadata_with_subset_Arabidopsis.txt", sep = "\t", row.names = FALSE, quote = FALSE)

