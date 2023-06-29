#Survey set-up

library(shiny)
library(shinydashboard)
library(shinybusy)
library(shinythemes)
library(shinyjs)
library(shinyRadioMatrix) # simple radioMatricInput (masked with shinysurveys if both loaded)
#library(shinysurveys) # didn't like the forced structure of the shinysurvyes
library(googledrive)
library(googlesheets4)
library(DT)
library(tidyverse)
library(plotly)
library(dplyr)

## Connect with Google Drive ---------------------------------------------------

# Note: this was a bit of trial and error as the libraries and Google modified from the
#       the last time I did this.
# Reference
# https://www.jdtrat.com/blog/connect-shiny-google/

# << Connect to Google sheets >> ###

# Set authentication token to be stored in a folder called `.secrets`
options(
  gargle_oauth_cache = ".secrets",
  gargle_oauth_email = TRUE
)

# View files
 # gargle::gargle_oauth_cache()
 # list.files(".secrets/")

# Authenticate both google drive and sheets
# googledrive::drive_auth() # not sure if this is needed.
# googlesheets4::gs4_auth() 

# If successful, the previous step stores a token file.
# Check that a file has been created with:
# list.files(".secrets/")

# Check that the non-interactive authentication works by first deauthorizing:
# gs4_deauth()

# Authenticate using token. If no browser opens, the authentication works!
## Must update
gs4_auth(
  cache = ".secrets",
  email = "your.email@gmail.com"
)

#To see files listed on the drive authorized
#drive_find(n_max = 10)

# Create new google sheets (if needed):

## Make dataset and save in GoogleDrive ----------------------------------------
 # only do this a single time
 # make dataset:
# svy_data <- data.frame(TS = character(),
#                        dat.name = character(), 
#                        dat.email = character(),
#                        dat.title = character(),
#                        dat.leader = character(),
#                        dat.organization = character(),
#                        X1.1 = character(),
#                        X1.2 = character(),
#                        X1.3 = character(),
#                        X1.4 = character(),
#                        X1.5 = character(),
#                        X1.6 = character(),
#                        X1.7 = character(),
#                        X1.8 = character(),
#                        X2.1 = character(),
#                        X2.2 = character(),
#                        X2.3 = character(),
#                        X3.1 = character(),
#                        X3.2 = character(),
#                        X3.3 = character(),
#                        X3.4 = character(),
#                        X3.5 = character(),
#                        X4.1 = character(),
#                        X4.2 = character(),
#                        X4.3 = character(),
#                        X5.1 = character(),
#                        X5.2 = character(),
#                        X5.3 = character(),
#                        X5.4 = character(),
#                        X5.5 = character(),
#                        X6.1 = character(),
#                        X6.2 = character(),
#                        X6.3 = character(),
#                        X6.4 = character(),
#                        X7.1 = character(),
#                        X7.2 = character(),
#                        X7.3 = character(),
#                        X7.4 = character(),
#                        X7.5 = character(),
#                        X1.1.a = character(),
#                        X1.2.a = character(),
#                        X1.3.a = character(),
#                        X1.4.a = character(),
#                        X1.5.a = character(),
#                        X1.6.a = character(),
#                        X1.7.a = character(),
#                        X1.8.a = character(),
#                        X2.1.a = character(),
#                        X2.2.a = character(),
#                        X2.3.a = character(),
#                        X3.1.a = character(),
#                        X3.2.a = character(),
#                        X3.3.a = character(),
#                        X3.4.a = character(),
#                        X3.5.a = character(),
#                        X4.1.a = character(),
#                        X4.2.a = character(),
#                        X4.3.a = character(),
#                        X5.1.a = character(),
#                        X5.2.a = character(),
#                        X5.3.a = character(),
#                        X5.4.a = character(),
#                        X5.5.a = character(),
#                        X6.1.a = character(),
#                        X6.2.a = character(),
#                        X6.3.a = character(),
#                        X6.4.a = character(),
#                        X7.1.a = character(),
#                        X7.2.a = character(),
#                        X7.3.a = character(),
#                        X7.4.a = character(),
#                        X7.5.a = character(),
#                        stringsAsFactors = FALSE
# )

## Create sheet!
#EpiMethodsSvy <- gs4_create("EpiMethodsSvy", sheets = svy_data) 
#find id for sheet created
#drive_find("EpiMethodsSvy")

## Link to a specific google sheet folder -------------------------------------
sheetdat <- gs4_get("MUST CHANGE: unique code for googlesheet")
#gs4_browse(dat)

# seedata <- googlesheets4::read_sheet(sheetdat)

#<< end connect with Google Sheets >>#

## Read in CSTE comps for questions 
cste_comps <- read.csv("CSTE_Comps.csv")