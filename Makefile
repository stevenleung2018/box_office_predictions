# Olympic Medal Hypothesis Test
# author: Steven Leung, Brandon Lam, Sam Quist, Ruben De la Garza
# date: 2021-12-02

all : results/03_EDA.html results/04_htest.Rmd doc/05_final_report.html doc/05_final_report.md results/04_h0_dist.png

# download data
data/raw/olympics.csv : src/01_download_data.py
	python src/01_download_data.py --url="https://github.com/rfordatascience/tidytuesday/raw/master/data/2021/2021-07-27/olympics.csv" --saving_path="data/raw/olympics.csv"

#pre-process data 
data/olympics_cleaned.csv : src/02_cleaning.py data/raw/olympics.csv
	python src/02_cleaning.py --reading_path="data/raw/olympics.csv" --saving_path="data/olympics_cleaned.csv"

# exploratory data analysis
results/03_Figure1_age_hist.png \
results/03_Figure2_numeric_cols_plot.png \
results/03_Figure3_numeric_cols_plot.png \
results/03_Figure4_age_medals_hist.png \
results/03_Figure5_cat_plots.png \
results/03_Figure6_cat_plots_2.png \
results/03_EDA.md \
results/03_EDA.html : src/03_EDA_olympics.py data/olympics_cleaned.csv results/03_EDA.Rmd
	python src/03_EDA_olympics.py --reading_path="data/olympics_cleaned.csv" --saving_path="results";
	Rscript -e "rmarkdown::render('results/03_EDA.Rmd')"

# hypothesis testing
results/04_summary.rds \
results/04_p_value.rds \
results/04_h0_dist.png : src/04_htest.R data/olympics_cleaned.csv
	Rscript src/04_htest.R --data="data/olympics_cleaned.csv" --saving_path="results";
	Rscript -e "rmarkdown::render('results/04_htest.Rmd')"

# generate final report
doc/05_final_report.html \
doc/05_final_report.md : results/03_EDA_final_report.Rmd results/04_htest_final_report.Rmd results/05_final_report.Rmd bibliography.bib results/04_p_value.rds
	Rscript -e "rmarkdown::render('results/05_final_report.Rmd', 'all', output_dir='doc')"
	
clean :
	rm -rf data/raw/olympics.csv
	rm -rf data/raw
	rm -rf data/olympics_cleaned.csv
	rm -rf results/03_Figure1_age_hist.png
	rm -rf results/03_Figure2_numeric_cols_plot.png
	rm -rf results/03_Figure3_numeric_cols_plot.png
	rm -rf results/03_Figure4_age_medals_hist.png
	rm -rf results/03_Figure5_cat_plots.png
	rm -rf results/03_Figure6_cat_plots_2.png
	rm -rf results/03_EDA.md
	rm -rf results/03_EDA.html
	rm -rf results/04_p_value.rds
	rm -rf results/04_summary.rds
	rm -rf results/04_h0_dist.png
	rm -rf doc/05_final_report.md
	rm -rf doc/05_final_report.html
	rm -rf results/04_htest.html
	rm -rf geckodriver.log