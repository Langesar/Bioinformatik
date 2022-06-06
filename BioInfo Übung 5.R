
install.packages("stringr")
library(stringr)
library(stringi)


pattern_elements_1 <-c("C","A", "T", "G")
pattern <-list("ACGTTGCATGTCGCATGATGCATGAGAGCT")
nchar(pattern)

#k=1
Pattern_1 <-stri_paste(rep(c("A","C","G","T"),each=2),c("A","C","G","T"))
result <- t(sapply(pattern, stri_count_fixed,pattern=pattern_elements,overlap=TRUE))
colnames(result) <-pattern_elements
result
#G ist häufigstes 1-mer

#k=2
pattern_elements_2 <-c("CC","AA", "TT", "GG", "AC", "AG", "AT","AA","CG","CT","CA","GA", "GC", "GT","TA","TC","TG")
Pattern_2 <-stri_paste(rep(c("CC","AA", "TT", "GG", "AC", "AG", "AT","AA","CG","CT","CA","GA", "GC", "GT","TA","TC","TG"),each=4),c("CC","AA", "TT", "GG", "AC", "AG", "AT","AA","CG","CT","CA","GA", "GC", "GT","TA","TC","TG"))
result <- t(sapply(pattern, stri_count_fixed,pattern=pattern_elements_2,overlap=TRUE))
colnames(result) <-pattern_elements_2
result
#TG ist häufigstes 2-mer


#k=3
pattern_elements_3 <-c("ACG", "CGT", "GTT", "TTG", "TGC", "GCA", "CAT", "ATG", "TGT", "GTC", "TCG", "CGC", "GCAC", "TGA", "GAT", "TGC", "GCA", "GAG", "AGA", "AGC", "GCT")
Pattern_3 <-stri_paste(rep(c("ACG", "CGT", "GTT", "TTG", "TGC", "GCA", "CAT", "ATG", "TGT", "GTC", "TCG", "CGC", "GCAC", "TGA", "GAT", "TGC", "GCA", "GAG", "AGA", "AGC", "GCT"),each=4),c("ACG", "CGT", "GTT", "TTG", "TGC", "GCA", "CAT", "ATG", "TGT", "GTC", "TCG", "CGC", "GCAC", "TGA", "GAT", "TGC", "GCA", "GAG", "AGA", "AGC", "GCT"))
result <- t(sapply(pattern, stri_count_fixed,pattern=pattern_elements_3,overlap=TRUE))
colnames(result) <-pattern_elements_3
result
#ATG ist häufigstes 3-mer

#k=4
pattern_elements_4 <-c("ACGT", "CGTT", "GTTG", "TTGC", "TGCA", "CATG", "ATGT", "TGTC", "GTCG", "TCGC", "CGCA", "GCAT", "ATGA", "TGAT", "GATG", "ATGC", "TGCA", "GCAT", "ATGA", "TGAG", "GAGA", "AGAG", "GAGC", "AGCT")
Pattern_4 <-stri_paste(rep(c("ACGT", "CGTT", "GTTG", "TTGC", "TGCA", "CATG", "ATGT", "TGTC", "GTCG", "TCGC", "CGCA", "GCAT", "ATGA", "TGAT", "GATG", "ATGC", "TGCA", "GCAT", "ATGA", "TGAG", "GAGA", "AGAG", "GAGC", "AGCT"),each=4),c("ACGT", "CGTT", "GTTG", "TTGC", "TGCA", "CATG", "ATGT", "TGTC", "GTCG", "TCGC", "CGCA", "GCAT", "ATGA", "TGAT", "GATG", "ATGC", "TGCA", "GCAT", "ATGA", "TGAG", "GAGA", "AGAG", "GAGC", "AGCT"))
result <- t(sapply(pattern, stri_count_fixed,pattern=pattern_elements_4,overlap=TRUE))
colnames(result) <-pattern_elements_4
result
#CATG & GCAT sind häufigste 4-mere


#k=5
pattern_elements_5 <-c("ACGTT", "CGTTG", "GTTGC", "TTGCA", "TGCAT", "CATGT", "ATGTC", "TGTCG", "GTCGC", "TCGCA", "CGCAT", "GCATG", "CATGA", "ATGAT", "TGATG", "GATGC", "ATGCA", "TGCAT", "ATGAG", "TGAGA", "GAGAG", "AGAGC", "GAGCT")
Pattern_5 <-stri_paste(rep(c("ACGTT", "CGTTG", "GTTGC", "TTGCA", "TGCAT", "CATGT", "ATGTC", "TGTCG", "GTCGC", "TCGCA", "CGCAT", "GCATG", "CATGA", "ATGAT", "TGATG", "GATGC", "ATGCA", "TGCAT", "ATGAG", "TGAGA", "GAGAG", "AGAGC", "GAGCT"),each=4),c("ACGTT", "CGTTG", "GTTGC", "TTGCA", "TGCAT", "CATGT", "ATGTC", "TGTCG", "GTCGC", "TCGCA", "CGCAT", "GCATG", "CATGA", "ATGAT", "TGATG", "GATGC", "ATGCA", "TGCAT", "ATGAG", "TGAGA", "GAGAG", "AGAGC", "GAGCT"))
result <- t(sapply(pattern, stri_count_fixed,pattern=pattern_elements_5,overlap=TRUE))
colnames(result) <-pattern_elements_5
result
#GCATG ist häufigstes 5-mer