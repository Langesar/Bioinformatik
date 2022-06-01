library(dslabs)
library(tidyverse)
library(text.alignment)
library(cluster)

#Installation des msa-Packages
#Quelle: http://www.bioinf.jku.at/software/msa/

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("msa")

library(msa)

#Sequenz importieren
Sequences <-read.table("/Users/kiwi/human_ACTG_isoforms.txt")
Sequences

show(Sequences$V1[1])
class(Sequences)
nrow(Sequences)


Sequence_String <- AAString("Sequence")
nchar(Sequence_String)
class(Sequence_String)

length(Sequence_String)
alphabet(Sequence_String)
msaClustalOmega(Sequence_String)
#warum funktioniert das nicht? Ist doch eigentlich ein XStringSet 

Sequence_String <-as.data.frame(t(Sequences))#tauscht rows und columns

Sequence_String
nchar(Sequence_String) # Sequenzen sind gleich lang
show(Sequence_String$V1)
class(Sequence_String$V1)

Sequence_String[Sequence_String$V1 %in% Sequence_String$V2]
Sequence1 <-Sequence_String$V1
Sequence2 <-Sequence_String$V2
Sequence3 <-Sequence_String$V3
Sequence4 <-Sequence_String$V4
Sequence5 <-Sequence_String$V5
Sequence6 <-Sequence_String$V6
Sequence7 <-Sequence_String$V7
Sequence8 <-Sequence_String$V8
Sequence9 <-Sequence_String$V9




Sequence1 %in% Sequence2
Sequence1
 

for (i in 1:length(Sequence_String$V1)) {
  Sequence1[1:i]!= "-"
  Sequence1[i:length(Sequence_String)]
}
for (j in 1:length(Sequence_String$V2)) {
  Sequence2[1:j] != "-"
  Sequence2[j:length(Sequence_String)]
}
print(i)
print(j)

#warum gibt das nur 1 aus?
#komme ab hier nicht weiter

