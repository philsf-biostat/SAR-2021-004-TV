# setup -------------------------------------------------------------------
library(ggplot2)
# library(survminer)

theme_set(theme_classic())

# plots -------------------------------------------------------------------

## demographic
gg.age <- analytical %>%
  ggplot(aes(age, ..count../sum(..count..))) +
  geom_histogram(binwidth = 10, fill = "steelblue") +
  scale_y_continuous(labels = scales::label_percent()) +
  labs(x = "Age (years)", y = "")

gg.sex <- analytical %>%
  ggplot(aes(sex, fill = let)) +
  geom_bar(position = "fill") +
  scale_fill_brewer(palette = "Paired") +
  scale_y_continuous(labels = scales::label_percent()) +
  theme(legend.position = "top") +
  labs(x = "", y = "")

gg.bmi <-analytical %>%
  ggplot(aes(bmi, ..count../sum(..count..))) +
  geom_histogram(binwidth = 5, fill = "steelblue") +
  scale_y_continuous(labels = scales::label_percent()) +
  labs(x = "BMI (kg/m2)", y = "")

## Follow up

year_sec <- duration(1, "year") / duration(1, "second")

gg.followup <- data.raw %>%
  transmute(let, fu = as.duration(interval(dos_pri, dos)) ) %>%
  ggplot(aes(fu / year_sec, ..count../sum(..count..))) + # seconds in 1 year
  geom_histogram(binwidth = 5, fill = "steelblue") +
  scale_y_continuous(labels = scales::label_percent()) +
  labs(x = "Follow up time (years)", y = "")

