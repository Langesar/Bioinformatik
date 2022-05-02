library(tidyverse)
library(dslabs)
data(murders)

murders %>%
  ggplot(aes(population, total, label=abb, color=region)) +
  geom_label()

##Code to  compute solution to quadratic equation
##of the form of ax^2 + bx +c
##define variables

a <- 3
b <- 2
c <- 1

##now compute the solution

(-b + sqrt(b^2 - 4*a*c))/(2*a)
(-b - sqrt(b^2 - 4*a*c))/(2*a)

##Section 1 Assesment 

##Aufgabe 1
## ax^2 + bx + c
## 2x^2 - x - 4 = 0
 
a <- 2
b <- -1
c <- -4

(-b + sqrt(b^2 - 4*a*c))/(2*a)
(-b - sqrt(b^2 - 4*a*c))/(2*a)

#warum falsch??

#Aufgabe 2
log(1024,4)
#war richtig

#Aufgabe 3a 
nrow(movielens)
#war richtig

#Aufgabe 3b in der Console direkt gelöst

#Aufgabe 3c
class(movielens$title)
#war richtig

#Aufgabe 3d
class(movielens$genres)
#war richtig

#Aufgabe 4
levels(movielens$genres)
nlevels(movielens$genres)
#war richtig

codes <- c(380,124,818)

country <- c("italy","canada","egypt")
codes <- c(italy = 380, canada = 124, egypt = 818)
codes

codes <- c("italy" = 380, "canada" = 124, "egypt" = 818)

names(codes) <- country
codes

seq(1,10)
seq(1,10,2)
1:10

codes[2]
codes[c(1,3)]
codes[1:2]
codes["canada"]
codes[c("italy","egypt")]

x <- c(1,"canada", 3)
x
class(x)

x <- 1:5
y <- as.character(x)
y
as.numeric(y)

x <-c("1","b","3")
as.numeric(x)

sort(murders$total)

x <-c(31, 4, 15, 92, 65)
x
sort(x)

index <-order(x)
x[index]

x <-c(31, 4, 15, 92, 65)
order(x)

murders$state[1:10]
murders$abb[1:10]

index <-order(murders$total)
murders$abb[index]

max(murders$total)
i_max <-which.max(murders$total)
i_max
murders$state[i_max]

min(murders$total)
i_min <-which.min(murders$total)
i_min
murders$state[i_min]

rank(x)

murders$state[which.max(murders$population)]
max(murders$population)

heights <-c(69,62,66,70,81)
heights*2.54
heights - 69

murder_rate <-murders$total/murders$population * 100000
murders$state[order(murder_rate,decreasing = TRUE)]

## Section 2 Assesment
##Aufgabe 1
x <- c(2, 43, 27, 96, 18)
sort(x)
order(x)
rank(x)
#war richtig

#Aufgabe 2
min(x)
i_min <-which.min(x)
i_min
x[i_min]
max(x)
i_max <-which.max(x)
i_max
x[i_max]

which.min(x)
which.max(x)
#war richtig

#Aufgabe 3
name <- c("Mandi", "Amy", "Nicole", "Olivia")
distance <-c(0.8, 3.1, 2.8, 4.0)
time <- c(10, 30, 40, 50)

time/60 #rechnet Minuten in Stunden um
speed_rate <-distance/time / 60
speed[order(speed_rate)]
#wie bekomme ich jetzt den passenden Namen zur Geschwindigkeit ausgegeben?
#teilweise richtig

index <-murder_rate < 0.71
index
murders$state[index]
sum(index) #States that have a smaller murder_rate than 0.71

west <-murders$region =="West"
safety <-murder_rate <= 1

index <- safety & west
murders$state[index]

x <- c(FALSE,TRUE,FALSE,TRUE,TRUE,FALSE)
which(x)
index <-which(murders$state == "Massachusetts")
index
murder_rate[index]

index <-match(c("New York","Florida","Texas"), murders$state)
index
murders$state[index]
murder_rate[index]

x <-c("a", "b", "c", "d", "e")
y <- c("a", "d", "f")
y %in% x

c("Boston", "Dakota", "Washington") %in% murders$state


install.packages("dplyr")
library(dplyr)

murders <-mutate(murders, rate=total/population *100000)
head(murders)
filter(murders,rate <= 0.71)

new_table <-select(murders,state,region,rate)
filter(new_table, rate <=0.71)

murders %>% select(state,region,rate) %>% filter(rate <=0.71)


grades <-data.frame(names = c("John", "Juan", "Jean", "Yao"), 
                     exam_1 = c(95, 80, 90, 85), 
                     exam_2 = c(90, 85, 85, 90))
class(grades$names) #ist hier "character" sollte aber "factor" sein --> warum?

grades <-data.frame(names = c("John", "Juan", "Jean", "Yao"), 
                     exam_1 = c(95, 80, 90, 85), 
                     exam_2 = c(90, 85, 85, 90),
                     stringsAsFactors = FALSE)
class(grades$names)

population_in_millions <-murders$population/10^6
total_gun_murders <-murders$total
plot(population_in_millions,total_gun_murders)
hist(murders$rate)

murders$state[which.max(murders$rate)]

boxplot(rate~region,data = murders) 

# minimum, median, and maximum murder rate for the states in the West region
s <- murders %>% 
  filter(region == "West") %>%
  summarize(minimum = min(rate), 
            median = median(rate), 
            maximum = max(rate))
s
s$minimum
s$median

mean(murders$rate)

us_murders_rate <-murders %>%
  summarize(rate= sum(total)/ sum(population) * 10^5)
us_murders_rate

quantile(x,c(0,0.5,1))
murders %>% 
  filter(region == "West") %>%
  summarize(range = quantile(rate, c(0, 0.5, 1)))

my_quantile <- function(x){
  r <-quantile(x, c(0, 0.5, 1))
  data.frame(minimum = r[1], median = r[2], maximum = r[3]) 
}  

murders %>% 
  filter(region == "West") %>%
  summarize(my_quantile(rate))

us_murders_rate %>% pull(rate)
us_murders_rate <-murders %>%
  summarize(rate = sum(total)/ sum(population) * 10^5) %>%
  pull(rate)
us_murders_rate
class(us_murders_rate)

us_murders_rate <-murders %>%
  summarize(rate = sum(total)/ sum(population) * 10^5) %>%
  .$rate
us_murders_rate
class(us_murders_rate)

murders %>% group_by(region)

murders %>% 
  group_by(region) %>%
  summarize(median = median(rate))

murders %>% arrange(population) %>% head()
murders %>% arrange(rate) %>% head()

murders %>% arrange(desc(rate)) %>% head()
murders %>% arrange(region, rate) %>% head()
murders %>% top_n(10, rate)
murders %>% arrange(desc(rate)) %>% top_n(10)

install.packages("data.table")
library(data.table)

murders <- setDT(murders)
select(murders, state, region)
murders[, c("state", "region")] |> head()
murders[, .(state, region)] |> head()

murders <-mutate(murders, rate = total/ population *100000)
murders[, rate := total /population * 100000]
head(murders)
murders[, ":="(rate = total/ population * 100000, rank = rank(population))]

x<- data.table(a=1)
y <-copy(x)
x[,a := 2]
y

murders[order(region, rate)]

#Section 3 Assesment
#Aufgabe 1-3
data("heights")
options(digits = 3) 

heights
head(heights)
s <-heights
mean(s$height)

tallest <-s$height
ind <-tallest > 68.3
tallest[ind]
sum(ind)
class(ind)

filter(heights, sex == "Female" & height > 68.3)
filter(heights, sex == "Female")
filter(heights, sex == "Male")


proportion_f <-c(s$sex)
mean(proportion_f, is.na)
#teilweise richtig
#später

#Aufgabe 4
min(heights$height)
index <-match(c("50"), heights$height)
index
heights$height[index]
#war richtig

index <-match(c("50"), heights$height, heights$sex)
index
heights$sex[index]
#war richtig

#Aufgabe5
max(heights$height)
x <-as.integer(50:82)
x
#war richtig
sum(x, heights$height != heights$height)
#falsch, wo muss was hin??

#Aufgabe 6
ht_cm <-mutate(heights, cm = height * 2.54)
ht_cm
heights2 <-ht_cm
heights2

mean(heights2$cm)
#war richtig

#Aufgabe 7
filter(heights2, sex == "Female")

average_female <-c(heights2 %>% filter(sex == "Female") %>% select(sex))

#average_female <- heights2[sex == "Female", .(average = mean(heights2))]
summarize(average = mean(heights2), )

#average_female <- heights2 %>%
  filter(sex == "Female") %>%
  summarize(average = mean(heights2))

sapply(average_female,mean)

#warum funktioniert nichts davon??

#Aufgabe 8-10
data(olive)
head(olive)

x <-olive$palmitic
y <-olive$palmitoleic
plot(x, y)

hist(olive$eicosenoic)

boxplot(palmitic~region, data = olive)
#war richtig

if(a!=0){
  print(1/a)
} else{
  print("No reciprocal for 0.")
}

a <- 2
if(a!=0){
  print(1/a)
} else{
  print("No reciprocal for 0.")
}

murder_rate <- murders$total / murders$population*100000
ind <-which.min(murder_rate)
if(murder_rate[ind] < 0.5){
  print(murders$state[ind])
} else{
  print("No state has murder rate that low")
}

if(murder_rate[ind] < 0.25){
  print(murders$state[ind])
} else{
  print("No state has murder rate that low")
}

a <-0
ifelse(a > 0, 1/a, NA)

a <-c(0,1,2,-4,5)
result <-ifelse(a > 0, 1/a, NA)
result

data("na_example")
sum(is.na(na_example))
no_nas <-ifelse(is.na(na_example), 0, na_example)
sum(is.na(no_nas))

z<-c(TRUE, TRUE, FALSE)
any(z)
z<-c(FALSE, FALSE, FALSE)
any(z)
z <-c(TRUE, TRUE, FALSE)
all(z)
z <-c(TRUE, TRUE, TRUE)
all(z)

avg <- function(x){
  s <-sum(x)
  n <-length(x)
  s/n
}
x <-1:100
avg(x)

compute_s_n <-function(n){
  x <-1:n
  sum(x)
}
compute_s_n(3)
compute_s_n(100)

for (i in 1:5) {
  print(i)
  
}
i

m <-25
s_n <-vector(length = m)
for (n in 1:m) {
  s_n[n] <-compute_s_n(n)
  
}
n <-1:m
plot(n, s_n)
lines(n, n*(n+1)/2)
