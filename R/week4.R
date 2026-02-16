# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)

# Data Import 
import_tbl <- read_delim(file = "data/week4.dat", delim = "-", col_names = c("casenum", "parnum", "stimver", "datadate", "qs"))
import_tbl %>% glimpse()
wide_tbl <- import_tbl %>% separate(col = qs, into = c("q1", "q2", "q3", "q4", "q5")) 
wide_tbl[, 5:9] <- sapply(wide_tbl[, 5:9], as.integer) #Really wish you let us use convert = TRUE in the previous line, but I get it... 
wide_tbl$datadate <- as.POSIXct(wide_tbl$datadate, format = "%b %d %Y, %H:%M:%S") # I spent the time manually coding this string, but I think you mentioned a package that does this more easily in class?
wide_tbl[, 5:9][wide_tbl[, 5:9] == 0] <- NA # I am almost certain there's a dplyr call I'm missing here...

       