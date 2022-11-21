clear
import delimited "2-results-1-generated-data.csv"

// Store analysis in log file
log using results, replace

// Run logistic regression model
logistic death eversmoke age bmi female

log close

// Translate log file to text file
translate results.smcl "2-results-2-log-of-analysis.txt", replace

// Clean up
erase results.smcl