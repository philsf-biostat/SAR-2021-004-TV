# setup -------------------------------------------------------------------
library(readxl)
# library(data.table)
library(tidyverse)


# data loading ------------------------------------------------------------
# raw.data <- fread("dataset/file.csv")
# raw.data <- readxl::read_excel("dataset/file.xls")

# raw.data <- data.table(raw.data)
dat.raw <- read_excel("dataset/REVISION_ACL_DEIDENTIFIED_MASTER (4) PROMs_final LETvs No LET.xlsx",
                  sheet = "Clean", skip = 1) %>%
  janitor::clean_names()

# data cleaning -----------------------------------------------------------

dat <- dat.raw %>%
  # select analytic variables
  select(!ends_with(c("_pri", "_inj", "_pri_inj"))) %>%
  select(
    id,
    age,
    sex,
    bmi,
    let,
    stage,
    graft,
    graft_diameter,
    femoral_fixation,
    tibial_fixation,
    medial_meniscus,
    lateral_meniscus,
    cartilage,
    mcl,
    lcl,
    pcl,
    bone,
    implant_hto,
    femoral_tunnel,
    tibial_tunnel,
    )


# data wrangling ----------------------------------------------------------

dat <- dat %>%
  # define surgical failure
  mutate(
    failure = NA
  )
