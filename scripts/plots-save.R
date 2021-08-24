# setup -------------------------------------------------------------------


# save plots --------------------------------------------------------------

# table
inf_baseline %>% as_gt() %>% gt::as_rtf() %>% writeLines(con = "report/SAR-2021-004-TV-v01-T1.rtf")

# ggsave(filename = "figures/plot.png", plot = gg)
