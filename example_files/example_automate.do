/******************************************************************************/
/*                                                                            */
/* example_automate.do                                                        */
/*                                                                            */
/* This file includes a few examples to help with automation and efficiency.  */
/*                                                                            */
/* Last edited: 2023_07_11                                                    */
/*                                                                            */
/* Notes                                                                      */
/*                                                                            */
/* (1) */
/*                                                                            */
/******************************************************************************/

/******************************************************************************/
/*1: Set up & load data*/
/******************************************************************************/
pwd
// cd /Users/jason/projects/cohort_fertility

capture mkdir "Figures"
if _rc != 0 {
  di "Figures folder already exists!"
}

log using example_automate.log, replace

sysuse auto, clear

/******************************************************************************/
/*2: Examples                                                                 */
/******************************************************************************/

/*2.1: Automate file names for figures */
// define a local macro to count the figures
local fig_num 1
di "`fig_num'"

scatter mpg price
// use our local macro as part of the file name
graph save Figures/fig_`fig_num'_mpg_price, replace
// increment fig_num so we get fig_2_y_x
local fig_num = `fig_num' + 1
di "`fig_num'"

scatter mpg weight
graph save Figures/fig_`fig_num'_mpg_weight, replace
local fig_num = `fig_num' + 1
di "`fig_num'"


/*2.2: for loops */
// create dummy variables: 0: x < mean(x), 1: x >= mean(x)

foreach var of varlist _all {

  capture confirm numeric variable `var' // check if mean makes sense
  if !_rc {                              // only run code if variable is numeric
      gen dummy_`var' = 0
	  qui su `var'
	  local mu = `r(mean)'
	  replace dummy_`var' = 1 if `var' >= `mu'
  }
}


/*2.3: Functions */
capture program drop make_dummy
program define make_dummy
  
  local var `1'
  capture confirm numeric variable `var'
  if !_rc {                             
      gen dummy_`var' = 0
	  qui su `var'
	  local mu = `r(mean)'
	  replace dummy_`var' = 1 if `var' >= `mu'
  }
  else {
    di "Variable is not numeric (not going to do anything)"
  }
end

drop dummy*
make_dummy mpg
make_dummy make

/******************************************************************************/
/*99: That's all folks!                                                       */
/******************************************************************************/
log close
