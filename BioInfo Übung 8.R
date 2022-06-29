install.packages("palmerpenguins")
library(palmerpenguins)

#Quelle für nachfolgenden Code (27.06.22, 17:36 Uhr):
#https://github.com/allisonhorst/palmerpenguins/blob/master/data/penguins.R

delayedAssign("penguins", local({
  if (requireNamespace("tibble", quietly = TRUE)) {
    tibble::as_tibble(palmerpenguins:::penguins_df)
  } else {
    palmerpenguins:::penguins_df
  }
}))

delayedAssign("penguins_raw", local({
  if (requireNamespace("tibble", quietly = TRUE)) {
    tibble::as_tibble(palmerpenguins:::penguins_raw_df)
  } else {
    palmerpenguins:::penguins_raw_df
  }
}))

#Code der Quelle Ende

show(penguins)
show(penguins$island)
show(penguins$species)
show(penguins$flipper_length_mm)
show(penguins$year)

show(penguins_raw)
show(penguins_raw$Comments)
show(penguins_raw$`Delta 15 N (o/oo)`)

install.packages("pcr")
library(pcr)

amount <- rep(c(337), each = 0.5)
pcr_assess(penguins_raw$`Delta 15 N (o/oo)`, amount = amount, method = "standard_curve",plot=TRUE)

           