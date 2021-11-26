# author: Brandon Lam
# date: 2021-11-25

"
Perform hypothesis testing on the pre-processed data from the Olympics data.
Saves the outputs as png and rds files.

Usage: src/04-htest.r --data=<data> --saving_path=<saving_path>
  
Options:
--data=<data>    Path (including filename) to testing data
--saving_path=<saving_path> Path to directory where the testing results should be written
" -> doc

library(tidyverse)
library(broom)
library(infer)
library(docopt)

opt <- docopt(doc)

main <- function(data, saving_path) {
    
    #Read the data
    olympics <- read_csv(data)
    
    #Wrangle the data
    olympics_df <- olympics |>
    select(age, medal) |>
    mutate(medal = case_when(medal == "Gold" ~ 1,
                             medal == "Silver" ~ 1,
                             medal == "Bronze" ~ 1,
                             TRUE ~ 0)) |>
    mutate(age = case_when(age <25 ~ "Under",
                           age >=25 ~ "Above"))
    
    #Summarize the data
    olympics_summary <- olympics_df |>
    group_by(age) |>
    summarize(
        medal= sum(medal),
        n = n(),
        prop = sum(medal) / n()
    ) |>
    arrange(desc(age))
    
    #Conduct hypothesis testing
    delta_star <- -diff(olympics_summary$prop)
    olympics_dist <- olympics_df |>
        mutate(medal = as.factor(medal),
        age = as.factor(age))

    set.seed(1234) # For reproducibility.
    null_distribution_olympics <- olympics_dist |>
        specify(formula = medal ~ age, success = "1") |>
        hypothesize(null = "independence") |>
        generate(reps = 100, type = "permute") |>
        calculate(stat = "diff in props", order = c("Under", "Above"))
    
    alpha_threshold <- quantile(null_distribution_olympics$stat, 0.95)
    options(repr.plot.width = 10, repr.plot.height = 10) 
    h0_dist <- null_distribution_olympics |>
        visualize() +
        geom_vline(
            xintercept = alpha_threshold,
            color = "blue", lty = 5, size = 2) +
        geom_vline(xintercept = delta_star, color = "red", size = 1.5)+
        theme(text = element_text(size=12)) +
        theme(
            text = element_text(size = 12),
            plot.title = element_text(face = "bold")
        )
    try({
    dir.create(saving_path)
    })
    ggsave(paste0(saving_path, "/04_h0_dist.png"), h0_dist, width = 5, height = 3)
    
    # Calculate p-value
    p_value <- null_distribution_olympics |>
        get_pvalue(obs_stat = delta_star, direction = "greater")
    saveRDS(p_value, file = paste0(saving_path, "/04_p_value.rds"))
    
    # Conduct prop test
    test <- tidy(prop.test(olympics_summary$medal, olympics_summary$n,
                      correct = FALSE, alternative = c("greater")))
    saveRDS(test, file = paste0(saving_path, "/04_prop_test.rds"))
}

main(opt[["--data"]], opt[["--saving_path"]])