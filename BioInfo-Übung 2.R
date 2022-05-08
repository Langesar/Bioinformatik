install.packages("text.alignment")
library(text.alignment)
install.packages("Matrix")
library(Matrix)

#Aufgabe 1.2

aligned_sequence <-read.table("/Users/kiwi/alignedSequencesCalmodulin.txt")
aligned_sequence

class(aligned_sequence)
names(aligned_sequence)
str(aligned_sequence)
class(aligned_sequence$V1)
levels(aligned_sequence$V1)

aligned_sequence[0:2, ]
row.names(aligned_sequence)<-c("Sequence_1", "Sequence_2")
aligned_sequence

a_sequence <-as.data.frame(t(aligned_sequence)) #convertiert rows in columns
a_sequence

percent_sequence <-function(a_sequence){
  G <-length(a_sequence$Sequence_1 != "*")
  W <-length(a_sequence$Sequence_2 != "*")
  W/G * 100
}
percent_sequence 
W/G * 100 #zeigt 100 %, sind also zumindest gleich lang
identical(a_sequence$Sequence_1, a_sequence$Sequence_2)
#komme ab hier nicht weiter
