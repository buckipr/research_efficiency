# Project on Cohort Analysis of Fertility Desires

This project looks at fertility desires and tries to assess changes across cohorts vs. changes with age.
Data from the Demographic Health Surveys (DHS) are used for the analyses.

## Producing Results

To produce the results, use Stata to run the file `Code/run_all.do`.  Details are listed [below](#analytic-steps).

## Folder Layout

<pre>
|-- Data
|   |- DHS
|   |  |- zambia_dhs_2007.dta
|   |  |- zambia_dhs_2011.dta
|   |
|   |- Cleaned
|   |  |- clean_zambia07.dta
|   |  |- clean_zambia11.dta
|   |  |- clean_zambia_all.dta
|
|-- Code
|   |- run_all.do
|   |- download_data.do
|   |- fit_models.do
|   |- make_tables.do
|   |- make_figures.do
|
|-- Figures
|
|-- Tables
</pre>

## Analytic Steps

The Stata do-file `Code/run_all.do` performs the following steps...

1. Download the data via the DHS API
   + this is done by sourcing the file `Code/download_data.do`
   + the data are stored in `Data/DHS` folder
   + **TODO**: still need to add code to download latest survey
1. Clean the data and prepare the variables needed for analysis
   + this is done by running the code in `Code/prepare_data.do
1. Run the models (by running `Code/run_models.do`)
1. Create tables (by running `Code/make_tables.do`)
   + *still need to do this!*
   + tables will be CSV files stored as `Tables/tab_X.csv`
1. Create figures (by running `Code/make_figures.do`)
   + *still need to do this!*
   + figures will be PDf files stored as `Figures/fig_X.pdf`


## Project Dependencies

* The analytic results are generated using Stata version 17
* Data from the Zambian Demographic Health Surveys are used for the analysis
which can be obtained from the [DHS site](https://dhsprogram.com/publications/publication-fr361-dhs-final-reports.cfm)
* I used this package: [markstat](https://grodri.github.io/markstat/) version 2.0
