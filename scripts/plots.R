# setup -------------------------------------------------------------------
library(ggplot2)
# library(survminer)

theme_set(theme_classic())

# plots -------------------------------------------------------------------

## demographic
gg.age <- analytical %>%
  ggplot(aes(age, col = let, fill = let)) +
  # geom_histogram(binwidth = 10, fill = "steelblue") +
  # scale_y_continuous(labels = scales::label_percent()) +
  geom_density(bw = 5, alpha = .4) +
  scale_fill_brewer(palette = "Paired") +
  scale_color_brewer(palette = "Paired") +
  theme(legend.position = "top") +
  labs(x = "Age (years)", y = "")

gg.sex <- analytical %>%
  ggplot(aes(sex, fill = let)) +
  geom_bar(position = "fill") +
  scale_fill_brewer(palette = "Paired") +
  scale_y_continuous(labels = scales::label_percent()) +
  theme(legend.position = "top") +
  labs(x = "", y = "")

gg.bmi <- analytical %>%
  ggplot(aes(bmi, col = let, fill = let)) +
  # geom_histogram(binwidth = 5, fill = "steelblue") +
  # scale_y_continuous(labels = scales::label_percent()) +
  geom_density(bw = 3, alpha = .4) +
  scale_fill_brewer(palette = "Paired") +
  scale_color_brewer(palette = "Paired") +
  theme(legend.position = "top") +
  labs(x = "BMI (kg/m2)", y = "")

## Follow up

gg.followup <- analytical %>%
  ggplot(aes(fu_months, col = let, fill = let)) +
  # geom_histogram(binwidth = 12, fill = "steelblue") +
  # scale_y_continuous(labels = scales::label_percent()) +
  geom_density(bw = 12, alpha = .4) +
  scale_fill_brewer(palette = "Paired") +
  scale_color_brewer(palette = "Paired") +
  theme(legend.position = "top") +
  labs(x = "Follow up after ACLR (months)", y = "")

gg.mtps <- analytical %>%
  ggplot(aes(mtps, col = let, fill = let)) +
  geom_density(bw = 3, alpha = .4) +
  scale_fill_brewer(palette = "Paired") +
  scale_color_brewer(palette = "Paired") +
  theme(legend.position = "top") +
  labs(x = "Medial tibial posterior slope", y = "")
