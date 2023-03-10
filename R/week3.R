#Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#Data Import and Cleaning
raw_df <- read.csv(file = "../data/week3.csv", header = T)
raw_df$timeStart <- as.POSIXct(raw_df$timeStart)
raw_df$timeEnd <- as.POSIXct(raw_df$timeEnd)
clean_df <- subset(raw_df, subset = (unclass(raw_df$timeStart) >= unclass(as.POSIXct("2017-07-01 00:00:00"))) | unclass(raw_df$timeStart) < unclass(as.POSIXct("2017-06-01 00:00:00")))
clean_df <- subset(clean_df, subset = (clean_df$q6 == 1))

#Analysis
clean_df$timeSpent <- difftime(clean_df$timeEnd, clean_df$timeStart, units = "secs")
hist(as.numeric(clean_df$timeSpent))
frequency_tables_list <- lapply(clean_df[,5:14], table)
lapply(frequency_tables_list, barplot)
sum((clean_df$q1 >= clean_df$q2) & (clean_df$q2 != clean_df$q3))
for (i in 1:length(frequency_tables_list))
  barplot(frequency_tables_list[[i]])