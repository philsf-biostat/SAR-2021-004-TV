# setup -------------------------------------------------------------------
# library(tableone)
# library(gt)
library(gtsummary)

# setup gtsummary theme
# theme_gtsummary_language(language = "pt") # traduzir
theme_gtsummary_mean_sd() # mean/sd

# tables ------------------------------------------------------------------

inf_baseline <- dat %>%
  # select variables for table
  select(let, sex, age, bmi, graft_diameter, medial_meniscus, lateral_meniscus, cartilage) %>%
  # draw table
  tbl_summary(
    by = let,
    # fix graft_diameter as continuous (defaults to categorical, too few values)
    type = list(graft_diameter ~ "continuous")
  ) %>%
  # formatting options
  bold_labels() %>%
  # modify_table_styling(columns = "label", align = "c") %>%
  # include study N
  add_overall() %>%
  # comparisons
  add_p(
    # use Fisher test (defaults to chi-square)
    test = all_categorical() ~ "fisher.test",
    # use 3 digits in pvalue
    pvalue_fun = function(x) style_pvalue(x, digits = 3)
  )

