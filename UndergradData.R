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

setwd("/Users/carolinelee/Desktop/Honors/Undergrad/Data_AC_Y/Data_AC_Y_PPI_Y")

#####

temp = list.files(pattern="*.csv")
list2env(
  lapply(setNames(temp, make.names(gsub("*.csv$", "", temp))), 
         read.csv), envir = .GlobalEnv)

cleandf = function(x){
  run_id = x[1, "run_id"]
  sample = "Undergrad"
  condition = as.character(x[1, "condition"])
  assigned_userid = str_sub(as.character(x[6, "response"]), 8, -3)
  created_userid = str_sub(as.character(x[7, "response"]), 8, -3)
  prolific_id = NA 
  age = str_sub(as.character(x[8, "response"]), 9, -3)
  age = as.numeric(age)
  gender = as.character(x[9, "response"])
  gender = str_extract_all(gender, "(?<=\\[).+?(?=\\])")[[1]]
  gender = gsub("[^A-Za-z0-9 ]"," ", gender)
  race_ethnicity = as.character(x[10, "response"])
  race_ethnicity = str_extract_all(race_ethnicity, "(?<=\\[).+?(?=\\])")[[1]]
  race_ethnicity = gsub("[^A-Za-z0-9 ]"," ", race_ethnicity)
  SAM_valence_pre = as.numeric(as.character(x[12, "response"]))
  SAM_arousal_pre = as.numeric(as.character(x[13, "response"]))
  SAM_valence_post = as.numeric(as.character(x[15, "response"]))
  SAM_arousal_post = as.numeric(as.character(x[16, "response"]))
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
  
  ##### ARHAP2 #####
  
  ARHAP2_Answer = x[which(grepl("ARHAP2", x$stimulus)), "response"] 
  
  ARHAP2_Answer = droplevels.factor(ARHAP2_Answer)
  
  ARHAP2_Answer = unfactor(ARHAP2_Answer)
  
  ARHAP2_Correct = ARHAP2_Answer == 3
  
  ARHAP2_Answer = ifelse(ARHAP2_Answer == 0, "ANG",
                          ifelse(ARHAP2_Answer == 1, "DIS",
                                 ifelse(ARHAP2_Answer == 2, "FEA",
                                        ifelse(ARHAP2_Answer == 3, "HAP",
                                               ifelse(ARHAP2_Answer == 4, "SAD", "SUR")))))
  
  ##### ARSAD3 #####
  
  ARSAD3_Answer = x[which(grepl("ARSAD3", x$stimulus)), "response"] 
  
  ARSAD3_Answer = droplevels.factor(ARSAD3_Answer)
  
  ARSAD3_Answer = unfactor(ARSAD3_Answer)
  
  ARSAD3_Correct = ARSAD3_Answer == 4
  
  ARSAD3_Answer = ifelse(ARSAD3_Answer == 0, "ANG",
                          ifelse(ARSAD3_Answer == 1, "DIS",
                                 ifelse(ARSAD3_Answer == 2, "FEA",
                                        ifelse(ARSAD3_Answer == 3, "HAP",
                                               ifelse(ARSAD3_Answer == 4, "SAD", "SUR")))))
  
  ##### ARSUR2 #####
  
  ARSUR2_Answer = x[which(grepl("ARSUR2", x$stimulus)), "response"] 
  
  ARSUR2_Answer = droplevels.factor(ARSUR2_Answer)
  
  ARSUR2_Answer = unfactor(ARSUR2_Answer)
  
  ARSUR2_Correct = ARSUR2_Answer == 5
  
  ARSUR2_Answer = ifelse(ARSUR2_Answer == 0, "ANG",
                          ifelse(ARSUR2_Answer == 1, "DIS",
                                 ifelse(ARSUR2_Answer == 2, "FEA",
                                        ifelse(ARSUR2_Answer == 3, "HAP",
                                               ifelse(ARSUR2_Answer == 4, "SAD", "SUR")))))
  
  ##### EBANG1 #####
  
  EBANG1_Answer = x[which(grepl("EBANG1", x$stimulus)), "response"]  
  
  EBANG1_Answer = droplevels.factor(EBANG1_Answer)
  
  EBANG1_Answer = unfactor(EBANG1_Answer)
  
  EBANG1_Correct = EBANG1_Answer == 0
  
  EBANG1_Answer = ifelse(EBANG1_Answer == 0, "ANG",
                          ifelse(EBANG1_Answer == 1, "DIS",
                                 ifelse(EBANG1_Answer == 2, "FEA",
                                        ifelse(EBANG1_Answer == 3, "HAP",
                                               ifelse(EBANG1_Answer == 4, "SAD", "SUR")))))
  
  ##### EBDIS2 #####
  
  EBDIS2_Answer = x[which(grepl("EBDIS2", x$stimulus)), "response"] 
  
  EBDIS2_Answer = droplevels.factor(EBDIS2_Answer)
  
  EBDIS2_Answer = unfactor(EBDIS2_Answer)
  
  EBDIS2_Correct = EBDIS2_Answer == 1
  
  EBDIS2_Answer = ifelse(EBDIS2_Answer == 0, "ANG",
                          ifelse(EBDIS2_Answer == 1, "DIS",
                                 ifelse(EBDIS2_Answer == 2, "FEA",
                                        ifelse(EBDIS2_Answer == 3, "HAP",
                                               ifelse(EBDIS2_Answer == 4, "SAD", "SUR")))))
  
  ##### EBFEA3 #####
  
  EBFEA3_Answer = x[which(grepl("EBFEA3", x$stimulus)), "response"] 
  
  EBFEA3_Answer = droplevels.factor(EBFEA3_Answer)
  
  EBFEA3_Answer = unfactor(EBFEA3_Answer)
  
  EBFEA3_Correct = EBFEA3_Answer == 2
  
  EBFEA3_Answer = ifelse(EBFEA3_Answer == 0, "ANG",
                          ifelse(EBFEA3_Answer == 1, "DIS",
                                 ifelse(EBFEA3_Answer == 2, "FEA",
                                        ifelse(EBFEA3_Answer == 3, "HAP",
                                               ifelse(EBFEA3_Answer == 4, "SAD", "SUR")))))
  
  ##### EBHAP3 #####
  
  EBHAP3_Answer = x[which(grepl("EBHAP3", x$stimulus)), "response"] 
  
  EBHAP3_Answer = droplevels.factor(EBHAP3_Answer)
  
  EBHAP3_Answer = unfactor(EBHAP3_Answer)
  
  EBHAP3_Correct = EBHAP3_Answer == 3
  
  EBHAP3_Answer = ifelse(EBHAP3_Answer == 0, "ANG",
                          ifelse(EBHAP3_Answer == 1, "DIS",
                                 ifelse(EBHAP3_Answer == 2, "FEA",
                                        ifelse(EBHAP3_Answer == 3, "HAP",
                                               ifelse(EBHAP3_Answer == 4, "SAD", "SUR")))))
  
  ##### EBSAD3 #####
  
  EBSAD3_Answer = x[which(grepl("EBSAD3", x$stimulus)), "response"] 
  
  EBSAD3_Answer = droplevels.factor(EBSAD3_Answer)
  
  EBSAD3_Answer = unfactor(EBSAD3_Answer)
  
  EBSAD3_Correct = EBSAD3_Answer == 4
  
  EBSAD3_Answer = ifelse(EBSAD3_Answer == 0, "ANG",
                          ifelse(EBSAD3_Answer == 1, "DIS",
                                 ifelse(EBSAD3_Answer == 2, "FEA",
                                        ifelse(EBSAD3_Answer == 3, "HAP",
                                               ifelse(EBSAD3_Answer == 4, "SAD", "SUR")))))
  
  ##### EBSUR3 #####
  
  EBSUR3_Answer = x[which(grepl("EBSUR3", x$stimulus)), "response"] 
  
  EBSUR3_Answer = droplevels.factor(EBSUR3_Answer)
  
  EBSUR3_Answer = unfactor(EBSUR3_Answer)
  
  EBSUR3_Correct = EBSUR3_Answer == 5
  
  EBSUR3_Answer = ifelse(EBSUR3_Answer == 0, "ANG",
                          ifelse(EBSUR3_Answer == 1, "DIS",
                                 ifelse(EBSUR3_Answer == 2, "FEA",
                                        ifelse(EBSUR3_Answer == 3, "HAP",
                                               ifelse(EBSUR3_Answer == 4, "SAD", "SUR")))))
  
  ##### FFANG3 #####
  
  FFANG3_Answer = x[which(grepl("FFANG3", x$stimulus)), "response"]  
  
  FFANG3_Answer = droplevels.factor(FFANG3_Answer)
  
  FFANG3_Answer = unfactor(FFANG3_Answer)
  
  FFANG3_Correct = FFANG3_Answer == 0
  
  FFANG3_Answer = ifelse(FFANG3_Answer == 0, "ANG",
                          ifelse(FFANG3_Answer == 1, "DIS",
                                 ifelse(FFANG3_Answer == 2, "FEA",
                                        ifelse(FFANG3_Answer == 3, "HAP",
                                               ifelse(FFANG3_Answer == 4, "SAD", "SUR")))))
  
  ##### FFDIS2 #####
  
  FFDIS2_Answer = x[which(grepl("FFDIS2", x$stimulus)), "response"] 
  
  FFDIS2_Answer = droplevels.factor(FFDIS2_Answer)
  
  FFDIS2_Answer = unfactor(FFDIS2_Answer)
  
  FFDIS2_Correct = FFDIS2_Answer == 1
  
  FFDIS2_Answer = ifelse(FFDIS2_Answer == 0, "ANG",
                          ifelse(FFDIS2_Answer == 1, "DIS",
                                 ifelse(FFDIS2_Answer == 2, "FEA",
                                        ifelse(FFDIS2_Answer == 3, "HAP",
                                               ifelse(FFDIS2_Answer == 4, "SAD", "SUR")))))
  
  ##### FFFEA2 #####
  
  FFFEA2_Answer = x[which(grepl("FFFEA2", x$stimulus)), "response"] 
  
  FFFEA2_Answer = droplevels.factor(FFFEA2_Answer)
  
  FFFEA2_Answer = unfactor(FFFEA2_Answer)
  
  FFFEA2_Correct = FFFEA2_Answer == 2
  
  FFFEA2_Answer = ifelse(FFFEA2_Answer == 0, "ANG",
                          ifelse(FFFEA2_Answer == 1, "DIS",
                                 ifelse(FFFEA2_Answer == 2, "FEA",
                                        ifelse(FFFEA2_Answer == 3, "HAP",
                                               ifelse(FFFEA2_Answer == 4, "SAD", "SUR")))))
  
  ##### FFHAP3 #####
  
  FFHAP3_Answer = x[which(grepl("FFHAP3", x$stimulus)), "response"] 
  
  FFHAP3_Answer = droplevels.factor(FFHAP3_Answer)
  
  FFHAP3_Answer = unfactor(FFHAP3_Answer)
  
  FFHAP3_Correct = FFHAP3_Answer == 3
  
  FFHAP3_Answer = ifelse(FFHAP3_Answer == 0, "ANG",
                          ifelse(FFHAP3_Answer == 1, "DIS",
                                 ifelse(FFHAP3_Answer == 2, "FEA",
                                        ifelse(FFHAP3_Answer == 3, "HAP",
                                               ifelse(FFHAP3_Answer == 4, "SAD", "SUR")))))
  
  ##### FFSAD1 #####
  
  FFSAD1_Answer = x[which(grepl("FFSAD1", x$stimulus)), "response"] 
  
  FFSAD1_Answer = droplevels.factor(FFSAD1_Answer)
  
  FFSAD1_Answer = unfactor(FFSAD1_Answer)
  
  FFSAD1_Correct = FFSAD1_Answer == 4
  
  FFSAD1_Answer = ifelse(FFSAD1_Answer == 0, "ANG",
                          ifelse(FFSAD1_Answer == 1, "DIS",
                                 ifelse(FFSAD1_Answer == 2, "FEA",
                                        ifelse(FFSAD1_Answer == 3, "HAP",
                                               ifelse(FFSAD1_Answer == 4, "SAD", "SUR")))))
  
  ##### FFSUR2 #####
  
  FFSUR2_Answer = x[which(grepl("FFSUR2", x$stimulus)), "response"] 
  
  FFSUR2_Answer = droplevels.factor(FFSUR2_Answer)
  
  FFSUR2_Answer = unfactor(FFSUR2_Answer)
  
  FFSUR2_Correct = FFSUR2_Answer == 5
  
  FFSUR2_Answer = ifelse(FFSUR2_Answer == 0, "ANG",
                          ifelse(FFSUR2_Answer == 1, "DIS",
                                 ifelse(FFSUR2_Answer == 2, "FEA",
                                        ifelse(FFSUR2_Answer == 3, "HAP",
                                               ifelse(FFSUR2_Answer == 4, "SAD", "SUR")))))
  
  ##### FGANG2 #####
  
  FGANG2_Answer = x[which(grepl("FGANG2", x$stimulus)), "response"]  
  
  FGANG2_Answer = droplevels.factor(FGANG2_Answer)
  
  FGANG2_Answer = unfactor(FGANG2_Answer)
  
  FGANG2_Correct = FGANG2_Answer == 0
  
  FGANG2_Answer = ifelse(FGANG2_Answer == 0, "ANG",
                          ifelse(FGANG2_Answer == 1, "DIS",
                                 ifelse(FGANG2_Answer == 2, "FEA",
                                        ifelse(FGANG2_Answer == 3, "HAP",
                                               ifelse(FGANG2_Answer == 4, "SAD", "SUR")))))
  
  ##### FGDIS2 #####
  
  FGDIS2_Answer = x[which(grepl("FGDIS2", x$stimulus)), "response"] 
  
  FGDIS2_Answer = droplevels.factor(FGDIS2_Answer)
  
  FGDIS2_Answer = unfactor(FGDIS2_Answer)
  
  FGDIS2_Correct = FGDIS2_Answer == 1
  
  FGDIS2_Answer = ifelse(FGDIS2_Answer == 0, "ANG",
                          ifelse(FGDIS2_Answer == 1, "DIS",
                                 ifelse(FGDIS2_Answer == 2, "FEA",
                                        ifelse(FGDIS2_Answer == 3, "HAP",
                                               ifelse(FGDIS2_Answer == 4, "SAD", "SUR")))))
  
  ##### FGFEA2 #####
  
  FGFEA2_Answer = x[which(grepl("FGFEA2", x$stimulus)), "response"] 
  
  FGFEA2_Answer = droplevels.factor(FGFEA2_Answer)
  
  FGFEA2_Answer = unfactor(FGFEA2_Answer)
  
  FGFEA2_Correct = FGFEA2_Answer == 2
  
  FGFEA2_Answer = ifelse(FGFEA2_Answer == 0, "ANG",
                          ifelse(FGFEA2_Answer == 1, "DIS",
                                 ifelse(FGFEA2_Answer == 2, "FEA",
                                        ifelse(FGFEA2_Answer == 3, "HAP",
                                               ifelse(FGFEA2_Answer == 4, "SAD", "SUR")))))
  
  ##### FGHAP3 #####
  
  FGHAP3_Answer = x[which(grepl("FGHAP3", x$stimulus)), "response"] 
  
  FGHAP3_Answer = droplevels.factor(FGHAP3_Answer)
  
  FGHAP3_Answer = unfactor(FGHAP3_Answer)
  
  FGHAP3_Correct = FFHAP3_Answer == 3
  
  FGHAP3_Answer = ifelse(FGHAP3_Answer == 0, "ANG",
                          ifelse(FGHAP3_Answer == 1, "DIS",
                                 ifelse(FGHAP3_Answer == 2, "FEA",
                                        ifelse(FGHAP3_Answer == 3, "HAP",
                                               ifelse(FGHAP3_Answer == 4, "SAD", "SUR")))))
  
  ##### FGSAD1 #####
  
  FGSAD1_Answer = x[which(grepl("FGSAD1", x$stimulus)), "response"] 
  
  FGSAD1_Answer = droplevels.factor(FGSAD1_Answer)
  
  FGSAD1_Answer = unfactor(FGSAD1_Answer)
  
  FGSAD1_Correct = FGSAD1_Answer == 4
  
  FGSAD1_Answer = ifelse(FGSAD1_Answer == 0, "ANG",
                          ifelse(FGSAD1_Answer == 1, "DIS",
                                 ifelse(FGSAD1_Answer == 2, "FEA",
                                        ifelse(FGSAD1_Answer == 3, "HAP",
                                               ifelse(FGSAD1_Answer == 4, "SAD", "SUR")))))
  
  ##### FGSUR3 #####
  
  FGSUR3_Answer = x[which(grepl("FGSUR3", x$stimulus)), "response"] 
  
  FGSUR3_Answer = droplevels.factor(FGSUR3_Answer)
  
  FGSUR3_Answer = unfactor(FGSUR3_Answer)
  
  FGSUR3_Correct = FGSUR3_Answer == 5
  
  FGSUR3_Answer = ifelse(FGSUR3_Answer == 0, "ANG",
                          ifelse(FGSUR3_Answer == 1, "DIS",
                                 ifelse(FGSUR3_Answer == 2, "FEA",
                                        ifelse(FGSUR3_Answer == 3, "HAP",
                                               ifelse(FGSUR3_Answer == 4, "SAD", "SUR")))))
  
  ##### LDANG3 #####
  
  LDANG3_Answer = x[which(grepl("LDANG3", x$stimulus)), "response"]  
  
  LDANG3_Answer = droplevels.factor(LDANG3_Answer)
  
  LDANG3_Answer = unfactor(LDANG3_Answer)
  
  LDANG3_Correct = LDANG3_Answer == 0
  
  LDANG3_Answer = ifelse(LDANG3_Answer == 0, "ANG", 
                          ifelse(LDANG3_Answer == 1, "DIS",
                                 ifelse(LDANG3_Answer == 2, "FEA",
                                        ifelse(LDANG3_Answer == 3, "HAP",
                                               ifelse(LDANG3_Answer == 4, "SAD", "SUR")))))
  
  ##### LDDIS3 #####
  
  LDDIS3_Answer = x[which(grepl("LDDIS3", x$stimulus)), "response"] 
  
  LDDIS3_Answer = droplevels.factor(LDDIS3_Answer)
  
  LDDIS3_Answer = unfactor(LDDIS3_Answer)
  
  LDDIS3_Correct = LDDIS3_Answer == 1
  
  LDDIS3_Answer = ifelse(LDDIS3_Answer == 0, "ANG",
                          ifelse(LDDIS3_Answer == 1, "DIS",
                                 ifelse(LDDIS3_Answer == 2, "FEA",
                                        ifelse(LDDIS3_Answer == 3, "HAP",
                                               ifelse(LDDIS3_Answer == 4, "SAD", "SUR")))))
  
  ##### LDFEA3 #####
  
  LDFEA3_Answer = x[which(grepl("LDFEA3", x$stimulus)), "response"] 
  
  LDFEA3_Answer = droplevels.factor(LDFEA3_Answer)
  
  LDFEA3_Answer = unfactor(LDFEA3_Answer)
  
  LDFEA3_Correct = LDFEA3_Answer == 2
  
  LDFEA3_Answer = ifelse(LDFEA3_Answer == 0, "ANG",
                          ifelse(LDFEA3_Answer == 1, "DIS",
                                 ifelse(LDFEA3_Answer == 2, "FEA",
                                        ifelse(LDFEA3_Answer == 3, "HAP",
                                               ifelse(LDFEA3_Answer == 4, "SAD", "SUR")))))
  
  ##### LDHAP2 #####
  
  LDHAP2_Answer = x[which(grepl("LDHAP2", x$stimulus)), "response"] 
  
  LDHAP2_Answer = droplevels.factor(LDHAP2_Answer)
  
  LDHAP2_Answer = unfactor(LDHAP2_Answer)
  
  LDHAP2_Correct = LDHAP2_Answer == 3
  
  LDHAP2_Answer = ifelse(LDHAP2_Answer == 0, "ANG",
                          ifelse(LDHAP2_Answer == 1, "DIS",
                                 ifelse(LDHAP2_Answer == 2, "FEA",
                                        ifelse(LDHAP2_Answer == 3, "HAP",
                                               ifelse(LDHAP2_Answer == 4, "SAD", "SUR")))))
  
  ##### LDSAD3 #####
  
  LDSAD3_Answer = x[which(grepl("LDSAD", x$stimulus)), "response"] 
  
  LDSAD3_Answer = droplevels.factor(LDSAD3_Answer)
  
  LDSAD3_Answer = unfactor(LDSAD3_Answer)
  
  LDSAD3_Correct = LDSAD3_Answer == 4
  
  LDSAD3_Answer = ifelse(LDSAD3_Answer == 0, "ANG",
                          ifelse(LDSAD3_Answer == 1, "DIS",
                                 ifelse(LDSAD3_Answer == 2, "FEA",
                                        ifelse(LDSAD3_Answer == 3, "HAP",
                                               ifelse(LDSAD3_Answer == 4, "SAD", "SUR")))))
  
  ##### LDSUR2 #####
  
  LDSUR2_Answer = x[which(grepl("LDSUR2", x$stimulus)), "response"] 
  
  LDSUR2_Answer = droplevels.factor(LDSUR2_Answer)
  
  LDSUR2_Answer = unfactor(LDSUR2_Answer)
  
  LDSUR2_Correct = LDSUR2_Answer == 5
  
  LDSUR2_Answer = ifelse(LDSUR2_Answer == 0, "ANG",
                          ifelse(LDSUR2_Answer == 1, "DIS",
                                 ifelse(LDSUR2_Answer == 2, "FEA",
                                        ifelse(LDSUR2_Answer == 3, "HAP",
                                               ifelse(LDSUR2_Answer == 4, "SAD", "SUR")))))
  
  ##### MGANG1 #####
  
  MGANG1_Answer = x[which(grepl("MGANG1", x$stimulus)), "response"] 
  
  MGANG1_Answer = droplevels.factor(MGANG1_Answer)
  
  MGANG1_Answer = unfactor(MGANG1_Answer)
  
  MGANG1_Correct = MGANG1_Answer == 0
  
  MGANG1_Answer = ifelse(MGANG1_Answer == 0, "ANG",
                          ifelse(MGANG1_Answer == 1, "DIS",
                                 ifelse(MGANG1_Answer == 2, "FEA",
                                        ifelse(MGANG1_Answer == 3, "HAP",
                                               ifelse(MGANG1_Answer == 4, "SAD", "SUR")))))
  
  ##### MGDIS2 #####
  
  MGDIS2_Answer = x[which(grepl("MGDIS2", x$stimulus)), "response"] 
  
  MGDIS2_Answer = droplevels.factor(MGDIS2_Answer)
  
  MGDIS2_Answer = unfactor(MGDIS2_Answer)
  
  MGDIS2_Correct = MGDIS2_Answer == 1
  
  MGDIS2_Answer = ifelse(MGDIS2_Answer == 0, "ANG",
                          ifelse(MGDIS2_Answer == 1, "DIS",
                                 ifelse(MGDIS2_Answer == 2, "FEA",
                                        ifelse(MGDIS2_Answer == 3, "HAP",
                                               ifelse(MGDIS2_Answer == 4, "SAD", "SUR")))))
  
  ##### MGFEA3 #####
  
  MGFEA3_Answer = x[which(grepl("MGFEA3", x$stimulus)), "response"] 
  
  MGFEA3_Answer = droplevels.factor(MGFEA3_Answer)
  
  MGFEA3_Answer = unfactor(MGFEA3_Answer)
  
  MGFEA3_Correct = MGFEA3_Answer == 2
  
  MGFEA3_Answer = ifelse(MGFEA3_Answer == 0, "ANG",
                          ifelse(MGFEA3_Answer == 1, "DIS",
                                 ifelse(MGFEA3_Answer == 2, "FEA",
                                        ifelse(MGFEA3_Answer == 3, "HAP",
                                               ifelse(MGFEA3_Answer == 4, "SAD", "SUR")))))
  
  ##### MGHAP3 #####
  
  MGHAP3_Answer = x[which(grepl("MGHAP3", x$stimulus)), "response"] 
  
  MGHAP3_Answer = droplevels.factor(MGHAP3_Answer)
  
  MGHAP3_Answer = unfactor(MGHAP3_Answer)
  
  MGHAP3_Correct = MGHAP3_Answer == 3
  
  MGHAP3_Answer = ifelse(MGHAP3_Answer == 0, "ANG",
                          ifelse(MGHAP3_Answer == 1, "DIS",
                                 ifelse(MGHAP3_Answer == 2, "FEA",
                                        ifelse(MGHAP3_Answer == 3, "HAP",
                                               ifelse(MGHAP3_Answer == 4, "SAD", "SUR")))))
  
  ##### MGSAD2 #####
  
  MGSAD2_Answer = x[which(grepl("MGSAD2", x$stimulus)), "response"] 
  
  MGSAD2_Answer = droplevels.factor(MGSAD2_Answer)
  
  MGSAD2_Answer = unfactor(MGSAD2_Answer)
  
  MGSAD2_Correct = MGSAD2_Answer == 4
  
  MGSAD2_Answer = ifelse(MGSAD2_Answer == 0, "ANG",
                          ifelse(MGSAD2_Answer == 1, "DIS",
                                 ifelse(MGSAD2_Answer == 2, "FEA",
                                        ifelse(MGSAD2_Answer == 3, "HAP",
                                               ifelse(MGSAD2_Answer == 4, "SAD", "SUR")))))
  
  ##### MGSUR1 #####
  
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
  
  FERT_CorrectEstimate = as.numeric(as.character(x[54, "response"])) / 100
  
  # ===================================== Attention Check
  
  attention_check = as.numeric(as.character(x[58, "response"]))
  
  attention_check = ifelse(attention_check == 2, TRUE, FALSE)
  
  # ===================================== Iterated Prisoner's Dilemma 
  
  # Round 1 
  
  R1_Strategy = ifelse(as.character(x[65, "response"]) == "g", "Cooperate", "Defect")
  
  R1_Outcome = as.character(x[69, "stimulus"])
  
  R1_Outcome = toupper(str_sub(R1_Outcome, 62, -33))
  
  R1_AffectiveFeedback = as.numeric(as.character(x[69, "response"]))
  
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
  
  R1_CoopExpect = as.numeric(as.character(x[71, "response"])) / 100
  
  # Round 2 
  
  R2_Strategy = ifelse(as.character(x[72, "response"]) == "g", "Cooperate", "Defect")
  
  R2_Outcome = as.character(x[75, "stimulus"])
  
  R2_Outcome = toupper(str_sub(R2_Outcome, 62, -33))
  
  R2_AffectiveFeedback = as.numeric(as.character(x[75, "response"]))
  
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
  
  R2_CoopExpect = as.numeric(as.character(x[77, "response"])) / 100
  
  # Round 3
  
  R3_Strategy = ifelse(as.character(x[78, "response"]) == "g", "Cooperate", "Defect")
  
  R3_Outcome = as.character(x[81, "stimulus"])
  
  R3_Outcome = toupper(str_sub(R3_Outcome, 62, -33))
  
  R3_AffectiveFeedback = as.numeric(as.character(x[81, "response"]))
  
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
  
  R3_CoopExpect = as.numeric(as.character(x[83, "response"])) / 100
  
  # Round 4
  
  R4_Strategy = ifelse(as.character(x[84, "response"]) == "g", "Cooperate", "Defect")
  
  R4_Outcome = as.character(x[87, "stimulus"])
  
  R4_Outcome = toupper(str_sub(R4_Outcome, 62, -33))
  
  R4_AffectiveFeedback = as.numeric(as.character(x[87, "response"]))
  
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
  
  R4_CoopExpect = as.numeric(as.character(x[89, "response"])) / 100
  
  # Round 5 
  
  R5_Strategy = ifelse(as.character(x[90, "response"]) == "g", "Cooperate", "Defect")
  
  R5_Outcome = as.character(x[93, "stimulus"])
  
  R5_Outcome = toupper(str_sub(R5_Outcome, 62, -33))
  
  R5_AffectiveFeedback = as.numeric(as.character(x[93, "response"]))
  
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
  
  R5_CoopExpect = as.numeric(as.character(x[95, "response"])) / 100
  
  # Round 6
  
  R6_Strategy = ifelse(as.character(x[96, "response"]) == "g", "Cooperate", "Defect")
  
  R6_Outcome = as.character(x[99, "stimulus"])
  
  R6_Outcome = toupper(str_sub(R6_Outcome, 62, -33))
  
  R6_AffectiveFeedback = as.numeric(as.character(x[99, "response"]))
  
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
  
  R6_CoopExpect = as.numeric(as.character(x[101, "response"])) / 100
  
  # Round 7 
  
  R7_Strategy = ifelse(as.character(x[102, "response"]) == "g", "Cooperate", "Defect")
  
  R7_Outcome = as.character(x[105, "stimulus"])
  
  R7_Outcome = toupper(str_sub(R7_Outcome, 62, -33))
  
  R7_AffectiveFeedback = as.numeric(as.character(x[105, "response"]))
  
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
  
  R7_CoopExpect = as.numeric(as.character(x[107, "response"])) / 100
  
  # Round 8 
  
  R8_Strategy = ifelse(as.character(x[108, "response"]) == "g", "Cooperate", "Defect")
  
  R8_Outcome = as.character(x[111, "stimulus"])
  
  R8_Outcome = toupper(str_sub(R8_Outcome, 62, -33))
  
  R8_AffectiveFeedback = as.numeric(as.character(x[111, "response"]))
  
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
  
  R8_CoopExpect = as.numeric(as.character(x[113, "response"])) / 100
  
  # Round 9 
  
  R9_Strategy = ifelse(as.character(x[114, "response"]) == "g", "Cooperate", "Defect")
  
  R9_Outcome = as.character(x[117, "stimulus"])
  
  R9_Outcome = toupper(str_sub(R9_Outcome, 62, -33))
  
  R9_AffectiveFeedback = as.numeric(as.character(x[117, "response"]))
  
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
  
  R9_CoopExpect = as.numeric(as.character(x[119, "response"])) / 100
  
  # Round 10 
  
  R10_Strategy = ifelse(as.character(x[120, "response"]) == "g", "Cooperate", "Defect")
  
  R10_Outcome = as.character(x[123, "stimulus"])
  
  R10_Outcome = toupper(str_sub(R10_Outcome, 62, -33))
  
  R10_AffectiveFeedback = as.numeric(as.character(x[123, "response"]))
  
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
  
  R10_CoopExpect = as.numeric(as.character(x[125, "response"])) / 100
  
  # Round 11 
  
  R11_Strategy = ifelse(as.character(x[126, "response"]) == "g", "Cooperate", "Defect")
  
  R11_Outcome = as.character(x[129, "stimulus"])
  
  R11_Outcome = toupper(str_sub(R11_Outcome, 62, -33))
  
  R11_AffectiveFeedback = as.numeric(as.character(x[129, "response"]))
  
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
  
  R11_CoopExpect = as.numeric(as.character(x[131, "response"])) / 100
  
  # Round 12
  
  R12_Strategy = ifelse(as.character(x[132, "response"]) == "g", "Cooperate", "Defect")
  
  R12_Outcome = as.character(x[135, "stimulus"])
  
  R12_Outcome = toupper(str_sub(R12_Outcome, 62, -33))
  
  R12_AffectiveFeedback = as.numeric(as.character(x[135, "response"]))
  
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
  
  R12_CoopExpect = as.numeric(as.character(x[137, "response"])) / 100
  
  # Round 13
  
  R13_Strategy = ifelse(as.character(x[138, "response"]) == "g", "Cooperate", "Defect")
  
  R13_Outcome = as.character(x[141, "stimulus"])
  
  R13_Outcome = toupper(str_sub(R13_Outcome, 62, -33))
  
  R13_AffectiveFeedback = as.numeric(as.character(x[141, "response"]))
  
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
  
  R13_CoopExpect = as.numeric(as.character(x[143, "response"])) / 100
  
  # Round 14
  
  R14_Strategy = ifelse(as.character(x[144, "response"]) == "g", "Cooperate", "Defect")
  
  R14_Outcome = as.character(x[147, "stimulus"])
  
  R14_Outcome = toupper(str_sub(R14_Outcome, 62, -33))
  
  R14_AffectiveFeedback = as.numeric(as.character(x[147, "response"]))
  
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
  
  R14_CoopExpect = as.numeric(as.character(x[149, "response"])) / 100
  
  # Round 15
  
  R15_Strategy = ifelse(as.character(x[150, "response"]) == "g", "Cooperate", "Defect")
  
  R15_Outcome = as.character(x[153, "stimulus"])
  
  R15_Outcome = toupper(str_sub(R15_Outcome, 62, -33))
  
  R15_AffectiveFeedback = as.numeric(as.character(x[153, "response"]))
  
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
  
  R15_CoopExpect = as.numeric(as.character(x[155, "response"])) / 100
  
  # Round 16
  
  R16_Strategy = ifelse(as.character(x[156, "response"]) == "g", "Cooperate", "Defect")
  
  R16_Outcome = as.character(x[159, "stimulus"])
  
  R16_Outcome = toupper(str_sub(R16_Outcome, 62, -33))
  
  R16_AffectiveFeedback = as.numeric(as.character(x[159, "response"]))
  
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
  
  R16_CoopExpect = as.numeric(as.character(x[161, "response"])) / 100
  
  # Round 17 
  
  R17_Strategy = ifelse(as.character(x[162, "response"]) == "g", "Cooperate", "Defect")
  
  R17_Outcome = as.character(x[165, "stimulus"])
  
  R17_Outcome = toupper(str_sub(R17_Outcome, 62, -33))
  
  R17_AffectiveFeedback = as.numeric(as.character(x[165, "response"]))
  
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
  
  R17_CoopExpect = as.numeric(as.character(x[167, "response"])) / 100
  
  # Round 18 
  
  R18_Strategy = ifelse(as.character(x[168, "response"]) == "g", "Cooperate", "Defect")
  
  R18_Outcome = as.character(x[171, "stimulus"])
  
  R18_Outcome = toupper(str_sub(R18_Outcome, 62, -33))
  
  R18_AffectiveFeedback = as.numeric(as.character(x[171, "response"]))
  
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
  
  R18_CoopExpect = as.numeric(as.character(x[173, "response"])) / 100
  
  # Round 19
  
  R19_Strategy = ifelse(as.character(x[174, "response"]) == "g", "Cooperate", "Defect")
  
  R19_Outcome = as.character(x[177, "stimulus"])
  
  R19_Outcome = toupper(str_sub(R19_Outcome, 62, -33))
  
  R19_AffectiveFeedback = as.numeric(as.character(x[177, "response"]))
  
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
  
  R19_CoopExpect = as.numeric(as.character(x[179, "response"])) / 100
  
  # Round 20 
  
  R20_Strategy = ifelse(as.character(x[180, "response"]) == "g", "Cooperate", "Defect")
  
  R20_Outcome = as.character(x[183, "stimulus"])
  
  R20_Outcome = toupper(str_sub(R20_Outcome, 62, -33))
  
  R20_AffectiveFeedback = as.numeric(as.character(x[183, "response"]))
  
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
  
  # Overall 
  
  a = c(R1_Strategy, R2_Strategy, R3_Strategy, R4_Strategy, R5_Strategy, R6_Strategy, R7_Strategy, 
         R8_Strategy, R9_Strategy, R10_Strategy, R11_Strategy, R12_Strategy, R13_Strategy, R14_Strategy, 
         R15_Strategy, R16_Strategy, R17_Strategy, R18_Strategy, R19_Strategy, R20_Strategy)
  
  b = rep("Cooperate", 20)
  
  IPD_Score = sum(a %in% b) / 20
  
  CoopExpect = (R1_CoopExpect + R2_CoopExpect + R3_CoopExpect + R4_CoopExpect + R5_CoopExpect +
                  R6_CoopExpect + R7_CoopExpect + R8_CoopExpect + R9_CoopExpect + R10_CoopExpect + 
                  R11_CoopExpect + R12_CoopExpect + R13_CoopExpect + R14_CoopExpect + R15_CoopExpect + 
                  R16_CoopExpect + R17_CoopExpect + R18_CoopExpect + R19_CoopExpect) / 19
  
  # ===================================== PPI-R-40
  
  PPI = as.character(x[185, "response"])
  
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
  
  # PPI 1 
  
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
  
  # PPI 2
  
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
  
  # PPI 3 
  
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
  
  # PPI 4 
  
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
  
  # PPI 5 
  
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
  
  # PPI 6 
  
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
  
  # PPI 7 
  
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
  
  # PPI 8 
  
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
  
  # PPI 9
  
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
  
  # PPI 10 
  
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
  
  # PPI 11 
  
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
  
  # PPI 12
  
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
  
  # PPI 13 
  
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
  
  # PPI 14
  
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
  
  # PPI 15
  
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
  
  # PPI 16
  
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
  
  # PPI 17
  
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
  
  # PPI 18
  
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
  
  # PPI 19
  
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
  
  # PPI 20 
  
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
  
  # PPI 21
  
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
  
  # PPI 22
  
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
  
  # PPI 23
  
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
  
  # PPI 24
  
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
  
  # PPI 25
  
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
  
  # PPI 26
  
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
  
  # PPI 27 
  
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
  
  # PPI 28 
  
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
  
  # PPI 29 
  
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
  
  # PPI 30
  
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
  
  # PPI 31
  
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
  
  # PPI 32
  
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
  
  # PPI 33
  
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
  
  # PPI 34
  
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
  
  # PPI 35
  
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
  
  # PPI 36
  
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
  
  # PPI 37 
  
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
  
  # PPI 38
  
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
  
  # PPI 39 
  
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
  
  # PPI 40
  
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
  
  # PPI scoring 
  
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
                  SAM_valence_post, SAM_arousal_post, FERT_Score, FERT_Score_2, FERT_CorrectEstimate, FERT_Anger, FERT_Disgust, FERT_Fear, FERT_Happiness, FERT_Sadness, 
                  FERT_Surprise, attention_check, R1_Strategy, R1_Outcome, R1_AffectiveFeedback, R1_CoopExpect, 
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

lapply(list(X118_undergrad_s194, X68_undergrad_s89, X161_undergrad_s277, X50_undergrad_s157, X127_undergrad_s186, X94_undergrad_s145, X136_undergrad_s206, X174_undergrad_s373, 
            X140_undergrad_s220, X100_undergrad_s142, X98_undergrad_s138, X89_undergrad_s130, X87_undergrad_s139, X9_undergrad_s328, X74_undergrad_s98, X148_undergrad_s242, 
            X182_undergrad_s336, X153_undergrad_s247, X7_undergrad_s51, X8_undergrad_s26, X180_undergrad_s320, X85_undergrad_s153, X32_undergrad_s173, X138_undergrad_s209, 
            X172_undergrad_s368, X14_undergrad_s52, X112_undergrad_s160, X75_undergrad_s219, X18_undergrad_s11, X155_undergrad_s410, X20_undergrad_s137, X34_undergrad_s284, 
            X194_undergrad_s351, X188_undergrad_s342, X102_undergrad_s146, X27_undergrad_s15, X25_undergrad_s44, X110_undergrad_s347, X33_undergrad_s20, X65_undergrad_s411, 
            X59_undergrad_s70, X93_undergrad_s127, X144_undergrad_s226, X30_undergrad_s103, X162_undergrad_s406, X196_undergrad_s357, X184_undergrad_s323, X71_undergrad_s95, 
            X78_undergrad_s147, X158_undergrad_s273, X39_undergrad_s35, X6_undergrad_s285, X58_undergrad_s68, X146_undergrad_s229, X52_undergrad_s61, X13_undergrad_s39, 
            X107_undergrad_s161, X198_undergrad_s359, X57_undergrad_s348, X48_undergrad_s59, X133_undergrad_s199, X95_undergrad_s132, X186_undergrad_s329, X171_undergrad_s306, 
            X175_undergrad_s315, X6_undergrad_s179, X181_undergrrad_s322, X122_undergrad_s181, X179_undergrad_s327, X105_undergrad_s156, X168_undergrad_s402, X126_undergrad_s192, 
            X81_undergrad_s105, X70_undergrad_s94, X190_undergrad_s333, X38_undergrad_s32, X31_undergrad_s58, X61_undergrad_s75, X139_undergrad_s215, X119_undergrad_s286, 
            X51_undergrad_s154, X114_undergrad_s412, X5_undergrad_s144, X29_undergrad_s18, X156_undergrad_s258, X88_undergrad_s123, X83_undergrad_s108, X137_undergrad_s207, 
            X67_undergrad_s87, X160_undergrad_s275, X35_undergrad_s23, X193_undergrad_s350, X149_undergrad_s240, X129_undergrad_s245, X113_undergrad_s178, X22_undergrad_s172, 
            X106_undergrad_s363, X177_undergrad_s307, X97_undergrad_s267, X79_undergrad_s250, X60_undergrad_s73, X166_undergrad_s282, X185_undergrad_s330, X64_undergrad_s407, 
            X143_undergrad_s224, X15_undergrad_s36, X151_undergrad_s263, X12_undergrad_s128, X84_undergrad_s151, X195_undergrad_s353, X199_undergrad_s362, X28_undergrad_s16, 
            X103_undergrad_s148, X117_undergrad_s174, X152_undergrad_s249, X17_undergrad_s10, X187_undergrad_s332, X170_undergrad_s326, X132_undergrad_s386, X164_undergrad_s278, 
            X66_undergrad_s88, X141_undergrad_s218, X145_undergrad_s227, X40_undergrad_s102, X197_undergrad_s358, X115_undergrad_s169, X92_undergrad_s126, X46_undergrad_s48, 
            X72_undergrad_s96, X142_undergraed_s223, X159_undergrad_s369, X200_undergrad_s354, X23_undergrad_s149, X125_undergrad_s191, X63_undergrad_s84, X10_undergrad_s6, 
            X192_undergrad_s376, X43_undergrad_s40, X56_undergrad_s120, X111_undergrad_s400, X47_undergrad_s405, X191_undergrad_s338, X134_undergrad_s200, X124_undergrad_s339, 
            X62_undergrad_s77, X108_undergrad_s162, X167_undergrad_s291, X54_undergrad_s365, X104_undergrad_s155, X26_undergrad_s57, X189_undergrad_s408, X157_undergrad_s259, 
            X96_undergrad_s134, X37_undergrad_s34, X165_undergrad_s281, X80_undergrad_s109, X176_undergrad_s318, X130_undergrad_s266, X24_undergrad_s14, X11_undergrad_s8), cleandf)

pattern2 <- grep("dat", names(.GlobalEnv), value=TRUE)

dat.list <- do.call("list", mget(pattern2))

reshape::merge_all(dat.list)

undergrad_dat <- do.call("rbind", dat.list)

rownames(undergrad_dat) <- 1:nrow(undergrad_dat)

# X53_undergrad_s64: missing PPI_19
# X21_undergrad_s12: missing PPI_33
# X76_undergrad_s114: missing PPI_1
# X55_undergrad_s67: missing PPI_29
# X91_undergrad_s125: missing PPI_16
# X82_undergrad_s106: missing PPI_5
# X86_undergrad_s115: missing PPI_1
# X99_undergrad_s158: missing PPI_9
# X109_undergrad_s163: missing PPI_15
# X73_undergrad_s107: missing PPI_1

write.csv(undergrad_dat, "undergrad_dat.csv")

combined_dat <- dplyr::bind_rows(prolific_dat, undergrad_dat)

combined_dat_include_all <- dplyr::bind_rows(prolific_dat, undergrad_dat, prolific_dat_ppin, undergrad_dat_ppin)

write.csv(combined_dat, "combined_dat.csv")

write.csv(combined_dat_include_all, "combined_dat_include_all.csv")

