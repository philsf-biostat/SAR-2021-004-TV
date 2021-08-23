# setup -------------------------------------------------------------------
library(readxl)
# library(data.table)
library(tidyverse)


# data loading ------------------------------------------------------------
# raw.data <- fread("dataset/file.csv")
# raw.data <- readxl::read_excel("dataset/file.xls")

# raw.data <- data.table(raw.data)
dat <- read_excel("dataset/REVISION_ACL_DEIDENTIFIED_MASTER (4) PROMs_final LETvs No LET.xlsx",
                  sheet = "Clean", skip = 1) %>%
  janitor::clean_names()

# data cleaning -----------------------------------------------------------

dat <- dat %>%
  select(!ends_with(c("_pri", "_inj", "_pri_inj")))


# data wrangling ----------------------------------------------------------


