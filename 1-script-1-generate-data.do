/*
Generate data 
*/

clear
set obs 1000
set seed 42

gen age = rnormal(75, 10)
gen bmi = rnormal(25, 3)
gen female = rbinomial(1, 0.5)
gen eversmoke = rbinomial(1, 0.2)

/*
Algorithm to generate the p_i values
*/

// Create a variable called "lin_com":
// a linear combination of the age, bmi, female, and eversmoke values
gen lin_com = 0.4 * age + 0.3 * bmi - 0.04 * female + 0.6 * eversmoke

// Find the mean of lin_com so that we can "center" our lin_com values
summarize lin_com
local beta_0 = r(mean)

// "Center" the lin_com values to create probabilities on the log-odds scale
gen xbeta = lin_com - `beta_0'

// Generate death probabilities (p_i))
gen p_i = exp(xbeta) / (1 + exp(xbeta))

// Generate death values
gen death = rbinomial(1, p_i)

// Drop temporary variables
drop p_i xbeta lin_com

// Clean up data
order death eversmoke age bmi female

// Write data to disk
export delimited using "2-results-1-generated-data.csv", replace