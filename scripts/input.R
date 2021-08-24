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
  # define factor levels according to data dictionary
  mutate(
    id = factor(id),
    stage = factor(stage, levels = 1:2, labels = c("1"="one-stage", "2"="two-stage")),
    graft = factor(graft, levels = 1:9, labels = c("1"="HT", "2"="QTB", "3"="QTS", "4"="BPTB", "5"="AG", "6"="hybrid", "7"="DB-HT", "8"="DB-AG", "9"="n/a")),
    femoral_fixation = factor(femoral_fixation, levels = c(0:3, 5), labels = c("0"="n/a", "1"="suspensory", "2"="overthetop", "3"="interference screw", "5"="hybrid")),
    tibial_fixation = factor(tibial_fixation, levels = c(0:2, 7), labels = c("0"="n/a", "1"="suspensory", "2"="interference screw", "7"="hybrid")),
    medial_meniscus = factor(medial_meniscus, levels = 0:3, labels = c("0"="none", "1"="partial resection", "2"="repair", "3"="MAT")),
    lateral_meniscus = factor(lateral_meniscus, levels = 0:3, labels = c("0"="none", "1"="partial resection", "2"="repair", "3"="MAT")),
    cartilage = factor(cartilage, levels = 0:5, labels = c("0"="none", "1"="OATS auto", "2"="OATS allo", "3"="Micro-Fx", "4"="MACI", "5"="DeNovo")),
    mcl = factor(mcl, levels = 0:3, labels = c("0"="none", "1"="repair", "2"="reconstruction auto", "3"="reconstruction allo")),
    lcl = factor(lcl, levels = 0:3, labels = c("0"="none", "1"="repair", "2"="reconstruction auto", "3"="reconstruction allo")),
    pcl = factor(pcl, levels = 0:3, labels = c("0"="none", "1"="refixation", "2"="reconstruction auto", "3"="reconstruction allo")),
    bone = factor(bone, levels = 0:5, labels = c("0"="none", "1"="HTO-MOW", "2"="HTO-LCW", "3"="HTO-slope", "4"="DFO-MCW", "5"="HTO-MCW")),
    implant_hto = factor(implant_hto, levels = 0:2, labels = c("0"="none", "1"="TomoFix", "2"="staples")),
    let = factor(let, levels = 0:1, labels = c("no", "yes")),
    femoral_tunnel = factor(femoral_tunnel, levels = 0:1, labels = c("same", "new")),
    tibial_tunnel = factor(tibial_tunnel, levels = 0:1, labels = c("same", "new")),
  ) %>%
  # define surgical failure
  mutate(
    failure = NA
  )
