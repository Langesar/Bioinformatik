library(dslabs)
library(tidyverse)
install.packages("phangorn")
library(phangorn)
fdir <- system.file("extdata/trees", package = "phangorn")
primates <- read.phyDat(file.path(fdir, "primates.dna"),
                        format = "interleaved")

dm_primates <-dist.ml(primates) #Distance Matrix erstellen
plot(dm_primates)

#phylogenetische Stammbäume erstellen

UPGMA_primates <-upgma(dm_primates)
NJ_primates <-nj(dm_primates)

plot(UPGMA_primates)
plot(unroot(NJ_primates), type = "unrooted", cex =0.7, use.edge.length = TRUE, no.margin = TRUE)
