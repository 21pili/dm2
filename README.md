## RAW DATA

- Real Gross Domestic Product for France (CLVMNACSCAB1GQFR) (Millions of 2010 Euros)

- National Accounts: GDP by Expenditure: Constant Prices: Private Final Consumption Expenditure for France (NAEXKP02FRQ189S) (Euros)

- National Accounts: GDP by Expenditure: Constant Prices: Gross Fixed Capital Formation for France (NAEXKP04FRQ189S) (Euros)

- Average Annual Hours Worked by Persons Engaged for France (AVHWPEFRA065NRUG) (Hours)

- Employment in France (DISCONTINUED) (FRAEMPT) (Millions of People) 

- Population, Total for France (POPTOTFRA647NWDB) (Persons)

## REPOSITORY STRUCTURE

- RAW folder :
Contains all the raw time series
- R_SCRIPTS folder : Contains all the R scripts, to be run in alphabetical order.
- PY_SCRIPTS folder : Contains the code to generate the HP matrix, to be run before the R_scripts
- INTERMEDIATE folder : contains the data that is to be used by other scripts
- OUTPUT folder : contains the output of the scripts, media, data and tables.
- main.R : Runs all the R scripts