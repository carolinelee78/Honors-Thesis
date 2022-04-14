# There are three ways to collapse/expand sections: 
# (1) Go to the 'Edit' tab, and select 'Folding' to collapse/expand certain sections or collapse/expand all sections 
# (2) Shortcuts: collapse (option + command + L); expand (option + shift + command + L); collapse all (option + command + O); expand all (option + shift + command + O)
# (3) Click on the small upside down triangles to the left of each section marker to collapse/expand each section 

######################## Setup Section ######################## 

# This section downloads the necessary R packages and functions we need to run the analysis and create visuals. 

# clear global environment

rm(list=ls())

# detach all libraries

detachAllPackages <- function() {
  basic.packages <- c("package:stats", "package:graphics", "package:grDevices", "package:utils", "package:datasets", "package:methods", "package:base")
  package.list <- search()[ifelse(unlist(gregexpr("package:", search()))==1, TRUE, FALSE)]
  package.list <- setdiff(package.list, basic.packages)
  if (length(package.list)>0)  for (package in package.list) detach(package,  character.only=TRUE)
}
detachAllPackages()

# function to load libraries

pkgTest <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[,  "Package"])]
  if (length(new.pkg)) 
    install.packages(new.pkg,  dependencies = TRUE)
  sapply(pkg,  require,  character.only = TRUE)
}

# here is where you load any necessary packages
# ex: stringr
# lapply(c("stringr"),  pkgTest)

lapply(c("dplyr"), pkgTest)
lapply(c("reshape"), pkgTest)
lapply(c("stringr"),pkgTest)
lapply(c("varhandle"),pkgTest)
lapply(c("BEST"),pkgTest)
lapply(c("rstan"),pkgTest)
lapply(c("ggplot2"),pkgTest)
lapply(c("bayesboot"),pkgTest)
library(dplyr)
library(reshape)
library(stringr)
library(dplyr)
library(varhandle)
library(BEST)
library(rstan)
library(ggplot2)
library(bayesboot)

numIter=10000

set.seed(108)

# set working directory 

setwd("/Users/carolinelee/Desktop/Honors/Prolific/Data_PPI_Y")

#####

temp = list.files(pattern="*.csv")
list2env(
  lapply(setNames(temp, make.names(gsub("*.csv$", "", temp))), 
         read.csv), envir = .GlobalEnv)

cleandf = function(x){
  run_id = x[1, "run_id"]
  sample = "Prolific"
  condition = as.character(x[1, "condition"])
  prolific_id = str_sub(as.character(x[2, "response"]), 8, -3)
  assigned_userid = NA
  created_userid = NA
  age = as.numeric(str_sub(as.character(x[3, "response"]), 9, -3))
  gender1 = as.character(x[4, "response"])
  gender2 = str_extract_all(gender1, "(?<=\\[).+?(?=\\])")[[1]]
  gender = gsub("[^A-Za-z0-9 ]"," ", gender2)
  race_ethnicity1 = as.character(x[5, "response"])
  race_ethnicity2 = str_extract_all(race_ethnicity1, "(?<=\\[).+?(?=\\])")[[1]]
  race_ethnicity = gsub("[^A-Za-z0-9 ]"," ", race_ethnicity2)
  SAM_valence_pre = as.numeric(as.character(x[7, "response"]))
  SAM_arousal_pre = as.numeric(as.character(x[8, "response"]))
  SAM_valence_post = as.numeric(as.character(x[10, "response"]))
  SAM_arousal_post = as.numeric(as.character(x[11, "response"]))
  Item = c("ARANG2", "ARDIS3", "ARFEA2", "ARHAP2", "ARSAD3", "ARSUR2", 
            "EBANG1", "EBDIS2", "EBFEA3", "EBHAP3", "EBSAD3", "EBSUR3", 
            "FFANG3", "FFDIS2", "FFFEA2", "FFHAP3", "FFSAD1", "FFSUR2", 
            "FGANG2", "FGDIS2", "FGFEA2", "FGHAP3", "FGSAD1", "FGSUR3", 
            "LDANG3", "LDDIS3", "LDFEA3", "LDHAP2", "LDSAD3", "LDSUR2", 
            "MGANG1", "MGDIS2", "MGFEA3", "MGHAP3", "MGSAD2", "MGSUR1")
  data = data.frame(Item)
  ARANG2_Answer = x[which(grepl("ARANG2", x$stimulus)), "response"]  
  ARANG2_Answer = droplevels.factor(ARANG2_Answer)
  ARANG2_Answer = unfactor(ARANG2_Answer)
  ARANG2_Correct = ARANG2_Answer == 0
  ARANG2_Answer = ifelse(ARANG2_Answer == 0, "ANG",
                          ifelse(ARANG2_Answer == 1, "DIS",
                                 ifelse(ARANG2_Answer == 2, "FEA",
                                        ifelse(ARANG2_Answer == 3, "HAP",
                                               ifelse(ARANG2_Answer == 4, "SAD", "SUR")))))
  ARDIS3_Answer = x[which(grepl("ARDIS3", x$stimulus)), "response"] 
  ARDIS3_Answer = droplevels.factor(ARDIS3_Answer)
  ARDIS3_Answer = unfactor(ARDIS3_Answer)
  ARDIS3_Correct = ARDIS3_Answer == 1
  ARDIS3_Answer = ifelse(ARDIS3_Answer == 0, "ANG",
                          ifelse(ARDIS3_Answer == 1, "DIS",
                                 ifelse(ARDIS3_Answer == 2, "FEA",
                                        ifelse(ARDIS3_Answer == 3, "HAP",
                                               ifelse(ARDIS3_Answer == 4, "SAD", "SUR")))))
  ARFEA2_Answer = x[which(grepl("ARFEA2", x$stimulus)), "response"] 
  ARFEA2_Answer = droplevels.factor(ARFEA2_Answer)
  ARFEA2_Answer = unfactor(ARFEA2_Answer)
  ARFEA2_Correct = ARFEA2_Answer == 2
  ARFEA2_Answer = ifelse(ARFEA2_Answer == 0, "ANG",
                          ifelse(ARFEA2_Answer == 1, "DIS",
                                 ifelse(ARFEA2_Answer == 2, "FEA",
                                        ifelse(ARFEA2_Answer == 3, "HAP",
                                               ifelse(ARFEA2_Answer == 4, "SAD", "SUR")))))
  ARHAP2_Answer = x[which(grepl("ARHAP2", x$stimulus)), "response"] 
  ARHAP2_Answer = droplevels.factor(ARHAP2_Answer)
  ARHAP2_Answer = unfactor(ARHAP2_Answer)
  ARHAP2_Correct = ARHAP2_Answer == 3
  ARHAP2_Answer = ifelse(ARHAP2_Answer == 0, "ANG",
                          ifelse(ARHAP2_Answer == 1, "DIS",
                                 ifelse(ARHAP2_Answer == 2, "FEA",
                                        ifelse(ARHAP2_Answer == 3, "HAP",
                                               ifelse(ARHAP2_Answer == 4, "SAD", "SUR")))))
  ARSAD3_Answer = x[which(grepl("ARSAD3", x$stimulus)), "response"] 
  ARSAD3_Answer = droplevels.factor(ARSAD3_Answer)
  ARSAD3_Answer = unfactor(ARSAD3_Answer)
  ARSAD3_Correct = ARSAD3_Answer == 4
  ARSAD3_Answer = ifelse(ARSAD3_Answer == 0, "ANG",
                          ifelse(ARSAD3_Answer == 1, "DIS",
                                 ifelse(ARSAD3_Answer == 2, "FEA",
                                        ifelse(ARSAD3_Answer == 3, "HAP",
                                               ifelse(ARSAD3_Answer == 4, "SAD", "SUR")))))
  ARSUR2_Answer = x[which(grepl("ARSUR2", x$stimulus)), "response"] 
  ARSUR2_Answer = droplevels.factor(ARSUR2_Answer)
  ARSUR2_Answer = unfactor(ARSUR2_Answer)
  ARSUR2_Correct = ARSUR2_Answer == 5
  ARSUR2_Answer = ifelse(ARSUR2_Answer == 0, "ANG",
                          ifelse(ARSUR2_Answer == 1, "DIS",
                                 ifelse(ARSUR2_Answer == 2, "FEA",
                                        ifelse(ARSUR2_Answer == 3, "HAP",
                                               ifelse(ARSUR2_Answer == 4, "SAD", "SUR")))))
  EBANG1_Answer = x[which(grepl("EBANG1", x$stimulus)), "response"]  
  EBANG1_Answer = droplevels.factor(EBANG1_Answer)
  EBANG1_Answer = unfactor(EBANG1_Answer)
  EBANG1_Correct = EBANG1_Answer == 0
  EBANG1_Answer = ifelse(EBANG1_Answer == 0, "ANG",
                          ifelse(EBANG1_Answer == 1, "DIS",
                                 ifelse(EBANG1_Answer == 2, "FEA",
                                        ifelse(EBANG1_Answer == 3, "HAP",
                                               ifelse(EBANG1_Answer == 4, "SAD", "SUR")))))
  EBDIS2_Answer = x[which(grepl("EBDIS2", x$stimulus)), "response"]
  EBDIS2_Answer = droplevels.factor(EBDIS2_Answer)
  EBDIS2_Answer = unfactor(EBDIS2_Answer)
  EBDIS2_Correct = EBDIS2_Answer == 1
  EBDIS2_Answer = ifelse(EBDIS2_Answer == 0, "ANG",
                          ifelse(EBDIS2_Answer == 1, "DIS",
                                 ifelse(EBDIS2_Answer == 2, "FEA",
                                        ifelse(EBDIS2_Answer == 3, "HAP",
                                               ifelse(EBDIS2_Answer == 4, "SAD", "SUR")))))
  EBFEA3_Answer = x[which(grepl("EBFEA3", x$stimulus)), "response"] 
  EBFEA3_Answer = droplevels.factor(EBFEA3_Answer)
  EBFEA3_Answer = unfactor(EBFEA3_Answer)
  EBFEA3_Correct = EBFEA3_Answer == 2
  EBFEA3_Answer = ifelse(EBFEA3_Answer == 0, "ANG",
                          ifelse(EBFEA3_Answer == 1, "DIS",
                                 ifelse(EBFEA3_Answer == 2, "FEA",
                                        ifelse(EBFEA3_Answer == 3, "HAP",
                                               ifelse(EBFEA3_Answer == 4, "SAD", "SUR")))))
  EBHAP3_Answer = x[which(grepl("EBHAP3", x$stimulus)), "response"] 
  EBHAP3_Answer = droplevels.factor(EBHAP3_Answer)
  EBHAP3_Answer = unfactor(EBHAP3_Answer)
  EBHAP3_Correct = EBHAP3_Answer == 3
  EBHAP3_Answer = ifelse(EBHAP3_Answer == 0, "ANG",
                          ifelse(EBHAP3_Answer == 1, "DIS",
                                 ifelse(EBHAP3_Answer == 2, "FEA",
                                        ifelse(EBHAP3_Answer == 3, "HAP",
                                               ifelse(EBHAP3_Answer == 4, "SAD", "SUR")))))
  EBSAD3_Answer = x[which(grepl("EBSAD3", x$stimulus)), "response"] 
  EBSAD3_Answer = droplevels.factor(EBSAD3_Answer)
  EBSAD3_Answer = unfactor(EBSAD3_Answer)
  EBSAD3_Correct = EBSAD3_Answer == 4
  EBSAD3_Answer = ifelse(EBSAD3_Answer == 0, "ANG",
                          ifelse(EBSAD3_Answer == 1, "DIS",
                                 ifelse(EBSAD3_Answer == 2, "FEA",
                                        ifelse(EBSAD3_Answer == 3, "HAP",
                                               ifelse(EBSAD3_Answer == 4, "SAD", "SUR")))))
  EBSUR3_Answer = x[which(grepl("EBSUR3", x$stimulus)), "response"] 
  EBSUR3_Answer = droplevels.factor(EBSUR3_Answer)
  EBSUR3_Answer = unfactor(EBSUR3_Answer)
  EBSUR3_Correct = EBSUR3_Answer == 5
  EBSUR3_Answer = ifelse(EBSUR3_Answer == 0, "ANG",
                          ifelse(EBSUR3_Answer == 1, "DIS",
                                 ifelse(EBSUR3_Answer == 2, "FEA",
                                        ifelse(EBSUR3_Answer == 3, "HAP",
                                               ifelse(EBSUR3_Answer == 4, "SAD", "SUR")))))
  FFANG3_Answer = x[which(grepl("FFANG3", x$stimulus)), "response"]  
  FFANG3_Answer = droplevels.factor(FFANG3_Answer)
  FFANG3_Answer = unfactor(FFANG3_Answer)
  FFANG3_Correct = FFANG3_Answer == 0
  FFANG3_Answer = ifelse(FFANG3_Answer == 0, "ANG",
                          ifelse(FFANG3_Answer == 1, "DIS",
                                 ifelse(FFANG3_Answer == 2, "FEA",
                                        ifelse(FFANG3_Answer == 3, "HAP",
                                               ifelse(FFANG3_Answer == 4, "SAD", "SUR")))))
  FFDIS2_Answer = x[which(grepl("FFDIS2", x$stimulus)), "response"] 
  FFDIS2_Answer = droplevels.factor(FFDIS2_Answer)
  FFDIS2_Answer = unfactor(FFDIS2_Answer)
  FFDIS2_Correct = FFDIS2_Answer == 1
  FFDIS2_Answer = ifelse(FFDIS2_Answer == 0, "ANG",
                          ifelse(FFDIS2_Answer == 1, "DIS",
                                 ifelse(FFDIS2_Answer == 2, "FEA",
                                        ifelse(FFDIS2_Answer == 3, "HAP",
                                               ifelse(FFDIS2_Answer == 4, "SAD", "SUR")))))
  FFFEA2_Answer = x[which(grepl("FFFEA2", x$stimulus)), "response"] 
  FFFEA2_Answer = droplevels.factor(FFFEA2_Answer)
  FFFEA2_Answer = unfactor(FFFEA2_Answer)
  FFFEA2_Correct = FFFEA2_Answer == 2
  FFFEA2_Answer = ifelse(FFFEA2_Answer == 0, "ANG",
                          ifelse(FFFEA2_Answer == 1, "DIS",
                                 ifelse(FFFEA2_Answer == 2, "FEA",
                                        ifelse(FFFEA2_Answer == 3, "HAP",
                                               ifelse(FFFEA2_Answer == 4, "SAD", "SUR")))))
  FFHAP3_Answer = x[which(grepl("FFHAP3", x$stimulus)), "response"] 
  FFHAP3_Answer = droplevels.factor(FFHAP3_Answer)
  FFHAP3_Answer = unfactor(FFHAP3_Answer)
  FFHAP3_Correct = FFHAP3_Answer == 3
  FFHAP3_Answer = ifelse(FFHAP3_Answer == 0, "ANG",
                          ifelse(FFHAP3_Answer == 1, "DIS",
                                 ifelse(FFHAP3_Answer == 2, "FEA",
                                        ifelse(FFHAP3_Answer == 3, "HAP",
                                               ifelse(FFHAP3_Answer == 4, "SAD", "SUR")))))
  FFSAD1_Answer = x[which(grepl("FFSAD1", x$stimulus)), "response"] 
  FFSAD1_Answer = droplevels.factor(FFSAD1_Answer)
  FFSAD1_Answer = unfactor(FFSAD1_Answer)
  FFSAD1_Correct = FFSAD1_Answer == 4
  FFSAD1_Answer = ifelse(FFSAD1_Answer == 0, "ANG",
                          ifelse(FFSAD1_Answer == 1, "DIS",
                                 ifelse(FFSAD1_Answer == 2, "FEA",
                                        ifelse(FFSAD1_Answer == 3, "HAP",
                                               ifelse(FFSAD1_Answer == 4, "SAD", "SUR")))))
  FFSUR2_Answer = x[which(grepl("FFSUR2", x$stimulus)), "response"] 
  FFSUR2_Answer = droplevels.factor(FFSUR2_Answer)
  FFSUR2_Answer = unfactor(FFSUR2_Answer)
  FFSUR2_Correct = FFSUR2_Answer == 5
  FFSUR2_Answer = ifelse(FFSUR2_Answer == 0, "ANG",
                          ifelse(FFSUR2_Answer == 1, "DIS",
                                 ifelse(FFSUR2_Answer == 2, "FEA",
                                        ifelse(FFSUR2_Answer == 3, "HAP",
                                               ifelse(FFSUR2_Answer == 4, "SAD", "SUR")))))
  FGANG2_Answer = x[which(grepl("FGANG2", x$stimulus)), "response"]  
  FGANG2_Answer = droplevels.factor(FGANG2_Answer)
  FGANG2_Answer = unfactor(FGANG2_Answer)
  FGANG2_Correct = FGANG2_Answer == 0
  FGANG2_Answer = ifelse(FGANG2_Answer == 0, "ANG",
                          ifelse(FGANG2_Answer == 1, "DIS",
                                 ifelse(FGANG2_Answer == 2, "FEA",
                                        ifelse(FGANG2_Answer == 3, "HAP",
                                               ifelse(FGANG2_Answer == 4, "SAD", "SUR")))))
  FGDIS2_Answer = x[which(grepl("FGDIS2", x$stimulus)), "response"] 
  FGDIS2_Answer = droplevels.factor(FGDIS2_Answer)
  FGDIS2_Answer = unfactor(FGDIS2_Answer)
  FGDIS2_Correct = FGDIS2_Answer == 1
  FGDIS2_Answer = ifelse(FGDIS2_Answer == 0, "ANG",
                          ifelse(FGDIS2_Answer == 1, "DIS",
                                 ifelse(FGDIS2_Answer == 2, "FEA",
                                        ifelse(FGDIS2_Answer == 3, "HAP",
                                               ifelse(FGDIS2_Answer == 4, "SAD", "SUR")))))
  FGFEA2_Answer = x[which(grepl("FGFEA2", x$stimulus)), "response"] 
  FGFEA2_Answer = droplevels.factor(FGFEA2_Answer)
  FGFEA2_Answer = unfactor(FGFEA2_Answer)
  FGFEA2_Correct = FGFEA2_Answer == 2
  FGFEA2_Answer = ifelse(FGFEA2_Answer == 0, "ANG",
                          ifelse(FGFEA2_Answer == 1, "DIS",
                                 ifelse(FGFEA2_Answer == 2, "FEA",
                                        ifelse(FGFEA2_Answer == 3, "HAP",
                                               ifelse(FGFEA2_Answer == 4, "SAD", "SUR")))))
  FGHAP3_Answer = x[which(grepl("FGHAP3", x$stimulus)), "response"] 
  FGHAP3_Answer = droplevels.factor(FGHAP3_Answer)
  FGHAP3_Answer = unfactor(FGHAP3_Answer)
  FGHAP3_Correct = FFHAP3_Answer == 3
  FGHAP3_Answer = ifelse(FGHAP3_Answer == 0, "ANG",
                          ifelse(FGHAP3_Answer == 1, "DIS",
                                 ifelse(FGHAP3_Answer == 2, "FEA",
                                        ifelse(FGHAP3_Answer == 3, "HAP",
                                               ifelse(FGHAP3_Answer == 4, "SAD", "SUR")))))
  FGSAD1_Answer = x[which(grepl("FGSAD1", x$stimulus)), "response"] 
  FGSAD1_Answer = droplevels.factor(FGSAD1_Answer)
  FGSAD1_Answer = unfactor(FGSAD1_Answer)
  FGSAD1_Correct = FGSAD1_Answer == 4
  FGSAD1_Answer = ifelse(FGSAD1_Answer == 0, "ANG",
                          ifelse(FGSAD1_Answer == 1, "DIS",
                                 ifelse(FGSAD1_Answer == 2, "FEA",
                                        ifelse(FGSAD1_Answer == 3, "HAP",
                                               ifelse(FGSAD1_Answer == 4, "SAD", "SUR")))))
  FGSUR3_Answer = x[which(grepl("FGSUR3", x$stimulus)), "response"] 
  FGSUR3_Answer = droplevels.factor(FGSUR3_Answer)
  FGSUR3_Answer = unfactor(FGSUR3_Answer)
  FGSUR3_Correct = FGSUR3_Answer == 5
  FGSUR3_Answer = ifelse(FGSUR3_Answer == 0, "ANG",
                          ifelse(FGSUR3_Answer == 1, "DIS",
                                 ifelse(FGSUR3_Answer == 2, "FEA",
                                        ifelse(FGSUR3_Answer == 3, "HAP",
                                               ifelse(FGSUR3_Answer == 4, "SAD", "SUR")))))
  LDANG3_Answer = x[which(grepl("LDANG3", x$stimulus)), "response"]  
  LDANG3_Answer = droplevels.factor(LDANG3_Answer)
  LDANG3_Answer = unfactor(LDANG3_Answer)
  LDANG3_Correct = LDANG3_Answer == 0
  LDANG3_Answer = ifelse(LDANG3_Answer == 0, "ANG", 
                          ifelse(LDANG3_Answer == 1, "DIS",
                                 ifelse(LDANG3_Answer == 2, "FEA",
                                        ifelse(LDANG3_Answer == 3, "HAP",
                                               ifelse(LDANG3_Answer == 4, "SAD", "SUR")))))
  LDDIS3_Answer = x[which(grepl("LDDIS3", x$stimulus)), "response"] 
  LDDIS3_Answer = droplevels.factor(LDDIS3_Answer)
  LDDIS3_Answer = unfactor(LDDIS3_Answer)
  LDDIS3_Correct = LDDIS3_Answer == 1
  LDDIS3_Answer = ifelse(LDDIS3_Answer == 0, "ANG",
                          ifelse(LDDIS3_Answer == 1, "DIS",
                                 ifelse(LDDIS3_Answer == 2, "FEA",
                                        ifelse(LDDIS3_Answer == 3, "HAP",
                                               ifelse(LDDIS3_Answer == 4, "SAD", "SUR")))))
  LDFEA3_Answer = x[which(grepl("LDFEA3", x$stimulus)), "response"] 
  LDFEA3_Answer = droplevels.factor(LDFEA3_Answer)
  LDFEA3_Answer = unfactor(LDFEA3_Answer)
  LDFEA3_Correct = LDFEA3_Answer == 2
  LDFEA3_Answer = ifelse(LDFEA3_Answer == 0, "ANG",
                          ifelse(LDFEA3_Answer == 1, "DIS",
                                 ifelse(LDFEA3_Answer == 2, "FEA",
                                        ifelse(LDFEA3_Answer == 3, "HAP",
                                               ifelse(LDFEA3_Answer == 4, "SAD", "SUR")))))
  LDHAP2_Answer = x[which(grepl("LDHAP2", x$stimulus)), "response"] 
  LDHAP2_Answer = droplevels.factor(LDHAP2_Answer)
  LDHAP2_Answer = unfactor(LDHAP2_Answer)
  LDHAP2_Correct = LDHAP2_Answer == 3
  LDHAP2_Answer = ifelse(LDHAP2_Answer == 0, "ANG",
                          ifelse(LDHAP2_Answer == 1, "DIS",
                                 ifelse(LDHAP2_Answer == 2, "FEA",
                                        ifelse(LDHAP2_Answer == 3, "HAP",
                                               ifelse(LDHAP2_Answer == 4, "SAD", "SUR")))))
  LDSAD3_Answer = x[which(grepl("LDSAD", x$stimulus)), "response"] 
  LDSAD3_Answer = droplevels.factor(LDSAD3_Answer)
  LDSAD3_Answer = unfactor(LDSAD3_Answer)
  LDSAD3_Correct = LDSAD3_Answer == 4
  LDSAD3_Answer = ifelse(LDSAD3_Answer == 0, "ANG",
                          ifelse(LDSAD3_Answer == 1, "DIS",
                                 ifelse(LDSAD3_Answer == 2, "FEA",
                                        ifelse(LDSAD3_Answer == 3, "HAP",
                                               ifelse(LDSAD3_Answer == 4, "SAD", "SUR")))))
  LDSUR2_Answer = x[which(grepl("LDSUR2", x$stimulus)), "response"] 
  LDSUR2_Answer = droplevels.factor(LDSUR2_Answer)
  LDSUR2_Answer = unfactor(LDSUR2_Answer)
  LDSUR2_Correct = LDSUR2_Answer == 5
  LDSUR2_Answer = ifelse(LDSUR2_Answer == 0, "ANG",
                          ifelse(LDSUR2_Answer == 1, "DIS",
                                 ifelse(LDSUR2_Answer == 2, "FEA",
                                        ifelse(LDSUR2_Answer == 3, "HAP",
                                               ifelse(LDSUR2_Answer == 4, "SAD", "SUR")))))
  MGANG1_Answer = x[which(grepl("MGANG1", x$stimulus)), "response"] 
  MGANG1_Answer = droplevels.factor(MGANG1_Answer)
  MGANG1_Answer = unfactor(MGANG1_Answer)
  MGANG1_Correct = MGANG1_Answer == 0
  MGANG1_Answer = ifelse(MGANG1_Answer == 0, "ANG",
                          ifelse(MGANG1_Answer == 1, "DIS",
                                 ifelse(MGANG1_Answer == 2, "FEA",
                                        ifelse(MGANG1_Answer == 3, "HAP",
                                               ifelse(MGANG1_Answer == 4, "SAD", "SUR")))))
  MGDIS2_Answer = x[which(grepl("MGDIS2", x$stimulus)), "response"] 
  MGDIS2_Answer = droplevels.factor(MGDIS2_Answer)
  MGDIS2_Answer = unfactor(MGDIS2_Answer)
  MGDIS2_Correct = MGDIS2_Answer == 1
  MGDIS2_Answer = ifelse(MGDIS2_Answer == 0, "ANG",
                          ifelse(MGDIS2_Answer == 1, "DIS",
                                 ifelse(MGDIS2_Answer == 2, "FEA",
                                        ifelse(MGDIS2_Answer == 3, "HAP",
                                               ifelse(MGDIS2_Answer == 4, "SAD", "SUR")))))
  MGFEA3_Answer = x[which(grepl("MGFEA3", x$stimulus)), "response"] 
  MGFEA3_Answer = droplevels.factor(MGFEA3_Answer)
  MGFEA3_Answer = unfactor(MGFEA3_Answer)
  MGFEA3_Correct = MGFEA3_Answer == 2
  MGFEA3_Answer = ifelse(MGFEA3_Answer == 0, "ANG",
                          ifelse(MGFEA3_Answer == 1, "DIS",
                                 ifelse(MGFEA3_Answer == 2, "FEA",
                                        ifelse(MGFEA3_Answer == 3, "HAP",
                                               ifelse(MGFEA3_Answer == 4, "SAD", "SUR")))))
  MGHAP3_Answer = x[which(grepl("MGHAP3", x$stimulus)), "response"] 
  MGHAP3_Answer = droplevels.factor(MGHAP3_Answer)
  MGHAP3_Answer = unfactor(MGHAP3_Answer)
  MGHAP3_Correct = MGHAP3_Answer == 3
  MGHAP3_Answer = ifelse(MGHAP3_Answer == 0, "ANG",
                          ifelse(MGHAP3_Answer == 1, "DIS",
                                 ifelse(MGHAP3_Answer == 2, "FEA",
                                        ifelse(MGHAP3_Answer == 3, "HAP",
                                               ifelse(MGHAP3_Answer == 4, "SAD", "SUR")))))
  MGSAD2_Answer = x[which(grepl("MGSAD2", x$stimulus)), "response"] 
  MGSAD2_Answer = droplevels.factor(MGSAD2_Answer)
  MGSAD2_Answer = unfactor(MGSAD2_Answer)
  MGSAD2_Correct = MGSAD2_Answer == 4
  MGSAD2_Answer = ifelse(MGSAD2_Answer == 0, "ANG",
                          ifelse(MGSAD2_Answer == 1, "DIS",
                                 ifelse(MGSAD2_Answer == 2, "FEA",
                                        ifelse(MGSAD2_Answer == 3, "HAP",
                                               ifelse(MGSAD2_Answer == 4, "SAD", "SUR")))))
  MGSUR1_Answer = x[which(grepl("MGSUR1", x$stimulus)), "response"] 
  MGSUR1_Answer = droplevels.factor(MGSUR1_Answer)
  MGSUR1_Answer = unfactor(MGSUR1_Answer)
  MGSUR1_Correct = MGSUR1_Answer == 5
  MGSUR1_Answer = ifelse(MGSUR1_Answer == 0, "ANG",
                          ifelse(MGSUR1_Answer == 1, "DIS",
                                 ifelse(MGSUR1_Answer == 2, "FEA",
                                        ifelse(MGSUR1_Answer == 3, "HAP",
                                               ifelse(MGSUR1_Answer == 4, "SAD", "SUR")))))
  an_vec = c(ARANG2_Correct, EBANG1_Correct, FFANG3_Correct, FGANG2_Correct, LDANG3_Correct, MGANG1_Correct)
  
  FERT_Anger = sum(an_vec) / 6
  
  di_vec = c(ARDIS3_Correct, EBDIS2_Correct, FFDIS2_Correct, FGDIS2_Correct, LDDIS3_Correct, MGDIS2_Correct)
  
  FERT_Disgust = sum(di_vec) / 6
  
  fe_vec = c(ARFEA2_Correct, EBFEA3_Correct, FFFEA2_Correct, FGFEA2_Correct, LDFEA3_Correct, MGFEA3_Correct)
  
  FERT_Fear = sum(fe_vec) / 6
  
  ha_vec = c(ARHAP2_Correct, EBHAP3_Correct, FFHAP3_Correct, FGHAP3_Correct, LDHAP2_Correct, MGHAP3_Correct)
  
  FERT_Happiness = sum(ha_vec) / 6
  
  sa_vec = c(ARSAD3_Correct, EBSAD3_Correct, FFSAD1_Correct, FGSAD1_Correct, LDSAD3_Correct, LDSUR2_Correct)
  
  FERT_Sadness = sum(sa_vec) / 6
  
  su_vec = c(ARSUR2_Correct, EBSUR3_Correct, FFSUR2_Correct, FGSUR3_Correct, LDSUR2_Correct, MGSUR1_Correct)
  
  FERT_Surprise = sum(su_vec) / 6
  
  total_vec = c(an_vec, di_vec, fe_vec, ha_vec, sa_vec, su_vec)
  
  FERT_Score_2 = sum(total_vec)/36
  
  data$Answer = c(ARANG2_Answer, ARDIS3_Answer, ARFEA2_Answer, ARHAP2_Answer, ARSAD3_Answer, ARSUR2_Answer, 
                   EBANG1_Answer, EBDIS2_Answer, EBFEA3_Answer, EBHAP3_Answer, EBSAD3_Answer, EBSUR3_Answer, 
                   FFANG3_Answer, FFDIS2_Answer, FFFEA2_Answer, FFHAP3_Answer, FFSAD1_Answer, FFSUR2_Answer, 
                   FGANG2_Answer, FGDIS2_Answer, FGFEA2_Answer, FGHAP3_Answer, FGSAD1_Answer, FGSUR3_Answer, 
                   LDANG3_Answer, LDDIS3_Answer, LDFEA3_Answer, LDHAP2_Answer, LDSAD3_Answer, LDSUR2_Answer, 
                   MGANG1_Answer, MGDIS2_Answer, MGFEA3_Answer, MGHAP3_Answer, MGSAD2_Answer, MGSUR1_Answer)
  data$Correct = c(ARANG2_Correct, ARDIS3_Correct, ARFEA2_Correct, ARHAP2_Correct, ARSAD3_Correct, ARSUR2_Correct, 
                    EBANG1_Correct, EBDIS2_Correct, EBFEA3_Correct, EBHAP3_Correct, EBSAD3_Correct, EBSUR3_Correct, 
                    FFANG3_Correct, FFDIS2_Correct, FFFEA2_Correct, FFHAP3_Correct, FFSAD1_Correct, FFSUR2_Correct, 
                    FGANG2_Correct, FGDIS2_Correct, FGFEA2_Correct, FGHAP3_Correct, FGSAD1_Correct, FGSUR3_Correct, 
                    LDANG3_Correct, LDDIS3_Correct, LDFEA3_Correct, LDHAP2_Correct, LDSAD3_Correct, LDSUR2_Correct, 
                    MGANG1_Correct, MGDIS2_Correct, MGFEA3_Correct, MGHAP3_Correct, MGSAD2_Correct, MGSUR1_Correct)
  data$Alpha = c(0.4651, 0.3005, 0.7169, 0.8780, 0.5474, 0.6123, 0.6064,
                  0.2136, 0.7794, 1.4335, 0.5459, 0.4452, 1.6947, 0.4810, 0.5903,
                  0.8826, 0.5491, 0.8933, 0.8345, 0.8804, 0.2824, 0.6313, 0.6104,
                  0.4571, 0.7794, 0.5261, 0.8495, 0.6296, 0.4887, 0.6038, 1.4067,
                  0.5214, 1.0957, 0.7295, 0.6006, 0.3117)
  data$Beta = c(-3.3289, -3.9263, -3.8320, -4.1036, -1.4685, -3.7313, -1.1982,
                 0.3763, 0.3876, -4.7480, -4.7722, -6.2939, -3.3452, -6.4326, 0.4887,
                 -5.8279, -1.7127, -3.8558, -2.8657, -4.3872, 0.1057, -6.1967, -3.4558,
                 -3.0521, -2.8014, -4.6856, -0.3597, -3.4142, 0.2852, -3.6963, -0.9332,
                 -3.5789, -1.4791, -5.4119, 0.1957, -6.5352)
  rstan_options(auto_write = TRUE)
  options(mc.cores = parallel::detectCores())
  stan_data = list(Correct=data$Correct, Alpha=data$Alpha, Beta=data$Beta)
  model = "data {
    vector[36] Alpha;
    vector[36] Beta;
    int<lower=0, upper=1> Correct[36];
    }
    parameters {
    vector[1] theta;         
    }
    
    model {
    vector[36] eta;
    theta ~ normal(0,1);
    
    for (n in 1:36)
    eta[n] = Alpha[n] * (theta[1] - Beta[n]);
    
    Correct ~ bernoulli_logit(eta);
    }
    "
  twopl.fit = stan(model_code=model, data = stan_data, iter = numIter, chains = 4)
  stanfit = extract(twopl.fit, pars=c("theta"))
  plotPost(stanfit$theta)
  print(paste("Estimated ability: ", round(mean(stanfit$theta), 2)))
  FERT_Score = round(mean(stanfit$theta), 2)
  FERT_CorrectEstimate = as.numeric(as.character(x[49, "response"])) / 100
  attention_check = as.numeric(as.character(x[53, "response"]))
  attention_check = ifelse(attention_check == 2, TRUE, FALSE)
  R1_Strategy = ifelse(as.character(x[60, "response"]) == "g", "Cooperate", "Defect")
  R1_Outcome = as.character(x[64, "stimulus"])
  R1_Outcome = toupper(str_sub(R1_Outcome, 62, -33))
  R1_AffectiveFeedback = as.numeric(as.character(x[64, "response"]))
  if (R1_AffectiveFeedback == 0) {
    R1_AffectiveFeedback = "Neutral"
  } else if (R1_AffectiveFeedback == 1) {
    R1_AffectiveFeedback = "Happiness"
  } else if (R1_AffectiveFeedback == 2) {
    R1_AffectiveFeedback = "Anger"
  } else {
    R1_AffectiveFeedback = "Regret"
  }
  R1_AffectiveFeedback = paste(c(R1_Outcome, "_", R1_AffectiveFeedback), collapse="")
  R1_CoopExpect = as.numeric(as.character(x[66, "response"])) / 100
  R2_Strategy = ifelse(as.character(x[67, "response"]) == "g", "Cooperate", "Defect")
  R2_Outcome = as.character(x[70, "stimulus"])
  R2_Outcome = toupper(str_sub(R2_Outcome, 62, -33))
  R2_AffectiveFeedback = as.numeric(as.character(x[70, "response"]))
  if (R2_AffectiveFeedback == 0) {
    R2_AffectiveFeedback = "Neutral"
  } else if (R2_AffectiveFeedback == 1) {
    R2_AffectiveFeedback = "Happiness"
  } else if (R2_AffectiveFeedback == 2) {
    R2_AffectiveFeedback = "Anger"
  } else {
    R2_AffectiveFeedback = "Regret"
  }
  R2_AffectiveFeedback = paste(c(R2_Outcome, "_", R2_AffectiveFeedback), collapse="")
  R2_CoopExpect = as.numeric(as.character(x[72, "response"])) / 100
  R3_Strategy = ifelse(as.character(x[73, "response"]) == "g", "Cooperate", "Defect")
  R3_Outcome = as.character(x[76, "stimulus"])
  R3_Outcome = toupper(str_sub(R3_Outcome, 62, -33))
  R3_AffectiveFeedback = as.numeric(as.character(x[76, "response"]))
  if (R3_AffectiveFeedback == 0) {
    R3_AffectiveFeedback = "Neutral"
  } else if (R3_AffectiveFeedback == 1) {
    R3_AffectiveFeedback = "Happiness"
  } else if (R3_AffectiveFeedback == 2) {
    R3_AffectiveFeedback = "Anger"
  } else {
    R3_AffectiveFeedback = "Regret"
  }
  R3_AffectiveFeedback = paste(c(R3_Outcome, "_", R3_AffectiveFeedback), collapse="")
  R3_CoopExpect = as.numeric(as.character(x[78, "response"])) / 100
  R4_Strategy = ifelse(as.character(x[79, "response"]) == "g", "Cooperate", "Defect")
  R4_Outcome = as.character(x[82, "stimulus"])
  R4_Outcome = toupper(str_sub(R4_Outcome, 62, -33))
  R4_AffectiveFeedback = as.numeric(as.character(x[82, "response"]))
  if (R4_AffectiveFeedback == 0) {
    R4_AffectiveFeedback = "Neutral"
  } else if (R4_AffectiveFeedback == 1) {
    R4_AffectiveFeedback = "Happiness"
  } else if (R4_AffectiveFeedback == 2) {
    R4_AffectiveFeedback = "Anger"
  } else {
    R4_AffectiveFeedback = "Regret"
  }
  R4_AffectiveFeedback = paste(c(R4_Outcome, "_", R4_AffectiveFeedback), collapse="")
  R4_CoopExpect = as.numeric(as.character(x[84, "response"])) / 100
  R5_Strategy = ifelse(as.character(x[85, "response"]) == "g", "Cooperate", "Defect")
  R5_Outcome = as.character(x[88, "stimulus"])
  R5_Outcome = toupper(str_sub(R5_Outcome, 62, -33))
  R5_AffectiveFeedback = as.numeric(as.character(x[88, "response"]))
  if (R5_AffectiveFeedback == 0) {
    R5_AffectiveFeedback = "Neutral"
  } else if (R5_AffectiveFeedback == 1) {
    R5_AffectiveFeedback = "Happiness"
  } else if (R5_AffectiveFeedback == 2) {
    R5_AffectiveFeedback = "Anger"
  } else {
    R5_AffectiveFeedback = "Regret"
  }
  R5_AffectiveFeedback = paste(c(R5_Outcome, "_", R5_AffectiveFeedback), collapse="")
  R5_CoopExpect = as.numeric(as.character(x[90, "response"])) / 100
  R6_Strategy = ifelse(as.character(x[91, "response"]) == "g", "Cooperate", "Defect")
  R6_Outcome = as.character(x[94, "stimulus"])
  R6_Outcome = toupper(str_sub(R6_Outcome, 62, -33))
  R6_AffectiveFeedback = as.numeric(as.character(x[94, "response"]))
  if (R6_AffectiveFeedback == 0) {
    R6_AffectiveFeedback = "Neutral"
  } else if (R6_AffectiveFeedback == 1) {
    R6_AffectiveFeedback = "Happiness"
  } else if (R6_AffectiveFeedback == 2) {
    R6_AffectiveFeedback = "Anger"
  } else {
    R6_AffectiveFeedback = "Regret"
  }
  R6_AffectiveFeedback = paste(c(R6_Outcome, "_", R6_AffectiveFeedback), collapse="")
  R6_CoopExpect = as.numeric(as.character(x[96, "response"])) / 100
  R7_Strategy = ifelse(as.character(x[97, "response"]) == "g", "Cooperate", "Defect")
  R7_Outcome = as.character(x[100, "stimulus"])
  R7_Outcome = toupper(str_sub(R7_Outcome, 62, -33))
  R7_AffectiveFeedback = as.numeric(as.character(x[100, "response"]))
  if (R7_AffectiveFeedback == 0) {
    R7_AffectiveFeedback = "Neutral"
  } else if (R7_AffectiveFeedback == 1) {
    R7_AffectiveFeedback = "Happiness"
  } else if (R7_AffectiveFeedback == 2) {
    R7_AffectiveFeedback = "Anger"
  } else {
    R7_AffectiveFeedback = "Regret"
  }
  R7_AffectiveFeedback = paste(c(R7_Outcome, "_", R7_AffectiveFeedback), collapse="")
  R7_CoopExpect = as.numeric(as.character(x[102, "response"])) / 100
  R8_Strategy = ifelse(as.character(x[103, "response"]) == "g", "Cooperate", "Defect")
  R8_Outcome = as.character(x[106, "stimulus"])
  R8_Outcome = toupper(str_sub(R8_Outcome, 62, -33))
  R8_AffectiveFeedback = as.numeric(as.character(x[106, "response"]))
  if (R8_AffectiveFeedback == 0) {
    R8_AffectiveFeedback = "Neutral"
  } else if (R8_AffectiveFeedback == 1) {
    R8_AffectiveFeedback = "Happiness"
  } else if (R8_AffectiveFeedback == 2) {
    R8_AffectiveFeedback = "Anger"
  } else {
    R8_AffectiveFeedback = "Regret"
  }
  R8_AffectiveFeedback = paste(c(R8_Outcome, "_", R8_AffectiveFeedback), collapse="")
  R8_CoopExpect = as.numeric(as.character(x[108, "response"])) / 100
  R9_Strategy = ifelse(as.character(x[109, "response"]) == "g", "Cooperate", "Defect")
  R9_Outcome = as.character(x[112, "stimulus"])
  R9_Outcome = toupper(str_sub(R9_Outcome, 62, -33))
  R9_AffectiveFeedback = as.numeric(as.character(x[112, "response"]))
  if (R9_AffectiveFeedback == 0) {
    R9_AffectiveFeedback = "Neutral"
  } else if (R9_AffectiveFeedback == 1) {
    R9_AffectiveFeedback = "Happiness"
  } else if (R9_AffectiveFeedback == 2) {
    R9_AffectiveFeedback = "Anger"
  } else {
    R9_AffectiveFeedback = "Regret"
  }
  R9_AffectiveFeedback = paste(c(R9_Outcome, "_", R9_AffectiveFeedback), collapse="")
  R9_CoopExpect = as.numeric(as.character(x[114, "response"])) / 100
  R10_Strategy = ifelse(as.character(x[115, "response"]) == "g", "Cooperate", "Defect")
  R10_Outcome = as.character(x[118, "stimulus"])
  R10_Outcome = toupper(str_sub(R10_Outcome, 62, -33))
  R10_AffectiveFeedback = as.numeric(as.character(x[118, "response"]))
  if (R10_AffectiveFeedback == 0) {
    R10_AffectiveFeedback = "Neutral"
  } else if (R10_AffectiveFeedback == 1) {
    R10_AffectiveFeedback = "Happiness"
  } else if (R10_AffectiveFeedback == 2) {
    R10_AffectiveFeedback = "Anger"
  } else {
    R10_AffectiveFeedback = "Regret"
  }
  R10_AffectiveFeedback = paste(c(R10_Outcome, "_", R10_AffectiveFeedback), collapse="")
  R10_CoopExpect = as.numeric(as.character(x[120, "response"])) / 100
  R11_Strategy = ifelse(as.character(x[121, "response"]) == "g", "Cooperate", "Defect")
  R11_Outcome = as.character(x[124, "stimulus"])
  R11_Outcome = toupper(str_sub(R11_Outcome, 62, -33))
  R11_AffectiveFeedback = as.numeric(as.character(x[124, "response"]))
  if (R11_AffectiveFeedback == 0) {
    R11_AffectiveFeedback = "Neutral"
  } else if (R11_AffectiveFeedback == 1) {
    R11_AffectiveFeedback = "Happiness"
  } else if (R11_AffectiveFeedback == 2) {
    R11_AffectiveFeedback = "Anger"
  } else {
    R11_AffectiveFeedback = "Regret"
  }
  R11_AffectiveFeedback = paste(c(R11_Outcome, "_", R11_AffectiveFeedback), collapse="")
  R11_CoopExpect = as.numeric(as.character(x[126, "response"])) / 100
  R12_Strategy = ifelse(as.character(x[127, "response"]) == "g", "Cooperate", "Defect")
  R12_Outcome = as.character(x[130, "stimulus"])
  R12_Outcome = toupper(str_sub(R12_Outcome, 62, -33))
  R12_AffectiveFeedback = as.numeric(as.character(x[130, "response"]))
  if (R12_AffectiveFeedback == 0) {
    R12_AffectiveFeedback = "Neutral"
  } else if (R12_AffectiveFeedback == 1) {
    R12_AffectiveFeedback = "Happiness"
  } else if (R12_AffectiveFeedback == 2) {
    R12_AffectiveFeedback = "Anger"
  } else {
    R12_AffectiveFeedback = "Regret"
  }
  R12_AffectiveFeedback = paste(c(R12_Outcome, "_", R12_AffectiveFeedback), collapse="")
  R12_CoopExpect = as.numeric(as.character(x[132, "response"])) / 100
  R13_Strategy = ifelse(as.character(x[133, "response"]) == "g", "Cooperate", "Defect")
  R13_Outcome = as.character(x[136, "stimulus"])
  R13_Outcome = toupper(str_sub(R13_Outcome, 62, -33))
  R13_AffectiveFeedback = as.numeric(as.character(x[136, "response"]))
  if (R13_AffectiveFeedback == 0) {
    R13_AffectiveFeedback = "Neutral"
  } else if (R13_AffectiveFeedback == 1) {
    R13_AffectiveFeedback = "Happiness"
  } else if (R13_AffectiveFeedback == 2) {
    R13_AffectiveFeedback = "Anger"
  } else {
    R13_AffectiveFeedback = "Regret"
  }
  R13_AffectiveFeedback = paste(c(R13_Outcome, "_", R13_AffectiveFeedback), collapse="")
  R13_CoopExpect = as.numeric(as.character(x[138, "response"])) / 100
  R14_Strategy = ifelse(as.character(x[139, "response"]) == "g", "Cooperate", "Defect")
  R14_Outcome = as.character(x[142, "stimulus"])
  R14_Outcome = toupper(str_sub(R14_Outcome, 62, -33))
  R14_AffectiveFeedback = as.numeric(as.character(x[142, "response"]))
  if (R14_AffectiveFeedback == 0) {
    R14_AffectiveFeedback = "Neutral"
  } else if (R14_AffectiveFeedback == 1) {
    R14_AffectiveFeedback = "Happiness"
  } else if (R14_AffectiveFeedback == 2) {
    R14_AffectiveFeedback = "Anger"
  } else {
    R14_AffectiveFeedback = "Regret"
  }
  R14_AffectiveFeedback = paste(c(R14_Outcome, "_", R14_AffectiveFeedback), collapse="")
  R14_CoopExpect = as.numeric(as.character(x[144, "response"])) / 100
  R15_Strategy = ifelse(as.character(x[145, "response"]) == "g", "Cooperate", "Defect")
  R15_Outcome = as.character(x[148, "stimulus"])
  R15_Outcome = toupper(str_sub(R15_Outcome, 62, -33))
  R15_AffectiveFeedback = as.numeric(as.character(x[148, "response"]))
  if (R15_AffectiveFeedback == 0) {
    R15_AffectiveFeedback = "Neutral"
  } else if (R15_AffectiveFeedback == 1) {
    R15_AffectiveFeedback = "Happiness"
  } else if (R15_AffectiveFeedback == 2) {
    R15_AffectiveFeedback = "Anger"
  } else {
    R15_AffectiveFeedback = "Regret"
  }
  R15_AffectiveFeedback = paste(c(R15_Outcome, "_", R15_AffectiveFeedback), collapse="")
  R15_CoopExpect = as.numeric(as.character(x[150, "response"])) / 100
  R16_Strategy = ifelse(as.character(x[151, "response"]) == "g", "Cooperate", "Defect")
  R16_Outcome = as.character(x[154, "stimulus"])
  R16_Outcome = toupper(str_sub(R16_Outcome, 62, -33))
  R16_AffectiveFeedback = as.numeric(as.character(x[154, "response"]))
  if (R16_AffectiveFeedback == 0) {
    R16_AffectiveFeedback = "Neutral"
  } else if (R16_AffectiveFeedback == 1) {
    R16_AffectiveFeedback = "Happiness"
  } else if (R16_AffectiveFeedback == 2) {
    R16_AffectiveFeedback = "Anger"
  } else {
    R16_AffectiveFeedback = "Regret"
  }
  R16_AffectiveFeedback = paste(c(R16_Outcome, "_", R16_AffectiveFeedback), collapse="")
  R16_CoopExpect = as.numeric(as.character(x[156, "response"])) / 100
  R17_Strategy = ifelse(as.character(x[157, "response"]) == "g", "Cooperate", "Defect")
  R17_Outcome = as.character(x[160, "stimulus"])
  R17_Outcome = toupper(str_sub(R17_Outcome, 62, -33))
  R17_AffectiveFeedback = as.numeric(as.character(x[160, "response"]))
  if (R17_AffectiveFeedback == 0) {
    R17_AffectiveFeedback = "Neutral"
  } else if (R17_AffectiveFeedback == 1) {
    R17_AffectiveFeedback = "Happiness"
  } else if (R17_AffectiveFeedback == 2) {
    R17_AffectiveFeedback = "Anger"
  } else {
    R17_AffectiveFeedback = "Regret"
  }
  R17_AffectiveFeedback = paste(c(R17_Outcome, "_", R17_AffectiveFeedback), collapse="")
  R17_CoopExpect = as.numeric(as.character(x[162, "response"])) / 100
  R18_Strategy = ifelse(as.character(x[163, "response"]) == "g", "Cooperate", "Defect")
  R18_Outcome = as.character(x[166, "stimulus"])
  R18_Outcome = toupper(str_sub(R18_Outcome, 62, -33))
  R18_AffectiveFeedback = as.numeric(as.character(x[166, "response"]))
  if (R18_AffectiveFeedback == 0) {
    R18_AffectiveFeedback = "Neutral"
  } else if (R18_AffectiveFeedback == 1) {
    R18_AffectiveFeedback = "Happiness"
  } else if (R18_AffectiveFeedback == 2) {
    R18_AffectiveFeedback = "Anger"
  } else {
    R18_AffectiveFeedback = "Regret"
  }
  R18_AffectiveFeedback = paste(c(R18_Outcome, "_", R18_AffectiveFeedback), collapse="")
  R18_CoopExpect = as.numeric(as.character(x[168, "response"])) / 100
  R19_Strategy = ifelse(as.character(x[169, "response"]) == "g", "Cooperate", "Defect")
  R19_Outcome = as.character(x[172, "stimulus"])
  R19_Outcome = toupper(str_sub(R19_Outcome, 62, -33))
  R19_AffectiveFeedback = as.numeric(as.character(x[172, "response"]))
  if (R19_AffectiveFeedback == 0) {
    R19_AffectiveFeedback = "Neutral"
  } else if (R19_AffectiveFeedback == 1) {
    R19_AffectiveFeedback = "Happiness"
  } else if (R19_AffectiveFeedback == 2) {
    R19_AffectiveFeedback = "Anger"
  } else {
    R19_AffectiveFeedback = "Regret"
  }
  R19_AffectiveFeedback = paste(c(R19_Outcome, "_", R19_AffectiveFeedback), collapse="")
  R19_CoopExpect = as.numeric(as.character(x[174, "response"])) / 100
  R20_Strategy = ifelse(as.character(x[175, "response"]) == "g", "Cooperate", "Defect")
  R20_Outcome = as.character(x[178, "stimulus"])
  R20_Outcome = toupper(str_sub(R20_Outcome, 62, -33))
  R20_AffectiveFeedback = as.numeric(as.character(x[178, "response"]))
  if (R20_AffectiveFeedback == 0) {
    R20_AffectiveFeedback = "Neutral"
  } else if (R20_AffectiveFeedback == 1) {
    R20_AffectiveFeedback = "Happiness"
  } else if (R20_AffectiveFeedback == 2) {
    R20_AffectiveFeedback = "Anger"
  } else {
    R20_AffectiveFeedback = "Regret"
  }
  R20_AffectiveFeedback = paste(c(R20_Outcome, "_", R20_AffectiveFeedback), collapse="")
  a = c(R1_Strategy, R2_Strategy, R3_Strategy, R4_Strategy, R5_Strategy, R6_Strategy, R7_Strategy, 
         R8_Strategy, R9_Strategy, R10_Strategy, R11_Strategy, R12_Strategy, R13_Strategy, R14_Strategy, 
         R15_Strategy, R16_Strategy, R17_Strategy, R18_Strategy, R19_Strategy, R20_Strategy)
  b = rep("Cooperate", 20)
  IPD_Score = sum(a %in% b) / 20
  CoopExpect = (R1_CoopExpect + R2_CoopExpect + R3_CoopExpect + R4_CoopExpect + R5_CoopExpect +
                  R6_CoopExpect + R7_CoopExpect + R8_CoopExpect + R9_CoopExpect + R10_CoopExpect + 
                  R11_CoopExpect + R12_CoopExpect + R13_CoopExpect + R14_CoopExpect + R15_CoopExpect + 
                  R16_CoopExpect + R17_CoopExpect + R18_CoopExpect + R19_CoopExpect) / 19
  PPI = as.character(x[180, "response"])
  PPI_1 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_1\":)\\d+"))
  PPI_2 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_2\":)\\d+"))
  PPI_3 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_3\":)\\d+"))
  PPI_4 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_4\":)\\d+"))
  PPI_5 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_5\":)\\d+"))
  PPI_6 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_6\":)\\d+"))
  PPI_7 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_7\":)\\d+"))
  PPI_8 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_8\":)\\d+"))
  PPI_9 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_9\":)\\d+"))
  PPI_10 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_10\":)\\d+"))
  PPI_11 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_11\":)\\d+"))
  PPI_12 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_12\":)\\d+"))
  PPI_13 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_13\":)\\d+"))
  PPI_14 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_14\":)\\d+"))
  PPI_15 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_15\":)\\d+"))
  PPI_16 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_16\":)\\d+"))
  PPI_17 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_17\":)\\d+"))
  PPI_18 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_18\":)\\d+"))
  PPI_19 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_19\":)\\d+"))
  PPI_20 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_20\":)\\d+"))
  PPI_21 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_21\":)\\d+"))
  PPI_22 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_22\":)\\d+"))
  PPI_23 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_23\":)\\d+"))
  PPI_24 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_24\":)\\d+"))
  PPI_25 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_25\":)\\d+"))
  PPI_26 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_26\":)\\d+"))
  PPI_27 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_27\":)\\d+"))
  PPI_28 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_28\":)\\d+"))
  PPI_29 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_29\":)\\d+"))
  PPI_30 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_30\":)\\d+"))
  PPI_31 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_31\":)\\d+"))
  PPI_32 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_32\":)\\d+"))
  PPI_33 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_33\":)\\d+"))
  PPI_34 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_34\":)\\d+"))
  PPI_35 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_35\":)\\d+"))
  PPI_36 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_36\":)\\d+"))
  PPI_37 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_37\":)\\d+"))
  PPI_38 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_38\":)\\d+"))
  PPI_39 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_39\":)\\d+"))
  PPI_40 = as.numeric(str_extract(PPI, "(?i)(?<=PPIR_40\":)\\d+"))

  if (PPI_1 == 0) {
    PPI40_4 = 1 
  } else if (PPI_1 == 1) {
    PPI40_4 = 2
  } else if (PPI_1 == 2) {
    PPI40_4 = 3
  } else if (PPI_1 == 3) {
    PPI40_4 = 4
  } else { 
    PPI40_4 = NA 
  }
  
  if (PPI_1 == 0) {
    PPI_1 = 1 
  } else if (PPI_1 == 1) {
    PPI_1 = 2
  } else if (PPI_1 == 2) {
    PPI_1 = 3
  } else if (PPI_1 == 3) {
    PPI_1 = 4
  } else { 
    PPI_1 = NA 
  }
  
  if (PPI_2 == 0) {
    PPI40_10 = 1
  } else if (PPI_2 == 1) {
    PPI40_10 = 2
  } else if (PPI_2 == 2) {
    PPI40_10 = 3
  } else if (PPI_2 == 3) {
    PPI40_10 = 4
  } else { 
    PPI40_10 = NA
  }
  
  if (PPI_2 == 0) {
    PPI_2 = 1 
  } else if (PPI_2 == 1) {
    PPI_2 = 2
  } else if (PPI_2 == 2) {
    PPI_2 = 3
  } else if (PPI_2 == 3) {
    PPI_2 = 4
  } else { 
    PPI_2 = NA 
  }
  
  if (PPI_3 == 0) {
    PPI40_12 = 1
  } else if (PPI_3 == 1) {
    PPI40_12 = 2
  } else if (PPI_3 == 2) {
    PPI40_12 = 3
  } else if (PPI_3 == 3) {
    PPI40_12 = 4
  } else { 
    PPI40_12 = NA
  }
  
  if (PPI_3 == 0) {
    PPI_3 = 1 
  } else if (PPI_3 == 1) {
    PPI_3 = 2
  } else if (PPI_3 == 2) {
    PPI_3 = 3
  } else if (PPI_3 == 3) {
    PPI_3 = 4
  } else { 
    PPI_3 = NA 
  }
  
  if (PPI_4 == 0) {
    PPI40_18 = 1
  } else if (PPI_4 == 1) {
    PPI40_18 = 2
  } else if (PPI_4 == 2) {
    PPI40_18 = 3
  } else if (PPI_4 == 3) {
    PPI40_18 = 4
  } else { 
    PPI40_18 = NA
  }
  
  if (PPI_4 == 0) {
    PPI_4 = 1 
  } else if (PPI_4 == 1) {
    PPI_4 = 2
  } else if (PPI_4 == 2) {
    PPI_4 = 3
  } else if (PPI_4 == 3) {
    PPI_4 = 4
  } else { 
    PPI_4 = NA 
  }
  
  if (PPI_5 == 0) {
    PPI40_19 = 1
  } else if (PPI_5 == 1) {
    PPI40_19 = 2
  } else if (PPI_5 == 2) {
    PPI40_19 = 3
  } else if (PPI_5 == 3) {
    PPI40_19 = 4
  } else { 
    PPI40_19 = NA
  }
  
  if (PPI_5 == 0) {
    PPI_5 = 1 
  } else if (PPI_5 == 1) {
    PPI_5 = 2
  } else if (PPI_5 == 2) {
    PPI_5 = 3
  } else if (PPI_5 == 3) {
    PPI_5 = 4
  } else { 
    PPI_5 = NA 
  }
  
  if (PPI_6 == 0) {
    PPI40_22 = 1
  } else if (PPI_6 == 1) {
    PPI40_22 = 2
  } else if (PPI_6 == 2) {
    PPI40_22 = 3
  } else if (PPI_6 == 3) {
    PPI40_22 = 4
  } else { 
    PPI40_22 = NA
  }
  
  if (PPI_6 == 0) {
    PPI_6 = 1 
  } else if (PPI_6 == 1) {
    PPI_6 = 2
  } else if (PPI_6 == 2) {
    PPI_6 = 3
  } else if (PPI_6 == 3) {
    PPI_6 = 4
  } else { 
    PPI_6 = NA 
  }
  
  if (PPI_7 == 0) {
    PPI40_27 = 1
  } else if (PPI_7 == 1) {
    PPI40_27 = 2
  } else if (PPI_7 == 2) {
    PPI40_27 = 3
  } else if (PPI_7 == 3) {
    PPI40_27 = 4
  } else { 
    PPI40_27 = NA
  }
  
  if (PPI_7 == 0) {
    PPI_7 = 1 
  } else if (PPI_7 == 1) {
    PPI_7 = 2
  } else if (PPI_7 == 2) {
    PPI_7 = 3
  } else if (PPI_7 == 3) {
    PPI_7 = 4
  } else { 
    PPI_7 = NA 
  }
  
  if (PPI_8 == 0) {
    PPI40_32 = 1
  } else if (PPI_8 == 1) {
    PPI40_32 = 2
  } else if (PPI_8 == 2) {
    PPI40_32 = 3
  } else if (PPI_8 == 3) {
    PPI40_32 = 4
  } else { 
    PPI40_32 = NA
  }
  
  if (PPI_8 == 0) {
    PPI_8 = 1 
  } else if (PPI_8 == 1) {
    PPI_8 = 2
  } else if (PPI_8 == 2) {
    PPI_8 = 3
  } else if (PPI_8 == 3) {
    PPI_8 = 4
  } else { 
    PPI_8 = NA 
  }
  
  if (PPI_9 == 0) {
    PPI40_33 = 1
  } else if (PPI_9 == 1) {
    PPI40_33 = 2
  } else if (PPI_9 == 2) {
    PPI40_33 = 3
  } else if (PPI_9 == 3) {
    PPI40_33 = 4
  } else { 
    PPI40_33 = NA
  }
  
  if (PPI_9 == 0) {
    PPI_9 = 1 
  } else if (PPI_9 == 1) {
    PPI_9 = 2
  } else if (PPI_9 == 2) {
    PPI_9 = 3
  } else if (PPI_9 == 3) {
    PPI_9 = 4
  } else { 
    PPI_9 = NA 
  }
  
  if (PPI_10 == 0) {
    PPI40_34 = 1
  } else if (PPI_10 == 1) {
    PPI40_34 = 2
  } else if (PPI_10 == 2) {
    PPI40_34 = 3
  } else if (PPI_10 == 3) {
    PPI40_34 = 4
  } else { 
    PPI40_34 = NA
  }
  
  if (PPI_10 == 0) {
    PPI_10 = 1 
  } else if (PPI_10 == 1) {
    PPI_10 = 2
  } else if (PPI_10 == 2) {
    PPI_10 = 3
  } else if (PPI_10 == 3) {
    PPI_10 = 4
  } else { 
    PPI_10 = NA 
  }
  
  if (PPI_11 == 0) {
    PPI40_36 = 1
  } else if (PPI_11 == 1) {
    PPI40_36 = 2
  } else if (PPI_11 == 2) {
    PPI40_36 = 3
  } else if (PPI_11 == 3) {
    PPI40_36 = 4
  } else { 
    PPI40_36 = NA
  }
  
  if (PPI_11 == 0) {
    PPI_11 = 1 
  } else if (PPI_11 == 1) {
    PPI_11 = 2
  } else if (PPI_11 == 2) {
    PPI_11 = 3
  } else if (PPI_11 == 3) {
    PPI_11 = 4
  } else { 
    PPI_11 = NA 
  }
  
  if (PPI_12 == 0) {
    PPI40_40 = 1
  } else if (PPI_12 == 1) {
    PPI40_40 = 2
  } else if (PPI_12 == 2) {
    PPI40_40 = 3
  } else if (PPI_12 == 3) {
    PPI40_40 = 4
  } else { 
    PPI40_40 = NA
  }
  
  if (PPI_12 == 0) {
    PPI_12 = 1 
  } else if (PPI_12 == 1) {
    PPI_12 = 2
  } else if (PPI_12 == 2) {
    PPI_12 = 3
  } else if (PPI_12 == 3) {
    PPI_12 = 4
  } else { 
    PPI_12 = NA 
  }
  
  if (PPI_13 == 0) {
    PPI40_46 = 1
  } else if (PPI_13 == 1) {
    PPI40_46 = 2
  } else if (PPI_13 == 2) {
    PPI40_46 = 3
  } else if (PPI_13 == 3) {
    PPI40_46 = 4
  } else { 
    PPI40_46 = NA
  }
  
  if (PPI_13 == 0) {
    PPI_13 = 1 
  } else if (PPI_13 == 1) {
    PPI_13 = 2
  } else if (PPI_13 == 2) {
    PPI_13 = 3
  } else if (PPI_13 == 3) {
    PPI_13 = 4
  } else { 
    PPI_13 = NA 
  }
  
  if (PPI_14 == 0) {
    PPI40_47 = 1
  } else if (PPI_14 == 1) {
    PPI40_47 = 2
  } else if (PPI_14 == 2) {
    PPI40_47 = 3
  } else if (PPI_14 == 3) {
    PPI40_47 = 4
  } else { 
    PPI40_47 = NA
  }
  
  if (PPI_14 == 0) {
    PPI_14 = 1 
  } else if (PPI_14 == 1) {
    PPI_14 = 2
  } else if (PPI_14 == 2) {
    PPI_14 = 3
  } else if (PPI_14 == 3) {
    PPI_14 = 4
  } else { 
    PPI_14 = NA 
  }
  
  if (PPI_15 == 0) {
    PPI40_58 = 1
  } else if (PPI_15 == 1) {
    PPI40_58 = 2
  } else if (PPI_15 == 2) {
    PPI40_58 = 3
  } else if (PPI_15 == 3) {
    PPI40_58 = 4
  } else { 
    PPI40_58 = NA
  }
  
  if (PPI_15 == 0) {
    PPI_15 = 1 
  } else if (PPI_15 == 1) {
    PPI_15 = 2
  } else if (PPI_15 == 2) {
    PPI_15 = 3
  } else if (PPI_15 == 3) {
    PPI_15 = 4
  } else { 
    PPI_15 = NA 
  }
  
  if (PPI_16 == 0) {
    PPI40_67 = 1
  } else if (PPI_16 == 1) {
    PPI40_67 = 2
  } else if (PPI_16 == 2) {
    PPI40_67 = 3
  } else if (PPI_16 == 3) {
    PPI40_67 = 4
  } else { 
    PPI40_67 = NA
  }
  
  if (PPI_16 == 0) {
    PPI_16 = 1 
  } else if (PPI_16 == 1) {
    PPI_16 = 2
  } else if (PPI_16 == 2) {
    PPI_16 = 3
  } else if (PPI_16 == 3) {
    PPI_16 = 4
  } else { 
    PPI_16 = NA 
  }
  
  if (PPI_17 == 0) {
    PPI40_75 = 1
  } else if (PPI_17 == 1) {
    PPI40_75 = 2
  } else if (PPI_17 == 2) {
    PPI40_75 = 3
  } else if (PPI_17 == 3) {
    PPI40_75 = 4
  } else { 
    PPI40_75 = NA
  }
  
  if (PPI_17 == 0) {
    PPI_17 = 1 
  } else if (PPI_17 == 1) {
    PPI_17 = 2
  } else if (PPI_17 == 2) {
    PPI_17 = 3
  } else if (PPI_17 == 3) {
    PPI_17 = 4
  } else { 
    PPI_17 = NA 
  }
  
  if (PPI_18 == 0) {
    PPI40_76 = 1
  } else if (PPI_18 == 1) {
    PPI40_76 = 2
  } else if (PPI_18 == 2) {
    PPI40_76 = 3
  } else if (PPI_18 == 3) {
    PPI40_76 = 4
  } else { 
    PPI40_76 = NA
  }
  
  if (PPI_18 == 0) {
    PPI_18 = 1 
  } else if (PPI_18 == 1) {
    PPI_18 = 2
  } else if (PPI_18 == 2) {
    PPI_18 = 3
  } else if (PPI_18 == 3) {
    PPI_18 = 4
  } else { 
    PPI_18 = NA 
  }
  
  if (PPI_19 == 0) {
    PPI40_77 = 1
  } else if (PPI_19 == 1) {
    PPI40_77 = 2
  } else if (PPI_19 == 2) {
    PPI40_77 = 3
  } else if (PPI_19 == 3) {
    PPI40_77 = 4
  } else { 
    PPI40_77 = NA
  }
  
  if (PPI_19 == 0) {
    PPI_19 = 1 
  } else if (PPI_19 == 1) {
    PPI_19 = 2
  } else if (PPI_19 == 2) {
    PPI_19 = 3
  } else if (PPI_19 == 3) {
    PPI_19 = 4
  } else { 
    PPI_19 = NA 
  }
  
  if (PPI_20 == 0) {
    PPI40_80 = 1
  } else if (PPI_20 == 1) {
    PPI40_80 = 2
  } else if (PPI_20 == 2) {
    PPI40_80 = 3
  } else if (PPI_20 == 3) {
    PPI40_80 = 4
  } else { 
    PPI40_80 = NA
  }
  
  if (PPI_20 == 0) {
    PPI_20 = 1 
  } else if (PPI_20 == 1) {
    PPI_20 = 2
  } else if (PPI_20 == 2) {
    PPI_20 = 3
  } else if (PPI_20 == 3) {
    PPI_20 = 4
  } else { 
    PPI_20 = NA 
  }
  
  if (PPI_21 == 0) {
    PPI40_84 = 1
  } else if (PPI_21 == 1) {
    PPI40_84 = 2
  } else if (PPI_21 == 2) {
    PPI40_84 = 3
  } else if (PPI_21 == 3) {
    PPI40_84 = 4
  } else { 
    PPI40_84 = NA
  }
  
  if (PPI_21 == 0) {
    PPI_21 = 1 
  } else if (PPI_21 == 1) {
    PPI_21 = 2
  } else if (PPI_21 == 2) {
    PPI_21 = 3
  } else if (PPI_21 == 3) {
    PPI_21 = 4
  } else { 
    PPI_21 = NA 
  }
  
  if (PPI_22 == 0) {
    PPI40_87 = 1
  } else if (PPI_22 == 1) {
    PPI40_87 = 2
  } else if (PPI_22 == 2) {
    PPI40_87 = 3
  } else if (PPI_22 == 3) {
    PPI40_87 = 4
  } else { 
    PPI40_87 = NA
  }
  
  if (PPI_22 == 0) {
    PPI_22 = 1 
  } else if (PPI_22 == 1) {
    PPI_22 = 2
  } else if (PPI_22 == 2) {
    PPI_22 = 3
  } else if (PPI_22 == 3) {
    PPI_22 = 4
  } else { 
    PPI_22 = NA 
  }
  
  if (PPI_23 == 0) {
    PPI40_89 = 1
  } else if (PPI_23 == 1) {
    PPI40_89 = 2
  } else if (PPI_23 == 2) {
    PPI40_89 = 3
  } else if (PPI_23 == 3) {
    PPI40_89 = 4
  } else { 
    PPI40_89 = NA
  }
  
  if (PPI_23 == 0) {
    PPI_23 = 1 
  } else if (PPI_23 == 1) {
    PPI_23 = 2
  } else if (PPI_23 == 2) {
    PPI_23 = 3
  } else if (PPI_23 == 3) {
    PPI_23 = 4
  } else { 
    PPI_23 = NA 
  }
  
  if (PPI_24 == 0) {
    PPI40_97 = 1
  } else if (PPI_24 == 1) {
    PPI40_97 = 2
  } else if (PPI_24 == 2) {
    PPI40_97 = 3
  } else if (PPI_24 == 3) {
    PPI40_97 = 4
  } else { 
    PPI40_97 = NA
  }
  
  if (PPI_24 == 0) {
    PPI_24 = 1 
  } else if (PPI_24 == 1) {
    PPI_24 = 2
  } else if (PPI_24 == 2) {
    PPI_24 = 3
  } else if (PPI_24 == 3) {
    PPI_24 = 4
  } else { 
    PPI_24 = NA 
  }
  
  if (PPI_25 == 0) {
    PPI40_108 = 1
  } else if (PPI_25 == 1) {
    PPI40_108 = 2
  } else if (PPI_25 == 2) {
    PPI40_108 = 3
  } else if (PPI_25 == 3) {
    PPI40_108 = 4
  } else { 
    PPI40_108 = NA
  }
  
  if (PPI_25 == 0) {
    PPI_25 = 1 
  } else if (PPI_25 == 1) {
    PPI_25 = 2
  } else if (PPI_25 == 2) {
    PPI_25 = 3
  } else if (PPI_25 == 3) {
    PPI_25 = 4
  } else { 
    PPI_25 = NA 
  }
  
  if (PPI_26 == 0) {
    PPI40_109 = 1
  } else if (PPI_26 == 1) {
    PPI40_109 = 2
  } else if (PPI_26 == 2) {
    PPI40_109 = 3
  } else if (PPI_26 == 3) {
    PPI40_109 = 4
  } else { 
    PPI40_109 = NA
  }
  
  if (PPI_26 == 0) {
    PPI_26 = 1 
  } else if (PPI_26 == 1) {
    PPI_26 = 2
  } else if (PPI_26 == 2) {
    PPI_26 = 3
  } else if (PPI_26 == 3) {
    PPI_26 = 4
  } else { 
    PPI_26 = NA 
  }
  
  if (PPI_27 == 0) {
    PPI40_113 = 1
  } else if (PPI_27 == 1) {
    PPI40_113 = 2
  } else if (PPI_27 == 2) {
    PPI40_113 = 3
  } else if (PPI_27 == 3) {
    PPI40_113 = 4
  } else { 
    PPI40_113 = NA
  }
  
  if (PPI_27 == 0) {
    PPI_27 = 1 
  } else if (PPI_27 == 1) {
    PPI_27 = 2
  } else if (PPI_27 == 2) {
    PPI_27 = 3
  } else if (PPI_27 == 3) {
    PPI_27 = 4
  } else { 
    PPI_27 = NA 
  }
  
  if (PPI_28 == 0) {
    PPI40_115 = 1
  } else if (PPI_28 == 1) {
    PPI40_115 = 2
  } else if (PPI_28 == 2) {
    PPI40_115 = 3
  } else if (PPI_28 == 3) {
    PPI40_115 = 4
  } else { 
    PPI40_115 = NA
  }
  
  if (PPI_28 == 0) {
    PPI_28 = 1 
  } else if (PPI_28 == 1) {
    PPI_28 = 2
  } else if (PPI_28 == 2) {
    PPI_28 = 3
  } else if (PPI_28 == 3) {
    PPI_28 = 4
  } else { 
    PPI_28 = NA 
  }
  
  if (PPI_29 == 0) {
    PPI40_119 = 1
  } else if (PPI_29 == 1) {
    PPI40_119 = 2
  } else if (PPI_29 == 2) {
    PPI40_119 = 3
  } else if (PPI_29 == 3) {
    PPI40_119 = 4
  } else { 
    PPI40_119 = NA
  }
  
  if (PPI_29 == 0) {
    PPI_29 = 1 
  } else if (PPI_29 == 1) {
    PPI_29 = 2
  } else if (PPI_29 == 2) {
    PPI_29 = 3
  } else if (PPI_29 == 3) {
    PPI_29 = 4
  } else { 
    PPI_29 = NA 
  }
  
  if (PPI_30 == 0) {
    PPI40_121 = 1
  } else if (PPI_30 == 1) {
    PPI40_121 = 2
  } else if (PPI_30 == 2) {
    PPI40_121 = 3
  } else if (PPI_30 == 3) {
    PPI40_121 = 4
  } else { 
    PPI40_121 = NA
  }
  
  if (PPI_30 == 0) {
    PPI_30 = 1 
  } else if (PPI_30 == 1) {
    PPI_30 = 2
  } else if (PPI_30 == 2) {
    PPI_30 = 3
  } else if (PPI_30 == 3) {
    PPI_30 = 4
  } else { 
    PPI_30 = NA 
  }
  
  if (PPI_31 == 0) {
    PPI40_122 = 1
  } else if (PPI_31 == 1) {
    PPI40_122 = 2
  } else if (PPI_31 == 2) {
    PPI40_122 = 3
  } else if (PPI_31 == 3) {
    PPI40_122 = 4
  } else { 
    PPI40_122 = NA
  }
  
  if (PPI_31 == 0) {
    PPI_31 = 1 
  } else if (PPI_31 == 1) {
    PPI_31 = 2
  } else if (PPI_31 == 2) {
    PPI_31 = 3
  } else if (PPI_31 == 3) {
    PPI_31 = 4
  } else { 
    PPI_31 = NA 
  }
  
  if (PPI_32 == 0) {
    PPI40_130 = 1
  } else if (PPI_32 == 1) {
    PPI40_130 = 2
  } else if (PPI_32 == 2) {
    PPI40_130 = 3
  } else if (PPI_32 == 3) {
    PPI40_130 = 4
  } else { 
    PPI40_130 = NA
  }
  
  if (PPI_32 == 0) {
    PPI_32 = 1 
  } else if (PPI_32 == 1) {
    PPI_32 = 2
  } else if (PPI_32 == 2) {
    PPI_32 = 3
  } else if (PPI_32 == 3) {
    PPI_32 = 4
  } else { 
    PPI_32 = NA 
  }
  
  if (PPI_33 == 0) {
    PPI40_136 = 1
  } else if (PPI_33 == 1) {
    PPI40_136 = 2
  } else if (PPI_33 == 2) {
    PPI40_136 = 3
  } else if (PPI_33 == 3) {
    PPI40_136 = 4
  } else { 
    PPI40_136 = NA
  }
  
  if (PPI_33 == 0) {
    PPI_33 = 1 
  } else if (PPI_33 == 1) {
    PPI_33 = 2
  } else if (PPI_33 == 2) {
    PPI_33 = 3
  } else if (PPI_33 == 3) {
    PPI_33 = 4
  } else { 
    PPI_33 = NA 
  }
  
  if (PPI_34 == 0) {
    PPI40_137 = 1
  } else if (PPI_34 == 1) {
    PPI40_137 = 2
  } else if (PPI_34 == 2) {
    PPI40_137 = 3
  } else if (PPI_34 == 3) {
    PPI40_137 = 4
  } else { 
    PPI40_137 = NA
  }
  
  if (PPI_34 == 0) {
    PPI_34 = 1 
  } else if (PPI_34 == 1) {
    PPI_34 = 2
  } else if (PPI_34 == 2) {
    PPI_34 = 3
  } else if (PPI_34 == 3) {
    PPI_34 = 4
  } else { 
    PPI_34 = NA 
  }
  
  if (PPI_35 == 0) {
    PPI40_140 = 1
  } else if (PPI_35 == 1) {
    PPI40_140 = 2
  } else if (PPI_35 == 2) {
    PPI40_140 = 3
  } else if (PPI_35 == 3) {
    PPI40_140 = 4
  } else { 
    PPI40_140 = NA
  }
  
  if (PPI_35 == 0) {
    PPI_35 = 1 
  } else if (PPI_35 == 1) {
    PPI_35 = 2
  } else if (PPI_35 == 2) {
    PPI_35 = 3
  } else if (PPI_35 == 3) {
    PPI_35 = 4
  } else { 
    PPI_35 = NA 
  }
  
  if (PPI_36 == 0) {
    PPI40_145 = 1
  } else if (PPI_36 == 1) {
    PPI40_145 = 2
  } else if (PPI_36 == 2) {
    PPI40_145 = 3
  } else if (PPI_36 == 3) {
    PPI40_145 = 4
  } else { 
    PPI40_145 = NA
  }
  
  if (PPI_36 == 0) {
    PPI_36 = 1 
  } else if (PPI_36 == 1) {
    PPI_36 = 2
  } else if (PPI_36 == 2) {
    PPI_36 = 3
  } else if (PPI_36 == 3) {
    PPI_36 = 4
  } else { 
    PPI_36 = NA 
  }
  
  if (PPI_37 == 0) {
    PPI40_148 = 1
  } else if (PPI_37 == 1) {
    PPI40_148 = 2
  } else if (PPI_37 == 2) {
    PPI40_148 = 3
  } else if (PPI_37 == 3) {
    PPI40_148 = 4
  } else { 
    PPI40_148 = NA
  }
  
  if (PPI_37 == 0) {
    PPI_37 = 1 
  } else if (PPI_37 == 1) {
    PPI_37 = 2
  } else if (PPI_37 == 2) {
    PPI_37 = 3
  } else if (PPI_37 == 3) {
    PPI_37 = 4
  } else { 
    PPI_37 = NA 
  }
  
  if (PPI_38 == 0) {
    PPI40_149 = 1
  } else if (PPI_38 == 1) {
    PPI40_149 = 2
  } else if (PPI_38 == 2) {
    PPI40_149 = 3
  } else if (PPI_38 == 3) {
    PPI40_149 = 4
  } else { 
    PPI40_149 = NA
  }
  
  if (PPI_38 == 0) {
    PPI_38 = 1 
  } else if (PPI_38 == 1) {
    PPI_38 = 2
  } else if (PPI_38 == 2) {
    PPI_38 = 3
  } else if (PPI_38 == 3) {
    PPI_38 = 4
  } else { 
    PPI_38 = NA 
  }
  
  if (PPI_39 == 0) {
    PPI40_153 = 1
  } else if (PPI_39 == 1) {
    PPI40_153 = 2
  } else if (PPI_39 == 2) {
    PPI40_153 = 3
  } else if (PPI_39 == 3) {
    PPI40_153 = 4
  } else { 
    PPI40_153 = NA
  }
  
  if (PPI_39 == 0) {
    PPI_39 = 1 
  } else if (PPI_39 == 1) {
    PPI_39 = 2
  } else if (PPI_39 == 2) {
    PPI_39 = 3
  } else if (PPI_39 == 3) {
    PPI_39 = 4
  } else { 
    PPI_39 = NA 
  }
  
  if (PPI_40 == 0) {
    PPI40_154 = 1
  } else if (PPI_40 == 1) {
    PPI40_154 = 2
  } else if (PPI_40 == 2) {
    PPI40_154 = 3
  } else if (PPI_40 == 3) {
    PPI40_154 = 4
  } else { 
    PPI40_154 = NA
  }
  
  if (PPI_40 == 0) {
    PPI_40 = 1 
  } else if (PPI_40 == 1) {
    PPI_40 = 2
  } else if (PPI_40 == 2) {
    PPI_40 = 3
  } else if (PPI_40 == 3) {
    PPI_40 = 4
  } else { 
    PPI_40 = NA 
  }
  
  if (PPI40_10 == 1) {
    PPIR_10_r = 4
  } else if (PPI40_10 == 2) {
    PPIR_10_r = 3
  } else if (PPI40_10 == 3) {
    PPIR_10_r = 2
  } else if (PPI40_10 == 4) {
    PPIR_10_r = 1
  } else { 
    PPIR_10_r = NA
  }
  
  if (PPI40_22 == 1) {
    PPIR_22_r = 4
  } else if (PPI40_22 == 2) {
    PPIR_22_r = 3
  } else if (PPI40_22 == 3) {
    PPIR_22_r = 2
  } else if (PPI40_22 == 4) {
    PPIR_22_r = 1
  } else { 
    PPIR_22_r = NA
  }
  
  if (PPI40_27 == 1) {
    PPIR_27_r = 4
  } else if (PPI40_27 == 2) {
    PPIR_27_r = 3
  } else if (PPI40_27 == 3) {
    PPIR_27_r = 2
  } else if (PPI40_27 == 4) {
    PPIR_27_r = 1
  } else { 
    PPIR_27_r = NA
  }
  
  if (PPI40_47 == 1) {
    PPIR_47_r = 4
  } else if (PPI40_47 == 2) {
    PPIR_47_r = 3
  } else if (PPI40_47 == 3) {
    PPIR_47_r = 2
  } else if (PPI40_47 == 4) {
    PPIR_47_r = 1
  } else { 
    PPIR_47_r = NA
  }
  
  if (PPI40_75 == 1) {
    PPIR_75_r = 4
  } else if (PPI40_75 == 2) {
    PPIR_75_r = 3
  } else if (PPI40_75 == 3) {
    PPIR_75_r = 2
  } else if (PPI40_75 == 4) {
    PPIR_75_r = 1
  } else { 
    PPIR_75_r = NA
  }
  
  if (PPI40_76 == 1) {
    PPIR_76_r = 4
  } else if (PPI40_76 == 2) {
    PPIR_76_r = 3
  } else if (PPI40_76 == 3) {
    PPIR_76_r = 2
  } else if (PPI40_76 == 4) {
    PPIR_76_r = 1
  } else { 
    PPIR_76_r = NA
  }
  
  if (PPI40_87 == 1) {
    PPIR_87_r = 4
  } else if (PPI40_87 == 2) {
    PPIR_87_r = 3
  } else if (PPI40_87 == 3) {
    PPIR_87_r = 2
  } else if (PPI40_87 == 4) {
    PPIR_87_r = 1
  } else { 
    PPIR_87_r = NA
  }
  
  if (PPI40_89 == 1) {
    PPIR_89_r = 4
  } else if (PPI40_89 == 2) {
    PPIR_89_r = 3
  } else if (PPI40_89 == 3) {
    PPIR_89_r = 2
  } else if (PPI40_89 == 4) {
    PPIR_89_r = 1
  } else { 
    PPIR_89_r = NA
  }
  
  if (PPI40_97 == 1) {
    PPIR_97_r = 4
  } else if (PPI40_97 == 2) {
    PPIR_97_r = 3
  } else if (PPI40_97 == 3) {
    PPIR_97_r = 2
  } else if (PPI40_97 == 4) {
    PPIR_97_r = 1
  } else { 
    PPIR_97_r = NA
  }
  
  if (PPI40_108 == 1) {
    PPIR_108_r = 4
  } else if (PPI40_108 == 2) {
    PPIR_108_r = 3
  } else if (PPI40_108 == 3) {
    PPIR_108_r = 2
  } else if (PPI40_108 == 4) {
    PPIR_108_r = 1
  } else { 
    PPIR_108_r = NA
  }
  
  if (PPI40_109 == 1) {
    PPIR_109_r = 4
  } else if (PPI40_109 == 2) {
    PPIR_109_r = 3
  } else if (PPI40_109 == 3) {
    PPIR_109_r = 2
  } else if (PPI40_109 == 4) {
    PPIR_109_r = 1
  } else { 
    PPIR_109_r = NA
  }
  
  if (PPI40_113 == 1) {
    PPIR_113_r = 4
  } else if (PPI40_113 == 2) {
    PPIR_113_r = 3
  } else if (PPI40_113 == 3) {
    PPIR_113_r = 2
  } else if (PPI40_113 == 4) {
    PPIR_113_r = 1
  } else { 
    PPIR_113_r = NA
  }
  
  if (PPI40_119 == 1) {
    PPIR_119_r = 4
  } else if (PPI40_119 == 2) {
    PPIR_119_r = 3
  } else if (PPI40_119 == 3) {
    PPIR_119_r = 2
  } else if (PPI40_119 == 4) {
    PPIR_119_r = 1
  } else { 
    PPIR_119_r = NA
  }
  
  if (PPI40_121 == 1) {
    PPIR_121_r = 4
  } else if (PPI40_121 == 2) {
    PPIR_121_r = 3
  } else if (PPI40_121 == 3) {
    PPIR_121_r = 2
  } else if (PPI40_121 == 4) {
    PPIR_121_r = 1
  } else { 
    PPIR_121_r = NA
  }
  
  if (PPI40_130 == 1) {
    PPIR_130_r = 4
  } else if (PPI40_130 == 2) {
    PPIR_130_r = 3
  } else if (PPI40_130 == 3) {
    PPIR_130_r = 2
  } else if (PPI40_130 == 4) {
    PPIR_130_r = 1
  } else { 
    PPIR_130_r = NA
  }
  
  if (PPI40_145 == 1) {
    PPIR_145_r = 4
  } else if (PPI40_145 == 2) {
    PPIR_145_r = 3
  } else if (PPI40_145 == 3) {
    PPIR_145_r = 2
  } else if (PPI40_145 == 4) {
    PPIR_145_r = 1
  } else { 
    PPIR_145_r = NA
  }
  
  if (PPI40_153 == 1) {
    PPIR_153_r = 4
  } else if (PPI40_153 == 2) {
    PPIR_153_r = 3
  } else if (PPI40_153 == 3) {
    PPIR_153_r = 2
  } else if (PPI40_153 == 4) {
    PPIR_153_r = 1
  } else { 
    PPIR_153_r = NA
  }
  
  PPIR_4 = PPI40_4
  PPIR_12 = PPI40_12
  PPIR_18 = PPI40_18
  PPIR_19 = PPI40_19
  PPIR_32 = PPI40_32
  PPIR_33 = PPI40_33
  PPIR_34 = PPI40_34
  PPIR_36 = PPI40_36
  PPIR_40 = PPI40_40
  PPIR_46 = PPI40_46
  PPIR_58 = PPI40_58
  PPIR_67 = PPI40_67
  PPIR_77 = PPI40_77
  PPIR_80 = PPI40_80
  PPIR_84 = PPI40_84
  PPIR_115 = PPI40_115
  PPIR_122 = PPI40_122
  PPIR_136 = PPI40_136
  PPIR_137 = PPI40_137
  PPIR_140 = PPI40_140
  PPIR_148 = PPI40_148
  PPIR_149 = PPI40_149
  PPIR_154 = PPI40_154
  
  PPIR_ME = PPIR_33 + PPIR_67 + PPIR_77 + PPIR_136 + PPIR_154
  
  PPIR_SOI = PPIR_87_r + PPIR_22_r + PPIR_113_r + PPIR_34 + PPIR_46
  
  PPIR_F = PPIR_47_r + PPIR_12 + PPIR_115 + PPIR_137 + PPIR_148
  
  PPIR_RN = PPIR_4 + PPIR_36 + PPIR_58 + PPIR_80 + PPIR_149
  
  PPIR_C = PPIR_27_r + PPIR_75_r + PPIR_97_r + PPIR_109_r + PPIR_153_r
  
  PPIR_STI = PPIR_10_r + PPIR_76_r + PPIR_119_r + PPIR_32 + PPIR_140
  
  PPIR_CN = PPIR_89_r + PPIR_121_r + PPIR_145_r + PPIR_108_r + PPIR_130_r
  
  PPIR_BE = PPIR_18 + PPIR_19 + PPIR_40 + PPIR_84 + PPIR_122
  
  PPIR_TOTAL = PPIR_ME + PPIR_SOI + PPIR_F + PPIR_RN + PPIR_C + PPIR_STI + PPIR_CN + PPIR_BE
  
  PPIR_SCImp = PPIR_ME + PPIR_RN + PPIR_BE + PPIR_CN
  
  PPIR_FearDom = PPIR_SOI + PPIR_F + PPIR_STI
  
  df = data.frame(run_id, sample, condition, assigned_userid, created_userid, prolific_id, age, gender, race_ethnicity, SAM_valence_pre, SAM_arousal_pre, 
                  SAM_valence_post, SAM_arousal_post, FERT_Score, FERT_Score_2, FERT_CorrectEstimate, FERT_Anger, FERT_Disgust, FERT_Fear, FERT_Happiness, FERT_Sadness, FERT_Surprise, 
                  attention_check, R1_Strategy, R1_Outcome, R1_AffectiveFeedback, R1_CoopExpect, 
                  R2_Strategy, R2_Outcome, R2_AffectiveFeedback, R2_CoopExpect, R3_Strategy, R3_Outcome, R3_AffectiveFeedback, R3_CoopExpect,
                  R4_Strategy, R4_Outcome, R4_AffectiveFeedback, R4_CoopExpect, R5_Strategy, R5_Outcome, R5_AffectiveFeedback, R5_CoopExpect,
                  R6_Strategy, R6_Outcome, R6_AffectiveFeedback, R6_CoopExpect, R7_Strategy, R7_Outcome, R7_AffectiveFeedback, R7_CoopExpect,
                  R8_Strategy, R8_Outcome, R8_AffectiveFeedback, R8_CoopExpect, R9_Strategy, R9_Outcome, R9_AffectiveFeedback, R9_CoopExpect,
                  R10_Strategy, R10_Outcome, R10_AffectiveFeedback, R10_CoopExpect, R11_Strategy, R11_Outcome, R11_AffectiveFeedback, R11_CoopExpect,
                  R12_Strategy, R12_Outcome, R12_AffectiveFeedback, R12_CoopExpect, R13_Strategy, R13_Outcome, R13_AffectiveFeedback, R13_CoopExpect,
                  R14_Strategy, R14_Outcome, R14_AffectiveFeedback, R14_CoopExpect, R15_Strategy, R15_Outcome, R15_AffectiveFeedback, R15_CoopExpect,
                  R16_Strategy, R16_Outcome, R16_AffectiveFeedback, R16_CoopExpect, R17_Strategy, R17_Outcome, R17_AffectiveFeedback, R17_CoopExpect,
                  R18_Strategy, R18_Outcome, R18_AffectiveFeedback, R18_CoopExpect, R19_Strategy, R19_Outcome, R19_AffectiveFeedback, R19_CoopExpect,
                  R20_Strategy, R20_Outcome, R20_AffectiveFeedback, IPD_Score, CoopExpect, PPI_1, PPI_2, PPI_3, PPI_4, PPI_5, PPI_6, PPI_7, PPI_8, PPI_9, PPI_10, PPI_11, PPI_12, PPI_13, 
                  PPI_14, PPI_15, PPI_16, PPI_17, PPI_18, PPI_19, PPI_20, PPI_21, PPI_22, PPI_23, PPI_24, PPI_25, PPI_26, PPI_27, PPI_28, PPI_29, PPI_30, PPI_31, PPI_32, 
                  PPI_33, PPI_34, PPI_35, PPI_36, PPI_37, PPI_38, PPI_39, PPI_40, PPIR_ME, PPIR_33, PPIR_67, PPIR_77, PPIR_136, PPIR_154, PPIR_SOI, PPIR_87_r, PPIR_22_r, 
                  PPIR_113_r, PPIR_34,PPIR_46, PPIR_F, PPIR_47_r, PPIR_12, PPIR_115, PPIR_137, PPIR_148, PPIR_RN, PPIR_4, PPIR_36, PPIR_58, PPIR_80, PPIR_149, PPIR_C, PPIR_27_r,
                  PPIR_75_r, PPIR_97_r, PPIR_109_r, PPIR_153_r, PPIR_STI, PPIR_10_r, PPIR_76_r, PPIR_119_r, PPIR_32, PPIR_140, PPIR_CN, PPIR_89_r, PPIR_121_r, PPIR_145_r, PPIR_108_r, 
                  PPIR_130_r, PPIR_BE, PPIR_18, PPIR_19, PPIR_40, PPIR_84, PPIR_122, PPIR_TOTAL, PPIR_SCImp, PPIR_FearDom) 
  assign(paste0("dat_", run_id), df, envir = .GlobalEnv)
}

pattern1 = grep("X", names(.GlobalEnv), value=TRUE)

df.list = do.call("list", mget(pattern1))

df.list.names = names(df.list)

noquote(paste(df.list.names, collapse = ', '))

lapply(list(X35_prolific_s91, X80_prolific_s49, X78_prolific_s54, X47_prolific_s103, X69_prolific_s18, 
            X81_prolific_s48, X83_prolific_s68, X57_prolific_s114, X82_prolific_s59, 
            X68_prolific_s17, X54_prolific_s109, X76_prolific_s51, X107_prolific_s126, X3_prolific_s6, 
            X14_prolific_s29, X70_prolific_s21, X12_prolific_s27, X27_prolific_s72, 
            X33_prolific_s89, X71_prolific_s33, X37_prolific_s93, X13_prolific_s28, 
            X44_prolific_s100, X36_prolific_s92, X17_prolific_s37, X58_prolific_s115, X51_prolific_s105, 
            X64_prolific_s124, X29_prolific_s79, X16_prolific_s34, X28_prolific_s73, X100_prolific_s87, 
            X25_prolific_s67, X1_prolific_s2, X9_prolific_s24, X8_prolific_s16, X97_prolific_s80, 
            X20_prolific_s43, X96_prolific_s77, X45_prolific_s101, X49_prolific_s104, 
            X23_prolific_s60, X55_prolific_s110, X41_prolific_s97, X98_prolific_s81, 
            X61_prolific_s121, X59_prolific_s116, X22_prolific_s57, X6_prolific_s10, 
            X52_prolific_s107, X65_prolific_s125, X105_prolific_s127, X73_prolific_s42, X67_prolific_s4, 
            X93_prolific_s75, X75_prolific_s38, X30_prolific_s83, X92_prolific_s76, 
            X88_prolific_s65, X74_prolific_s36, X94_prolific_s82, X31_prolific_s86, X5_prolific_s8, 
            X95_prolific_s78, X46_prolific_s102, X89_prolific_s69, X56_prolific_s112, X77_prolific_s45, 
            X53_prolific_s108, X43_prolific_s99, X106_prolific_s128, X87_prolific_s64, X84_prolific_s61, 
            X4_prolific_s7, X85_prolific_s63, X103_prolific_s135), cleandf)

pattern2 <- grep("dat", names(.GlobalEnv), value=TRUE)

dat.list <- do.call("list", mget(pattern2))

reshape::merge_all(dat.list)

prolific_dat <- do.call("rbind", dat.list)

rownames(prolific_dat) <- 1:nrow(prolific_dat)

# X63_prolific_s123: missing PPI_12
# X15_prolific_s31: missing PPI_11
# X90_prolific_s71: missing PPI_28
# X7_prolific_s14: missing PPI_27
# X48_prolific_s122: missing PPI_22
# X21_prolific_s46: missing PPI_38
# X102_prolific_s132: missing PPI_21

write.csv(prolific_dat, "prolific_dat.csv")







