#
#### Script to run the CISME analysis on either all .csv files in directory or specify a single one

## Input file name (without .csv extension) within the quotes if specifically wanting to target a single file
user_filename <- "d11tena_Aug03_1335" 

## Only need to run this the FIRST time using this script in R the first time. Place a hash (#) in front of the code to prevent it from running if not needed.
#install.packages(c("rmarkdown", "shiny", "tidyverse", "ggplot2", "cowplot", "openxlsx", "knitr", "kableExtra", "seacarb", "DataCombine"))  


#C:\Users\gould\Desktop\CISME









### Do not edit anything below here
##############################################################################

library("rmarkdown")
date <- Sys.Date() 

if(exists("user_filename") && user_filename != "") {
  
  output_filename <- gsub(".csv", "", user_filename)
  output_dir <- paste(output_filename, "files", date, sep="_")
  dir.create(output_dir)
  
  rmarkdown::render("CISME_DoNotEdit.Rmd",
                    params = "ask",
                    output_file = paste(output_filename, ".html", sep=""),
                    output_dir = output_dir)
  
} else { # this will default to run the script for every .csv file in directory
  
  filenames <- fs::dir_ls(".", glob = "*.csv") # makes a list of all the .csv files in this directory
  
  for(i in filenames) { # will loop through all .csv files and run script for each of them
    
    output_filename <- i
    output_filename <- gsub(".csv", "", output_filename)
    output_dir <- paste(output_filename, "files", date, sep="_")
    dir.create(output_dir)
    
    rmarkdown::render("CISME_DoNotEdit.Rmd",
                      params = "ask",
                      output_file = paste(output_filename, ".html", sep=""),
                      output_dir = output_dir)
    
  }
}





