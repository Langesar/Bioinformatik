#Wahrscheinlichkeit bei einem Münzwurf Kopf zu würfeln: p= 0.5

p <-c(0.5)
n <-("Anzahl der Würfe")
K <-c("Kopf")
Z <-c("Zahl")
I <-c("Kopf", "Zahl")

#Ziehung mit Zurücklegen

sample(K, size = 100, replace = TRUE, prob =0.5)
sample(Z, size = 100, replace = TRUE, prob =0.5)

sample(x<-c(I), size = 100, replace = TRUE, prob =0.5)
#wo liegt der Fehler?!?
