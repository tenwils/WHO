# Data import from WHO API (GHO OData API: https://www.who.int/data/gho/info/gho-odata-api)
library(httr)
library(jsonlite)
library(dplyr)
rm(list = ls())
source("help_functions.R")

# Define API Enpoint
# url <- "https://ghoapi.azureedge.net/api/WHOSIS_000001"
base_url <- "https://ghoapi.azureedge.net/api"

# list of available dimensions: "Dimension"
dimension_url <- paste0(base_url, "/", "Dimension")
dimension_data <- get.data(dimension_url)

# Indicator
indicator_url <- paste0(base_url, "/", "Indicator")
indicator_data <- get.data(indicator_url)

# Retrieve an endpoint data: Life expectancy at birth, Indicator code = WHOSIS_000001
# endpoint <- "Indicator/WHOSIS_000001?$filter=Dim1 eq 'MLE'"
endpoint <- "WHOSIS_000001" # Life expectancy at birth
url <- paste0(base_url, "/", endpoint)
life_expect_at_birth <- get.data(url)

# Endpoint: Number of people dying from HIV-related causes. 
# Indicator = HIV_0000000006
endpoint <- "HIV_0000000006" 
url <- paste0(base_url, "/", endpoint)
df <- get.data(url)

col_nmes <- dimension_data |> filter(Code %in% toupper(colnames(life_expect_at_birth)))
