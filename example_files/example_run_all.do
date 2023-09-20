/******************************************************************************/
/*                                                                            */
/* example_run_all.do                                                         */
/*                                                                            */
/* This file runs through every step of the analysis.                         */
/*                                                                            */
/* Last edited: 2099_99_99                                                    */
/*                                                                            */
/* Notes                                                                      */
/*                                                                            */
/* (1) prepare_data.do - cleans variables and creates new variables           */
/*     - loads the orig data ../Data/original_data_1823_02_22.dta             */
/*     - saves clean data in ../Data/clean_data.dta                           */
/*                                                                            */
/* (2) run_models.do                                                          */
/*     - depends on ../Data/clean_data.dta                                    */
/*     - model 1: income ~ demographic control variables                      */
/*     - model 2: model 1 + region + educashun                                */
/*     - model 3: model 2 + region * educashun                                */
/*                                                                            */
/* (3) make_tables.do                                                         */
/*     - depends on ../Data/clean_data.dta                                    */
/*     - table 1: descriptive statistics in ../Tables/tab1.csv                */
/*     - table 2: bivariate dist of inc and ed in ../Tabes/tab2.csv           */
/*     - table 3: regression models in ../Tables/tab3.csv                     */
/*                                                                            */
/* (4) make_figures.do                                                        */
/*     - depends on ../Data/clean_data.dta                                    */
/*     - fig 1: map of cool stuff ../Figures/tab1.csv                         */
/*     - fig 2: marginal effects from model 3                                 */
/*                                                                            */
/* (5) get famous!
/*                                                                            */
/******************************************************************************/

/******************************************************************************/
/*1: Set up & load data*/
/******************************************************************************/
pwd
cd /Users/Jason/Projects/Income_Project/Code

capture mkdir "../Figures"
if _rc != 0 {
  di "Figures folder already exists!"
}
capture mkdir "../Tables"
if _rc != 0 {
  di "Tables folder already exists!"
}

log using example_run_all.log, replace


/******************************************************************************/
/*2: Run all the do files                                                     */
/******************************************************************************/
do prep_data.do
do run_models.do   // remember to use paths, e.g., ../Data/clean_data.dta
do make_tables.do  // remember to use paths, e.g., ../Tables/tab1.csv
do make_figures.do // remember to use paths, e.g., ../Figures/fig1.pdf


/******************************************************************************/
/*99: That's all folks!                                                       */
/******************************************************************************/
log close
