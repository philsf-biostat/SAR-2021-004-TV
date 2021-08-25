# setup -------------------------------------------------------------------
height <- 4
width <- 4

# save plots --------------------------------------------------------------

# table
inf_baseline %>% as_gt() %>% gt::as_rtf() %>% writeLines(con = "report/SAR-2021-004-TV-v01-T1.rtf")

# ggsave(filename = "figures/plot.png", plot = gg)

ggsave("figures/distr_age.png", plot = gg.age, height = height, width = width)
ggsave("figures/distr_sex.png", plot = gg.sex, height = height, width = width)
ggsave("figures/distr_bmi.png", plot = gg.bmi, height = height, width = width)
ggsave("figures/distr_fu.png", plot = gg.followup, height = height, width = width)

