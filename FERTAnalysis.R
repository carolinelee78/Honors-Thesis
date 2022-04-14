rm(list=ls())

library(BEST)
library(rstan)

numIter=10000

set.seed(108)

InputData <- read.csv("/Users/carolinelee/Desktop/Honors/participant2.csv")

# ===================================== FERT Emotion Recognition

Item <- c("ARANG2", "ARDIS3", "ARFEA2", "ARHAP2", "ARSAD3", "ARSUR2", 
          "EBANG1", "EBDIS2", "EBFEA3", "EBHAP3", "EBSAD3", "EBSUR3", 
          "FFANG3", "FFDIS2", "FFFEA2", "FFHAP3", "FFSAD1", "FFSUR2", 
          "FGANG2", "FGDIS2", "FGFEA2", "FGHAP3", "FGSAD1", "FGSUR3", 
          "LDANG3", "LDDIS3", "LDFEA3", "LDHAP2", "LDSAD3", "LDSUR2", 
          "MGANG1", "MGDIS2", "MGFEA3", "MGHAP3", "MGSAD2", "MGSUR1")

data <- data.frame(Item)

##### ARANG2 #####

ARANG2_Answer <- InputData[which(grepl("ARANG2", InputData$stimulus)), "response"]  

ARANG2_Answer <- droplevels.factor(ARANG2_Answer)

ARANG2_Answer <- unfactor(ARANG2_Answer)

ARANG2_Correct <- ARANG2_Answer == 0

ARANG2_Answer <- ifelse(ARANG2_Answer == 0, "ANG",
                     ifelse(ARANG2_Answer == 1, "DIS",
                            ifelse(ARANG2_Answer == 2, "FEA",
                                   ifelse(ARANG2_Answer == 3, "HAP",
                                          ifelse(ARANG2_Answer == 4, "SAD", "SUR")))))

##### ARDIS3 #####

ARDIS3_Answer <- InputData[which(grepl("ARDIS3", InputData$stimulus)), "response"] 

ARDIS3_Answer <- droplevels.factor(ARDIS3_Answer)

ARDIS3_Answer <- unfactor(ARDIS3_Answer)

ARDIS3_Correct <- ARDIS3_Answer == 1

ARDIS3_Answer <- ifelse(ARDIS3_Answer == 0, "ANG",
                        ifelse(ARDIS3_Answer == 1, "DIS",
                               ifelse(ARDIS3_Answer == 2, "FEA",
                                      ifelse(ARDIS3_Answer == 3, "HAP",
                                             ifelse(ARDIS3_Answer == 4, "SAD", "SUR")))))

##### ARFEA2 #####

ARFEA2_Answer <- InputData[which(grepl("ARFEA2", InputData$stimulus)), "response"] 

ARFEA2_Answer <- droplevels.factor(ARFEA2_Answer)

ARFEA2_Answer <- unfactor(ARFEA2_Answer)

ARFEA2_Correct <- ARFEA2_Answer == 2

ARFEA2_Answer <- ifelse(ARFEA2_Answer == 0, "ANG",
                        ifelse(ARFEA2_Answer == 1, "DIS",
                               ifelse(ARFEA2_Answer == 2, "FEA",
                                      ifelse(ARFEA2_Answer == 3, "HAP",
                                             ifelse(ARFEA2_Answer == 4, "SAD", "SUR")))))

##### ARHAP2 #####

ARHAP2_Answer <- InputData[which(grepl("ARHAP2", InputData$stimulus)), "response"] 

ARHAP2_Answer <- droplevels.factor(ARHAP2_Answer)

ARHAP2_Answer <- unfactor(ARHAP2_Answer)

ARHAP2_Correct <- ARHAP2_Answer == 3

ARHAP2_Answer <- ifelse(ARHAP2_Answer == 0, "ANG",
                        ifelse(ARHAP2_Answer == 1, "DIS",
                               ifelse(ARHAP2_Answer == 2, "FEA",
                                      ifelse(ARHAP2_Answer == 3, "HAP",
                                             ifelse(ARHAP2_Answer == 4, "SAD", "SUR")))))

##### ARSAD3 #####

ARSAD3_Answer <- InputData[which(grepl("ARSAD3", InputData$stimulus)), "response"] 

ARSAD3_Answer <- droplevels.factor(ARSAD3_Answer)

ARSAD3_Answer <- unfactor(ARSAD3_Answer)

ARSAD3_Correct <- ARSAD3_Answer == 4

ARSAD3_Answer <- ifelse(ARSAD3_Answer == 0, "ANG",
                        ifelse(ARSAD3_Answer == 1, "DIS",
                               ifelse(ARSAD3_Answer == 2, "FEA",
                                      ifelse(ARSAD3_Answer == 3, "HAP",
                                             ifelse(ARSAD3_Answer == 4, "SAD", "SUR")))))

##### ARSUR2 #####

ARSUR2_Answer <- InputData[which(grepl("ARSUR2", InputData$stimulus)), "response"] 

ARSUR2_Answer <- droplevels.factor(ARSUR2_Answer)

ARSUR2_Answer <- unfactor(ARSUR2_Answer)

ARSUR2_Correct <- ARSUR2_Answer == 5
 
ARSUR2_Answer <- ifelse(ARSUR2_Answer == 0, "ANG",
                        ifelse(ARSUR2_Answer == 1, "DIS",
                               ifelse(ARSUR2_Answer == 2, "FEA",
                                      ifelse(ARSUR2_Answer == 3, "HAP",
                                             ifelse(ARSUR2_Answer == 4, "SAD", "SUR")))))

##### EBANG1 #####

EBANG1_Answer <- InputData[which(grepl("EBANG1", InputData$stimulus)), "response"]  

EBANG1_Answer <- droplevels.factor(EBANG1_Answer)

EBANG1_Answer <- unfactor(EBANG1_Answer)

EBANG1_Correct <- EBANG1_Answer == 0

EBANG1_Answer <- ifelse(EBANG1_Answer == 0, "ANG",
                        ifelse(EBANG1_Answer == 1, "DIS",
                               ifelse(EBANG1_Answer == 2, "FEA",
                                      ifelse(EBANG1_Answer == 3, "HAP",
                                             ifelse(EBANG1_Answer == 4, "SAD", "SUR")))))

##### EBDIS2 #####

EBDIS2_Answer <- InputData[which(grepl("EBDIS2", InputData$stimulus)), "response"] 

EBDIS2_Answer <- droplevels.factor(EBDIS2_Answer)

EBDIS2_Answer <- unfactor(EBDIS2_Answer)

EBDIS2_Correct <- EBDIS2_Answer == 1

EBDIS2_Answer <- ifelse(EBDIS2_Answer == 0, "ANG",
                        ifelse(EBDIS2_Answer == 1, "DIS",
                               ifelse(EBDIS2_Answer == 2, "FEA",
                                      ifelse(EBDIS2_Answer == 3, "HAP",
                                             ifelse(EBDIS2_Answer == 4, "SAD", "SUR")))))

##### EBFEA3 #####

EBFEA3_Answer <- InputData[which(grepl("EBFEA3", InputData$stimulus)), "response"] 

EBFEA3_Answer <- droplevels.factor(EBFEA3_Answer)

EBFEA3_Answer <- unfactor(EBFEA3_Answer)

EBFEA3_Correct <- EBFEA3_Answer == 2

EBFEA3_Answer <- ifelse(EBFEA3_Answer == 0, "ANG",
                        ifelse(EBFEA3_Answer == 1, "DIS",
                               ifelse(EBFEA3_Answer == 2, "FEA",
                                      ifelse(EBFEA3_Answer == 3, "HAP",
                                             ifelse(EBFEA3_Answer == 4, "SAD", "SUR")))))

##### EBHAP3 #####

EBHAP3_Answer <- InputData[which(grepl("EBHAP3", InputData$stimulus)), "response"] 

EBHAP3_Answer <- droplevels.factor(EBHAP3_Answer)

EBHAP3_Answer <- unfactor(EBHAP3_Answer)

EBHAP3_Correct <- EBHAP3_Answer == 3

EBHAP3_Answer <- ifelse(EBHAP3_Answer == 0, "ANG",
                        ifelse(EBHAP3_Answer == 1, "DIS",
                               ifelse(EBHAP3_Answer == 2, "FEA",
                                      ifelse(EBHAP3_Answer == 3, "HAP",
                                             ifelse(EBHAP3_Answer == 4, "SAD", "SUR")))))

##### EBSAD3 #####

EBSAD3_Answer <- InputData[which(grepl("EBSAD3", InputData$stimulus)), "response"] 

EBSAD3_Answer <- droplevels.factor(EBSAD3_Answer)

EBSAD3_Answer <- unfactor(EBSAD3_Answer)

EBSAD3_Correct <- EBSAD3_Answer == 4

EBSAD3_Answer <- ifelse(EBSAD3_Answer == 0, "ANG",
                        ifelse(EBSAD3_Answer == 1, "DIS",
                               ifelse(EBSAD3_Answer == 2, "FEA",
                                      ifelse(EBSAD3_Answer == 3, "HAP",
                                             ifelse(EBSAD3_Answer == 4, "SAD", "SUR")))))

##### EBSUR3 #####

EBSUR3_Answer <- InputData[which(grepl("EBSUR3", InputData$stimulus)), "response"] 

EBSUR3_Answer <- droplevels.factor(EBSUR3_Answer)

EBSUR3_Answer <- unfactor(EBSUR3_Answer)

EBSUR3_Correct <- EBSUR3_Answer == 5

EBSUR3_Answer <- ifelse(EBSUR3_Answer == 0, "ANG",
                        ifelse(EBSUR3_Answer == 1, "DIS",
                               ifelse(EBSUR3_Answer == 2, "FEA",
                                      ifelse(EBSUR3_Answer == 3, "HAP",
                                             ifelse(EBSUR3_Answer == 4, "SAD", "SUR")))))

##### FFANG3 #####

FFANG3_Answer <- InputData[which(grepl("FFANG3", InputData$stimulus)), "response"]  

FFANG3_Answer <- droplevels.factor(FFANG3_Answer)

FFANG3_Answer <- unfactor(FFANG3_Answer)

FFANG3_Correct <- FFANG3_Answer == 0

FFANG3_Answer <- ifelse(FFANG3_Answer == 0, "ANG",
                        ifelse(FFANG3_Answer == 1, "DIS",
                               ifelse(FFANG3_Answer == 2, "FEA",
                                      ifelse(FFANG3_Answer == 3, "HAP",
                                             ifelse(FFANG3_Answer == 4, "SAD", "SUR")))))

##### FFDIS2 #####

FFDIS2_Answer <- InputData[which(grepl("FFDIS2", InputData$stimulus)), "response"] 

FFDIS2_Answer <- droplevels.factor(FFDIS2_Answer)

FFDIS2_Answer <- unfactor(FFDIS2_Answer)

FFDIS2_Correct <- FFDIS2_Answer == 1

FFDIS2_Answer <- ifelse(FFDIS2_Answer == 0, "ANG",
                        ifelse(FFDIS2_Answer == 1, "DIS",
                               ifelse(FFDIS2_Answer == 2, "FEA",
                                      ifelse(FFDIS2_Answer == 3, "HAP",
                                             ifelse(FFDIS2_Answer == 4, "SAD", "SUR")))))

##### FFFEA2 #####

FFFEA2_Answer <- InputData[which(grepl("FFFEA2", InputData$stimulus)), "response"] 

FFFEA2_Answer <- droplevels.factor(FFFEA2_Answer)

FFFEA2_Answer <- unfactor(FFFEA2_Answer)

FFFEA2_Correct <- FFFEA2_Answer == 2

FFFEA2_Answer <- ifelse(FFFEA2_Answer == 0, "ANG",
                        ifelse(FFFEA2_Answer == 1, "DIS",
                               ifelse(FFFEA2_Answer == 2, "FEA",
                                      ifelse(FFFEA2_Answer == 3, "HAP",
                                             ifelse(FFFEA2_Answer == 4, "SAD", "SUR")))))

##### FFHAP3 #####

FFHAP3_Answer <- InputData[which(grepl("FFHAP3", InputData$stimulus)), "response"] 

FFHAP3_Answer <- droplevels.factor(FFHAP3_Answer)

FFHAP3_Answer <- unfactor(FFHAP3_Answer)

FFHAP3_Correct <- FFHAP3_Answer == 3

FFHAP3_Answer <- ifelse(FFHAP3_Answer == 0, "ANG",
                        ifelse(FFHAP3_Answer == 1, "DIS",
                               ifelse(FFHAP3_Answer == 2, "FEA",
                                      ifelse(FFHAP3_Answer == 3, "HAP",
                                             ifelse(FFHAP3_Answer == 4, "SAD", "SUR")))))

##### FFSAD1 #####

FFSAD1_Answer <- InputData[which(grepl("FFSAD1", InputData$stimulus)), "response"] 

FFSAD1_Answer <- droplevels.factor(FFSAD1_Answer)

FFSAD1_Answer <- unfactor(FFSAD1_Answer)

FFSAD1_Correct <- FFSAD1_Answer == 4

FFSAD1_Answer <- ifelse(FFSAD1_Answer == 0, "ANG",
                        ifelse(FFSAD1_Answer == 1, "DIS",
                               ifelse(FFSAD1_Answer == 2, "FEA",
                                      ifelse(FFSAD1_Answer == 3, "HAP",
                                             ifelse(FFSAD1_Answer == 4, "SAD", "SUR")))))

##### FFSUR2 #####

FFSUR2_Answer <- InputData[which(grepl("FFSUR2", InputData$stimulus)), "response"] 

FFSUR2_Answer <- droplevels.factor(FFSUR2_Answer)

FFSUR2_Answer <- unfactor(FFSUR2_Answer)

FFSUR2_Correct <- FFSUR2_Answer == 5

FFSUR2_Answer <- ifelse(FFSUR2_Answer == 0, "ANG",
                        ifelse(FFSUR2_Answer == 1, "DIS",
                               ifelse(FFSUR2_Answer == 2, "FEA",
                                      ifelse(FFSUR2_Answer == 3, "HAP",
                                             ifelse(FFSUR2_Answer == 4, "SAD", "SUR")))))

##### FGANG2 #####

FGANG2_Answer <- InputData[which(grepl("FGANG2", InputData$stimulus)), "response"]  

FGANG2_Answer <- droplevels.factor(FGANG2_Answer)

FGANG2_Answer <- unfactor(FGANG2_Answer)

FGANG2_Correct <- FGANG2_Answer == 0

FGANG2_Answer <- ifelse(FGANG2_Answer == 0, "ANG",
                     ifelse(FGANG2_Answer == 1, "DIS",
                            ifelse(FGANG2_Answer == 2, "FEA",
                                   ifelse(FGANG2_Answer == 3, "HAP",
                                          ifelse(FGANG2_Answer == 4, "SAD", "SUR")))))

##### FGDIS2 #####

FGDIS2_Answer <- InputData[which(grepl("FGDIS2", InputData$stimulus)), "response"] 

FGDIS2_Answer <- droplevels.factor(FGDIS2_Answer)

FGDIS2_Answer <- unfactor(FGDIS2_Answer)

FGDIS2_Correct <- FGDIS2_Answer == 1

FGDIS2_Answer <- ifelse(FGDIS2_Answer == 0, "ANG",
                        ifelse(FGDIS2_Answer == 1, "DIS",
                               ifelse(FGDIS2_Answer == 2, "FEA",
                                      ifelse(FGDIS2_Answer == 3, "HAP",
                                             ifelse(FGDIS2_Answer == 4, "SAD", "SUR")))))

##### FGFEA2 #####

FGFEA2_Answer <- InputData[which(grepl("FGFEA2", InputData$stimulus)), "response"] 

FGFEA2_Answer <- droplevels.factor(FGFEA2_Answer)

FGFEA2_Answer <- unfactor(FGFEA2_Answer)

FGFEA2_Correct <- FGFEA2_Answer == 2

FGFEA2_Answer <- ifelse(FGFEA2_Answer == 0, "ANG",
                        ifelse(FGFEA2_Answer == 1, "DIS",
                               ifelse(FGFEA2_Answer == 2, "FEA",
                                      ifelse(FGFEA2_Answer == 3, "HAP",
                                             ifelse(FGFEA2_Answer == 4, "SAD", "SUR")))))

##### FGHAP3 #####

FGHAP3_Answer <- InputData[which(grepl("FGHAP3", InputData$stimulus)), "response"] 

FGHAP3_Answer <- droplevels.factor(FGHAP3_Answer)

FGHAP3_Answer <- unfactor(FGHAP3_Answer)

FGHAP3_Correct <- FFHAP3_Answer == 3

FGHAP3_Answer <- ifelse(FGHAP3_Answer == 0, "ANG",
                        ifelse(FGHAP3_Answer == 1, "DIS",
                               ifelse(FGHAP3_Answer == 2, "FEA",
                                      ifelse(FGHAP3_Answer == 3, "HAP",
                                             ifelse(FGHAP3_Answer == 4, "SAD", "SUR")))))

##### FGSAD1 #####

FGSAD1_Answer <- InputData[which(grepl("FGSAD1", InputData$stimulus)), "response"] 

FGSAD1_Answer <- droplevels.factor(FGSAD1_Answer)

FGSAD1_Answer <- unfactor(FGSAD1_Answer)

FGSAD1_Correct <- FGSAD1_Answer == 4

FGSAD1_Answer <- ifelse(FGSAD1_Answer == 0, "ANG",
                        ifelse(FGSAD1_Answer == 1, "DIS",
                               ifelse(FGSAD1_Answer == 2, "FEA",
                                      ifelse(FGSAD1_Answer == 3, "HAP",
                                             ifelse(FGSAD1_Answer == 4, "SAD", "SUR")))))

##### FGSUR3 #####

FGSUR3_Answer <- InputData[which(grepl("FGSUR3", InputData$stimulus)), "response"] 

FGSUR3_Answer <- droplevels.factor(FGSUR3_Answer)

FGSUR3_Answer <- unfactor(FGSUR3_Answer)

FGSUR3_Correct <- FGSUR3_Answer == 5

FGSUR3_Answer <- ifelse(FGSUR3_Answer == 0, "ANG",
                        ifelse(FGSUR3_Answer == 1, "DIS",
                               ifelse(FGSUR3_Answer == 2, "FEA",
                                      ifelse(FGSUR3_Answer == 3, "HAP",
                                             ifelse(FGSUR3_Answer == 4, "SAD", "SUR")))))

##### LDANG3 #####

LDANG3_Answer <- InputData[which(grepl("LDANG3", InputData$stimulus)), "response"]  

LDANG3_Answer <- droplevels.factor(LDANG3_Answer)

LDANG3_Answer <- unfactor(LDANG3_Answer)

LDANG3_Correct <- LDANG3_Answer == 0

LDANG3_Answer <- ifelse(LDANG3_Answer == 0, "ANG", 
                        ifelse(LDANG3_Answer == 1, "DIS",
                               ifelse(LDANG3_Answer == 2, "FEA",
                                      ifelse(LDANG3_Answer == 3, "HAP",
                                             ifelse(LDANG3_Answer == 4, "SAD", "SUR")))))

##### LDDIS3 #####

LDDIS3_Answer <- InputData[which(grepl("LDDIS3", InputData$stimulus)), "response"] 

LDDIS3_Answer <- droplevels.factor(LDDIS3_Answer)

LDDIS3_Answer <- unfactor(LDDIS3_Answer)

LDDIS3_Correct <- LDDIS3_Answer == 1

LDDIS3_Answer <- ifelse(LDDIS3_Answer == 0, "ANG",
                        ifelse(LDDIS3_Answer == 1, "DIS",
                               ifelse(LDDIS3_Answer == 2, "FEA",
                                      ifelse(LDDIS3_Answer == 3, "HAP",
                                             ifelse(LDDIS3_Answer == 4, "SAD", "SUR")))))

##### LDFEA3 #####

LDFEA3_Answer <- InputData[which(grepl("LDFEA3", InputData$stimulus)), "response"] 

LDFEA3_Answer <- droplevels.factor(LDFEA3_Answer)

LDFEA3_Answer <- unfactor(LDFEA3_Answer)

LDFEA3_Correct <- LDFEA3_Answer == 2

LDFEA3_Answer <- ifelse(LDFEA3_Answer == 0, "ANG",
                        ifelse(LDFEA3_Answer == 1, "DIS",
                               ifelse(LDFEA3_Answer == 2, "FEA",
                                      ifelse(LDFEA3_Answer == 3, "HAP",
                                             ifelse(LDFEA3_Answer == 4, "SAD", "SUR")))))

##### LDHAP2 #####

LDHAP2_Answer <- InputData[which(grepl("LDHAP2", InputData$stimulus)), "response"] 

LDHAP2_Answer <- droplevels.factor(LDHAP2_Answer)

LDHAP2_Answer <- unfactor(LDHAP2_Answer)

LDHAP2_Correct <- LDHAP2_Answer == 3

LDHAP2_Answer <- ifelse(LDHAP2_Answer == 0, "ANG",
                        ifelse(LDHAP2_Answer == 1, "DIS",
                               ifelse(LDHAP2_Answer == 2, "FEA",
                                      ifelse(LDHAP2_Answer == 3, "HAP",
                                             ifelse(LDHAP2_Answer == 4, "SAD", "SUR")))))

##### LDSAD3 #####

LDSAD3_Answer <- InputData[which(grepl("LDSAD", InputData$stimulus)), "response"] 

LDSAD3_Answer <- droplevels.factor(LDSAD3_Answer)

LDSAD3_Answer <- unfactor(LDSAD3_Answer)

LDSAD3_Correct <- LDSAD3_Answer == 4

LDSAD3_Answer <- ifelse(LDSAD3_Answer == 0, "ANG",
                        ifelse(LDSAD3_Answer == 1, "DIS",
                               ifelse(LDSAD3_Answer == 2, "FEA",
                                      ifelse(LDSAD3_Answer == 3, "HAP",
                                             ifelse(LDSAD3_Answer == 4, "SAD", "SUR")))))

##### LDSUR2 #####

LDSUR2_Answer <- InputData[which(grepl("LDSUR2", InputData$stimulus)), "response"] 

LDSUR2_Answer <- droplevels.factor(LDSUR2_Answer)

LDSUR2_Answer <- unfactor(LDSUR2_Answer)

LDSUR2_Correct <- LDSUR2_Answer == 5

LDSUR2_Answer <- ifelse(LDSUR2_Answer == 0, "ANG",
                        ifelse(LDSUR2_Answer == 1, "DIS",
                               ifelse(LDSUR2_Answer == 2, "FEA",
                                      ifelse(LDSUR2_Answer == 3, "HAP",
                                             ifelse(LDSUR2_Answer == 4, "SAD", "SUR")))))

##### MGANG1 #####

MGANG1_Answer <- InputData[which(grepl("MGANG1", InputData$stimulus)), "response"] 

MGANG1_Answer <- droplevels.factor(MGANG1_Answer)

MGANG1_Answer <- unfactor(MGANG1_Answer)

MGANG1_Correct <- MGANG1_Answer == 0

MGANG1_Answer <- ifelse(MGANG1_Answer == 0, "ANG",
                        ifelse(MGANG1_Answer == 1, "DIS",
                               ifelse(MGANG1_Answer == 2, "FEA",
                                      ifelse(MGANG1_Answer == 3, "HAP",
                                             ifelse(MGANG1_Answer == 4, "SAD", "SUR")))))

##### MGDIS2 #####

MGDIS2_Answer <- InputData[which(grepl("MGDIS2", InputData$stimulus)), "response"] 

MGDIS2_Answer <- droplevels.factor(MGDIS2_Answer)

MGDIS2_Answer <- unfactor(MGDIS2_Answer)

MGDIS2_Correct <- MGDIS2_Answer == 1

MGDIS2_Answer <- ifelse(MGDIS2_Answer == 0, "ANG",
                     ifelse(MGDIS2_Answer == 1, "DIS",
                            ifelse(MGDIS2_Answer == 2, "FEA",
                                   ifelse(MGDIS2_Answer == 3, "HAP",
                                          ifelse(MGDIS2_Answer == 4, "SAD", "SUR")))))

##### MGFEA3 #####

MGFEA3_Answer <- InputData[which(grepl("MGFEA3", InputData$stimulus)), "response"] 

MGFEA3_Answer <- droplevels.factor(MGFEA3_Answer)

MGFEA3_Answer <- unfactor(MGFEA3_Answer)

MGFEA3_Correct <- MGFEA3_Answer == 2

MGFEA3_Answer <- ifelse(MGFEA3_Answer == 0, "ANG",
                        ifelse(MGFEA3_Answer == 1, "DIS",
                               ifelse(MGFEA3_Answer == 2, "FEA",
                                      ifelse(MGFEA3_Answer == 3, "HAP",
                                             ifelse(MGFEA3_Answer == 4, "SAD", "SUR")))))

##### MGHAP3 #####

MGHAP3_Answer <- InputData[which(grepl("MGHAP3", InputData$stimulus)), "response"] 

MGHAP3_Answer <- droplevels.factor(MGHAP3_Answer)

MGHAP3_Answer <- unfactor(MGHAP3_Answer)

MGHAP3_Correct <- MGHAP3_Answer == 3

MGHAP3_Answer <- ifelse(MGHAP3_Answer == 0, "ANG",
                        ifelse(MGHAP3_Answer == 1, "DIS",
                               ifelse(MGHAP3_Answer == 2, "FEA",
                                      ifelse(MGHAP3_Answer == 3, "HAP",
                                             ifelse(MGHAP3_Answer == 4, "SAD", "SUR")))))

##### MGSAD2 #####

MGSAD2_Answer <- InputData[which(grepl("MGSAD2", InputData$stimulus)), "response"] 

MGSAD2_Answer <- droplevels.factor(MGSAD2_Answer)

MGSAD2_Answer <- unfactor(MGSAD2_Answer)

MGSAD2_Correct <- MGSAD2_Answer == 4

MGSAD2_Answer <- ifelse(MGSAD2_Answer == 0, "ANG",
                        ifelse(MGSAD2_Answer == 1, "DIS",
                               ifelse(MGSAD2_Answer == 2, "FEA",
                                      ifelse(MGSAD2_Answer == 3, "HAP",
                                             ifelse(MGSAD2_Answer == 4, "SAD", "SUR")))))

##### MGSUR1 #####

MGSUR1_Answer <- InputData[which(grepl("MGSUR1", InputData$stimulus)), "response"] 

MGSUR1_Answer <- droplevels.factor(MGSUR1_Answer)

MGSUR1_Answer <- unfactor(MGSUR1_Answer)

MGSUR1_Correct <- MGSUR1_Answer == 5

MGSUR1_Answer <- ifelse(MGSUR1_Answer == 0, "ANG",
                        ifelse(MGSUR1_Answer == 1, "DIS",
                               ifelse(MGSUR1_Answer == 2, "FEA",
                                      ifelse(MGSUR1_Answer == 3, "HAP",
                                             ifelse(MGSUR1_Answer == 4, "SAD", "SUR")))))

data$Answer <- c(ARANG2_Answer, ARDIS3_Answer, ARFEA2_Answer, ARHAP2_Answer, ARSAD3_Answer, ARSUR2_Answer, 
          EBANG1_Answer, EBDIS2_Answer, EBFEA3_Answer, EBHAP3_Answer, EBSAD3_Answer, EBSUR3_Answer, 
          FFANG3_Answer, FFDIS2_Answer, FFFEA2_Answer, FFHAP3_Answer, FFSAD1_Answer, FFSUR2_Answer, 
          FGANG2_Answer, FGDIS2_Answer, FGFEA2_Answer, FGHAP3_Answer, FGSAD1_Answer, FGSUR3_Answer, 
          LDANG3_Answer, LDDIS3_Answer, LDFEA3_Answer, LDHAP2_Answer, LDSAD3_Answer, LDSUR2_Answer, 
          MGANG1_Answer, MGDIS2_Answer, MGFEA3_Answer, MGHAP3_Answer, MGSAD2_Answer, MGSUR1_Answer)

data$Correct <- c(ARANG2_Correct, ARDIS3_Correct, ARFEA2_Correct, ARHAP2_Correct, ARSAD3_Correct, ARSUR2_Correct, 
                EBANG1_Correct, EBDIS2_Correct, EBFEA3_Correct, EBHAP3_Correct, EBSAD3_Correct, EBSUR3_Correct, 
                FFANG3_Correct, FFDIS2_Correct, FFFEA2_Correct, FFHAP3_Correct, FFSAD1_Correct, FFSUR2_Correct, 
                FGANG2_Correct, FGDIS2_Correct, FGFEA2_Correct, FGHAP3_Correct, FGSAD1_Correct, FGSUR3_Correct, 
                LDANG3_Correct, LDDIS3_Correct, LDFEA3_Correct, LDHAP2_Correct, LDSAD3_Correct, LDSUR2_Correct, 
                MGANG1_Correct, MGDIS2_Correct, MGFEA3_Correct, MGHAP3_Correct, MGSAD2_Correct, MGSUR1_Correct)

data$Alpha <- c(0.4651, 0.3005, 0.7169, 0.8780, 0.5474, 0.6123, 0.6064,
           0.2136, 0.7794, 1.4335, 0.5459, 0.4452, 1.6947, 0.4810, 0.5903,
           0.8826, 0.5491, 0.8933, 0.8345, 0.8804, 0.2824, 0.6313, 0.6104,
           0.4571, 0.7794, 0.5261, 0.8495, 0.6296, 0.4887, 0.6038, 1.4067,
           0.5214, 1.0957, 0.7295, 0.6006, 0.3117)

data$Beta <- c(-3.3289, -3.9263, -3.8320, -4.1036, -1.4685, -3.7313, -1.1982,
          0.3763, 0.3876, -4.7480, -4.7722, -6.2939, -3.3452, -6.4326, 0.4887,
          -5.8279, -1.7127, -3.8558, -2.8657, -4.3872, 0.1057, -6.1967, -3.4558,
          -3.0521, -2.8014, -4.6856, -0.3597, -3.4142, 0.2852, -3.6963, -0.9332,
          -3.5789, -1.4791, -5.4119, 0.1957, -6.5352)

#### Stan Model ####

# Data preparation

rstan_options(auto_write = TRUE)

options(mc.cores = parallel::detectCores())

stan_data <- list(Correct=data$Correct, Alpha=data$Alpha, Beta=data$Beta)

model <- "data {
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
twopl.fit <- stan(model_code=model, data = stan_data, iter = numIter, chains = 4)

stanfit <- extract(twopl.fit, pars=c("theta"))

plotPost(stanfit$theta)
print(paste("Estimated ability: ", round(mean(stanfit$theta), 2)))

FERT_Score <- round(mean(stanfit$theta), 2)

















