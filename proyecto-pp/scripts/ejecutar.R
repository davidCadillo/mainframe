#!/usr/bin/env Rscript

library("shiny")
library("rsconnect")
options(repos = c(CRAN = "https://cran.rstudio.com/")) 
rsconnect::setAccountInfo(name='mainframe', token='08BC463407F4CC4F44885477234E3AB7', secret='8arv/iuifffprrRGXrkCvd/YesB54DURxyJ+nNOR')
deployApp()


