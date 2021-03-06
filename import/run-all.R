# install and load all required packages

packages <- c("tidyverse", "countrycode", "RCurl", "haven", "dbplyr")
lapply(packages, function(pack) {
  if ( ! pack %in% installed.packages()[,"Package"]) {
    install.packages(pack, repos = "https://cran.r-project.org")
  }
  require(pack, character.only = TRUE, quietly = TRUE)
})


# run import scripts in all sub-folders

dataset_ignore <- c("", "ess", "kurep")
wd <- getwd()

for (dataset in list.dirs(full.names = FALSE)) {
  if(dataset %in% dataset_ignore | grepl("/", dataset, fixed = TRUE)) next
  print(paste("running --- ", dataset))
  setwd(paste(wd, dataset, sep = "/"))
  source(paste0(dataset, ".R"))
}

setwd(wd)
