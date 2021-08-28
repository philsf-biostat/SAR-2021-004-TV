# setup -------------------------------------------------------------------

# library(Hmisc) # describe
# library(skimr) # skim
# library(tableone)
# library(gmodels) # CrossTable
library(gtsummary)

# exploratory -------------------------------------------------------------

# overall description
analytical %>%
  skimr::skim()

# follow up
data.raw %>%
  transmute(fu_months = duration(fu_months, "month") ) %>%
  summary()

# surgery dates
data.raw %>%
  transmute(dos_pri, dos, bt = as.duration(interval(start = dos_pri, end = dos))) %>%
  summary()

## interpret cohenD effect sizes

effectsize::interpret_d(.32)
effectsize::interpret_d(.20)
effectsize::interpret_d(.04)
effectsize::interpret_d(.68)

# tables ------------------------------------------------------------------


