# Generate data with Stata

This repository contains some Stata code (`1-script-1-generate-data.do`) that generates synthetic data and saves the result to a file called `2-results-1-generated-data.csv`.

The data is generated as follows

- `age` ~ $\mathcal{N}(75, 10)$
- `bmi` ~ $\mathcal{N}(25, 3)$
- `female` ~ $\operatorname{Bernoulli}(0.5)$
- `eversmoke` ~ $\operatorname{Bernoulli}(0.2)$
- `death` ~ $\operatorname{Bernoulli}(p_i)$, where $p_i$ is a function of the $i$-th observation of `age`, `bmi`, `female`, and `eversmoke`.

## Analysis

This repository also contains some Stata code (`1-script-2-perform-analysis.do`) that performs some analysis on the generated data and saves the results to a log file called `2-results-2-log-of-analysis.txt`.

## Main Script (Entrypoint for Project)

The entrypoint for the project is `1-script-0-main.do`.  This scripts calls `1-script-1-generate-data.do` and `1-script-2-perform-analysis.do`.
