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
  transmute(dob, dos_pri, dos, bt = as.duration(interval(start = dos_pri, end = dos))) %>%
  summary()

# CV followup
analytical %>%
  group_by(let) %>%
  summarise(CV = sd(fu_months)/ mean(fu_months))

## interpret cohenD effect sizes

effectsize::interpret_d(.33)
effectsize::interpret_d(.13)
effectsize::interpret_d(.05)
effectsize::interpret_d(.78)
effectsize::interpret_d(.03)

# minimum detectable effect size
effectsize::interpret_d(.68)

# tables ------------------------------------------------------------------


