# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)

# Data Import 
import_tbl <- read_delim(file = "data/week4.dat", delim = "-", col_names = c("casenum", "parnum", "stimver", "datadate", "qs"))
import_tbl %>% glimpse()
wide_tbl <- import_tbl %>% separate(col = qs, into = c("q1", "q2", "q3", "q4", "q5"), convert = TRUE) # converted to integers, wasn't sure if this was expected
