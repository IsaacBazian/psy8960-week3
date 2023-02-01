#Script Setting and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#Data Import and Cleaning
raw_df <- read.csv(file = "../data/week3.csv", header = T)
raw_df$timeStart <- as.POSIXct(raw_df$timeStart)
raw_df$timeEnd <- as.POSIXct(raw_df$timeEnd)
clean_df <- subset(raw_df, subset = (unclass(raw_df$timeStart) >= unclass(as.POSIXct("2017-07-01 00:00:00"))) | unclass(raw_df$timeStart) < unclass(as.POSIXct("2017-06-01 00:00:00")))
clean_df <- subset(clean_df, subset = (clean_df$q6 == 1))

#Analysis



