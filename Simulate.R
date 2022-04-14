
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

lapply(c("tidyverse"),pkgTest)
library(dplyr)

# ============== Simulating Data ============== 

run_id <- 1:500

condition <- sample(1:4, 500, replace = TRUE, prob = c(0.25, 0.25, 0.25, 0.25))

assigned_userid <- paste0("PDMXXXXXXXX_", 1:500)

created_userid <- rep("N/A", 500)

consent_correct <- rep("TRUE", 500)

age <- sample(19:25, 500, replace = TRUE)

gender <- c('Woman', 'Man', 'Non-binary', 'Transgender', 'Intersex', 'Gender non-conforming', 'Not listed', 'Prefer not to respond')

gender <- sample(gender, 500, replace = TRUE)

race_ethnicity <- c('White', 'Hispanic Latino or Spanish origin', 'Black or African American', 'Asian', 'American Indian or Alaska Native', 'Middle Eastern or North African', 'Native Hawaiian or Pacific Islander', 'Another race ethnicity or origin', 'Prefer not to respond')

race_ethnicity <- sample(race_ethnicity, 500, replace = TRUE)

SAM_valence_pre <- sample(0:4, 500, replace = TRUE)

SAM_arousal_pre <- sample(0:4, 500, replace = TRUE)

SAM_valence_post <- sample(0:4, 500, replace = TRUE)

SAM_arousal_post <- sample(0:4, 500, replace = TRUE)

FERT_Score <- round(runif(n = 500, min = 0, max = 1), 7)



sim_data <- data.frame(run_id, condition, assigned_userid, created_userid, consent_correct, age, gender, race_ethnicity, SAM_valence_pre, SAM_arousal_pre, 
                       SAM_valence_post, SAM_arousal_post, FERT_Score, FERT_ANG, FERT_DIS, FERT_FEA, FERT_HAP, FERT_SAD, FERT_SUR, FERT_MGANG, 
                       FERT_FFANG, FERT_LDANG, FERT_EBANG, FERT_FGANG, FERT_ARANG, FERT_MGDIS, FERT_FFDIS, FERT_LDDIS, FERT_EBDIS, FERT_FGDIS, 
                       FERT_ARDIS, FERT_MGFEA, FERT_FFFEA, FERT_LDFEA, FERT_EBFEA, FERT_FGFEA, FERT_ARFEA, FERT_MGHAP, FERT_FFHAP, FERT_LDHAP, 
                       FERT_EBHAP, FERT_FGHAP, FERT_ARHAP, FERT_MGSAD, FERT_FFSAD, FERT_LDSAD, FERT_EBSAD, FERT_FGSAD, FERT_ARSAD, FERT_MGSUR, 
                       FERT_FFSUR, FERT_LDSUR, FERT_EBSUR, FERT_FGSUR, FERT_ARSUR, R1_Strategy, R1_Outcome, R1_AffectiveFeedback, R1_CoopExpect, 
                       R2_Strategy, R2_Outcome, R2_AffectiveFeedback, R2_CoopExpect, R3_Strategy, R3_Outcome, R3_AffectiveFeedback, R3_CoopExpect,
                       R4_Strategy, R4_Outcome, R4_AffectiveFeedback, R4_CoopExpect, R5_Strategy, R5_Outcome, R5_AffectiveFeedback, R5_CoopExpect,
                       R6_Strategy, R6_Outcome, R6_AffectiveFeedback, R6_CoopExpect, R7_Strategy, R7_Outcome, R7_AffectiveFeedback, R7_CoopExpect,
                       R8_Strategy, R8_Outcome, R8_AffectiveFeedback, R8_CoopExpect, R9_Strategy, R9_Outcome, R9_AffectiveFeedback, R9_CoopExpect,
                       R10_Strategy, R10_Outcome, R10_AffectiveFeedback, R10_CoopExpect, R11_Strategy, R11_Outcome, R11_AffectiveFeedback, R11_CoopExpect,
                       R12_Strategy, R12_Outcome, R12_AffectiveFeedback, R12_CoopExpect, R13_Strategy, R13_Outcome, R13_AffectiveFeedback, R13_CoopExpect,
                       R14_Strategy, R14_Outcome, R14_AffectiveFeedback, R14_CoopExpect, R15_Strategy, R15_Outcome, R15_AffectiveFeedback, R15_CoopExpect,
                       R16_Strategy, R16_Outcome, R16_AffectiveFeedback, R16_CoopExpect, R17_Strategy, R17_Outcome, R17_AffectiveFeedback, R17_CoopExpect,
                       R18_Strategy, R18_Outcome, R18_AffectiveFeedback, R18_CoopExpect, R19_Strategy, R19_Outcome, R19_AffectiveFeedback, R19_CoopExpect,
                       R20_Strategy, R20_Outcome, R20_AffectiveFeedback, IPD_Score, PPIR_1, PPIR_2, PPIR_3, PPIR_4,PPIR_5, PPIR_6, PPIR_7, PPIR_8, PPIR_9,
                       PPIR_10, PPIR_11, PPIR_12, PPIR_13, PPIR_14, PPIR_15, PPIR_16, PPIR_17, PPIR_18, PPIR_19, PPIR_20, PPIR_21, PPIR_22, PPIR_23, PPIR_24, PPIR_25,
                       PPIR_26, PPIR_27, PPIR_28, PPIR_29, PPIR_30, PPIR_31, PPIR_32, PPIR_33, PPIR_34, PPIR_35, PPIR_36, PPIR_37, PPIR_38, PPIR_39, PPIR_40)








