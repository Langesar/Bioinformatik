if (!require("BiocManager", quietly = TRUE))
BiocManager::install(version = "3.15")
install.packages("BiocManager")
BiocManager::install("DESeq2")
BiocManager::install("GenomeInfoDbData")

library( "DESeq2" )
library(ggplot2)


# get count dataset
count_matrix <- as.matrix(read.csv("/Users/kiwi/df_sc.csv", row.names = "gene"))
# view first two rows
head(count_matrix, 2)

# drop length column
count_matrix <- count_matrix[, -7]
head(count_matrix, 2)


coldata <- data.frame(
  sample = c( "ctr1", "ctr2", "ctr3", "trt1", "trt2", "trt3" ),
  condition = c( "control", "control",  "control", "infected", "infected", "infected" ), 
  row.names = "sample" )
coldata$condition <- as.factor(coldata$condition)


dds <-DESeqDataSetFromMatrix(countData = count_matrix, colData = coldata, 
                              design = ~ condition)



dds <- dds[rowSums(counts(dds)) >= 5,]


# set control condition as reference
dds$condition <- relevel(dds$condition, ref = "control")


# perform the analysis
dds <- DESeq(dds)


# get the results
res <- results(dds)  # same as results(dds, name="condition_infected_vs_control") or results(dds, contrast = c("condition", "infected", "control") )

res


# order the results by adjusted p-values

res[order(res$padj),]  

# write result to a csv
write.csv(as.data.frame(res[order(res$padj),] ), file="condition_infected_vs_control_dge.csv")

# summarise at a significnae threhsold of 0.05

summary(results(dds, alpha=0.01))


### Volcano Plot

#reset par
par(mfrow=c(1,1))
# Make a basic volcano plot
with(res, plot(log2FoldChange, -log10(pvalue), pch=20, main="Volcano plot", xlim=c(-3,3)))

# Add colored points: blue if padj<0.01, red if log2FC>1 and padj<0.05)
with(subset(res, padj<.01 & log2FoldChange>0), points(log2FoldChange, -log10(pvalue), pch=20, col="red"))
with(subset(res, padj<.01 & log2FoldChange<0), points(log2FoldChange, -log10(pvalue), pch=20, col="blue"))

