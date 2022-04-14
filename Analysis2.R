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

lapply(c("apaTables"), pkgTest)
lapply(c("dplyr"), pkgTest)
lapply(c("purrr"), pkgTest)
lapply(c("tidyr"), pkgTest)
lapply(c("ggplot2"), pkgTest)
lapply(c("correlation"), pkgTest)
lapply(c("varhandle"), pkgTest)
lapply(c("cowplot"), pkgTest)
lapply(c("sjPlot"), pkgTest)
library(apaTables)
library(tidyverse)
library(purrr)
library(tidyr)
library(ggplot2)
library(correlation)
library(varhandle)
library(cowplot) 
library(sjPlot)

theme_set(theme_sjplot())

# set working directory 

setwd("/Users/carolinelee/Desktop/Honors")

# import combined data 

dat <- read.csv(file = 'combined_dat_02.14.22.csv', header = TRUE)
dat2 <- read.csv(file = 'combined_dat_include_all.csv', header = TRUE)
dat$X = NULL
dat2$X.1 = NULL

# descriptive statistics 

psych::describe(dat)

psych::score.items(items = dat[""])

# filter for failed attention check 

table(dat$attention_check) 

datScreened <-
  dat %>% filter(attention_check == "TRUE")

psych::describe(datScreened) 

table(datScreened$race_ethnicity) 

table(datScreened$gender)

datScreened2 <-
  dat2 %>% filter(attention_check == "TRUE")

psych::describe(datScreened2) 

table(datScreened2$race_ethnicity)

table(datScreened2$gender)

# visualizing distributions - PPI

datScreened %>%
  ggplot(aes(x=PPIR_SCImp, na.rm = TRUE)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="white", bins = 20)+
  geom_density(alpha=.2, fill="#12a7cc") + 
  labs(x = "PPI-R-40 Self-Centered Impulsivity") + 
  theme_classic()

datScreened %>%
  ggplot(aes(x=PPIR_FearDom)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="white", bins = 20)+
  geom_density(alpha=.2, fill="#12a7cc") + 
  labs(x = "PPI-R-40 Fearless Dominance") + 
  theme_classic()

datScreened %>%
  ggplot(aes(x=PPIR_C)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="white", bins = 10)+
  geom_density(alpha=.2, fill="#12a7cc") + 
  labs(x = "PPI-R-40 Coldheartedness") + 
  theme_classic()

datScreened %>%
  ggplot(aes(x=PPIR_ME)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="white", bins = 20)+
  geom_density(alpha=.2, fill="#12a7cc") + 
  labs(x = "PPI-R-40 Machiavellian Egocentricity") + 
  theme_classic()

datScreened %>%
  ggplot(aes(x=PPIR_BE)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="white", bins = 20)+
  geom_density(alpha=.2, fill="#12a7cc") + 
  labs(x = "PPI-R-40 Blame Externalization") + 
  theme_classic()

datScreened %>%
  ggplot(aes(x=PPIR_RN)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="white", bins = 20)+
  geom_density(alpha=.2, fill="#12a7cc") + 
  labs(x = "PPI-R-40 Rebellious Nonconformity") + 
  theme_classic() 

datScreened %>%
  ggplot(aes(x=PPIR_SOI)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="white", bins = 20)+
  geom_density(alpha=.2, fill="#12a7cc") + 
  labs(x = "PPI-R-40 Social Influence") + 
  theme_classic()

datScreened %>%
  ggplot(aes(x=PPIR_CN)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="white", bins = 10)+
  geom_density(alpha=.2, fill="#12a7cc") + 
  labs(x = "PPI-R-40 Carefree Nonplanfulness") + 
  theme_classic()

datScreened %>%
  ggplot(aes(x=PPIR_F)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="white", bins = 20)+
  geom_density(alpha=.2, fill="#12a7cc") + 
  labs(x = "PPI-R-40 Fearlessness") + 
  theme_classic()

datScreened %>%
  ggplot(aes(x=PPIR_STI)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="white", bins = 10)+
  geom_density(alpha=.2, fill="#12a7cc") + 
  labs(x = "PPI-R-40 Stress Immunity") + 
  theme_classic()

# visualizing distributions - FERT 

datScreened2 %>%
  ggplot(aes(x=FERT_Score)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="white")+
  geom_density(alpha=.2, fill="#47c97f") + 
  labs(x = "FERT Score") + 
  theme_classic()

## RQ 1.1

datScreened %>%
  correlation(select = "PPIR_SCImp", select2 = "PPIR_C")

datScreened %>%
  correlation(select = "PPIR_FearDom", select2 = "PPIR_SCImp")

datScreened %>%
  correlation(select = "PPIR_SCImp", select2 = "FERT_Score")

datScreened %>%
  correlation(select = "PPIR_C", select2 = "FERT_Score")

datScreened %>%
  correlation(select = "PPIR_FearDom", select2 = "FERT_Score")

## RQ 1.2 - FERT Dunning-Kruger 

datScreened2 %>%
  correlation(select = "FERT_CorrectEstimate", select2 = "FERT_Score")

datScreened2 =
  mutate(datScreened2,
         FERT_Score_SQ = FERT_Score*FERT_Score)

model.1 = lm (scale(FERT_CorrectEstimate) ~ scale(FERT_Score), data=datScreened2)

model.2 = lm (scale(FERT_CorrectEstimate) ~ scale(FERT_Score) + scale(FERT_Score_SQ), data=datScreened2)

sjPlot::tab_model(model.1, model.2, show.std=T)

ggplot(datScreened2, aes(x=FERT_Score, y=FERT_CorrectEstimate)) + 
  geom_point() +
  stat_smooth(se=F, method='lm', formula=y~poly(x,2), color = "orangered2") + 
  geom_smooth(method = loess, color = "steelblue4", formula = 'y ~ x')

sjPlot::plot_residuals(
  model.1,
  geom.size = 2,
  remove.estimates = NULL,
  show.lines = TRUE,
  show.resid = TRUE,
  show.pred = TRUE,
  show.ci = FALSE
)

# IPD expectation of cooperation 

datScreened_AF <- datScreened %>% select(ends_with("AffectiveFeedback"))

datScreened_AF$Condition <- datScreened$condition 

datScreened_AF_Cond1or3 <-
  datScreened_AF %>% filter(Condition == 1 | Condition == 3)

datScreened_AF_Cond1or3$Condition = NULL

datScreened_AF_Cond2or4 <-
  datScreened_AF %>% filter(Condition == 2 | Condition == 4)

datScreened_AF_Cond2or4$Condition = NULL

table(unlist(datScreened_AF_Cond1or3))

table(unlist(datScreened_AF_Cond2or4))

datScreened_CE <- datScreened %>% select(ends_with("CoopExpect"))

datScreened_CE$Condition <- datScreened$condition 

grep("_CoopExpect", names(datScreened), value=TRUE)

coop.ce.avg = function(x){
  mean(datScreened_CE[datScreened_CE$Condition == 1 | datScreened_CE$Condition == 3, x]) * 100 - 50
}

Cond1or3_AVG <- lapply(list("R1_CoopExpect", "R2_CoopExpect", "R3_CoopExpect", "R4_CoopExpect", "R5_CoopExpect", "R6_CoopExpect",
            "R7_CoopExpect", "R8_CoopExpect", "R9_CoopExpect", "R10_CoopExpect", "R11_CoopExpect", "R12_CoopExpect",
            "R13_CoopExpect", "R14_CoopExpect", "R15_CoopExpect", "R16_CoopExpect", "R17_CoopExpect", "R18_CoopExpect",
            "R19_CoopExpect"), coop.ce.avg)

Coop_Feedback <- unlist(Cond1or3_AVG)

CE_Comparison <- data.frame(Coop_Feedback)

comp.ce.avg = function(x){
  mean(datScreened_CE[datScreened_CE$Condition == 2 | datScreened_CE$Condition == 4, x]) * 100 - 50
}

Cond2or4_AVG <- lapply(list("R1_CoopExpect", "R2_CoopExpect", "R3_CoopExpect", "R4_CoopExpect", "R5_CoopExpect", "R6_CoopExpect",
                        "R7_CoopExpect", "R8_CoopExpect", "R9_CoopExpect", "R10_CoopExpect", "R11_CoopExpect", "R12_CoopExpect",
                        "R13_CoopExpect", "R14_CoopExpect", "R15_CoopExpect", "R16_CoopExpect", "R17_CoopExpect", "R18_CoopExpect",
                        "R19_CoopExpect"), comp.ce.avg)

Comp_Feedback <- unlist(Cond2or4_AVG)

CE_Comparison$Comp_Feedback <- Comp_Feedback

CE_Comparison$Post_Round <- c(1:19)
 
keycol.1 <- "Condition"

valuecol.1 <- "CoopExp"

gathercols.1 <- c("Coop_Feedback", "Comp_Feedback")

CE_Comparison <- gather_(CE_Comparison, keycol.1, valuecol.1, gathercols.1)

CE_CompPlot <- 
  ggplot(CE_Comparison, aes(x=Post_Round, y=CoopExp, group=Condition)) +
    geom_point(aes(color=Condition)) + 
    geom_line(aes(color=Condition)) + 
    scale_color_brewer(palette="Paired") + 
    ylim(-50, 50) + 
    geom_abline(intercept = 0, slope = 0, color = "lightgray") + 
    theme_classic() + 
    labs(x = "Round", y = "Expectation of Cooperation in the Following Round")
 
# IPD score comp vs. coop 

datScreened_CR <- datScreened %>% select(ends_with("_Strategy"))

datScreened_CR$Condition <- datScreened$condition

grep("_Strategy", names(datScreened), value=TRUE)

coop.cr = function(x){
  decision = data.frame(table(datScreened_CR[datScreened_CR$Condition == 1 | datScreened_CR$Condition == 3, x]))
  (decision[1, 2] / (decision[1, 2] + decision[2, 2])) * 100
}

Cond1or3_CR <- lapply(list("R1_Strategy", "R2_Strategy", "R3_Strategy", "R4_Strategy", "R5_Strategy", "R6_Strategy", 
            "R7_Strategy", "R8_Strategy", "R9_Strategy", "R10_Strategy", "R11_Strategy", "R12_Strategy",
            "R13_Strategy", "R14_Strategy", "R15_Strategy", "R16_Strategy", "R17_Strategy", "R18_Strategy",
            "R19_Strategy", "R20_Strategy"), coop.cr)
 
Cooperative_Feedback <- unlist(Cond1or3_CR)

CR_Comparison <- data.frame(Cooperative_Feedback)

comp.cr = function(x){
  decision = data.frame(table(datScreened_CR[datScreened_CR$Condition == 2 | datScreened_CR$Condition == 4, x]))
  (decision[1, 2] / (decision[1, 2] + decision[2, 2])) * 100
}

Cond2or4_CR <- lapply(list("R1_Strategy", "R2_Strategy", "R3_Strategy", "R4_Strategy", "R5_Strategy", "R6_Strategy", 
                                  "R7_Strategy", "R8_Strategy", "R9_Strategy", "R10_Strategy", "R11_Strategy", "R12_Strategy",
                                  "R13_Strategy", "R14_Strategy", "R15_Strategy", "R16_Strategy", "R17_Strategy", "R18_Strategy",
                                  "R19_Strategy", "R20_Strategy"), comp.cr)

Competitive_Feedback <- unlist(Cond2or4_CR)

CR_Comparison$Competitive_Feedback <- Competitive_Feedback

CR_Comparison$Round <- c(1:20)

keycol.2 <- "Condition"

valuecol.2 <- "CoopRatio"

gathercols.2 <- c("Cooperative_Feedback", "Competitive_Feedback")

CR_Comparison <- gather_(CR_Comparison, keycol.2, valuecol.2, gathercols.2)

CR_CompPlot <- 
  ggplot(CR_Comparison, aes(x=Round, y=CoopRatio, group=Condition)) +
    geom_point(aes(color=Condition)) + 
    geom_line(aes(color=Condition)) + 
    scale_color_brewer(palette="Paired") + 
    ylim(0, 100) + 
    theme_classic() + 
    labs(x = "Round", y = "Cooperation Rate (%)")

plot_grid(CE_CompPlot, CR_CompPlot)

# cond 1 (coop-str) vs. cond 2 (comp-str) - cooperation rate & expectation 

datScreened3 <- datScreened %>%
  filter(condition == 1 | condition == 2) %>%
  select(condition, IPD_Score, PPIR_SCImp, PPIR_C, PPIR_FearDom, PPIR_TOTAL)

summary(datScreened3 %>% filter(condition == 1) %>% .$IPD_Score)

summary(datScreened3 %>% filter(condition == 2) %>% .$IPD_Score)

ggplot(datScreened3, aes(condition, IPD_Score, group=condition)) +
  geom_boxplot()

t.test(IPD_Score ~ condition, data = datScreened3)

summary(lm(IPD_Score ~ as.factor(condition) + PPIR_TOTAL + as.factor(condition)*PPIR_TOTAL, data = datScreened3))

summary(lm(IPD_Score ~ as.factor(condition) + PPIR_SCImp + as.factor(condition)*PPIR_SCImp, data = datScreened3))

summary(lm(IPD_Score ~ as.factor(condition) + PPIR_C + as.factor(condition)*PPIR_C, data = datScreened3))

summary(lm(IPD_Score ~ as.factor(condition) + PPIR_FearDom + as.factor(condition)*PPIR_FearDom, data = datScreened3))

# cond 3 (coop-no-str) vs. cond 4 (comp-no-str) - cooperation rate & expectation 

datScreened4 <- datScreened %>%
  filter(condition == 3 | condition == 4) %>%
  select(condition, IPD_Score)

summary(datScreened4 %>% filter(condition == 3) %>% .$IPD_Score)

summary(datScreened4 %>% filter(condition == 4) %>% .$IPD_Score)

ggplot(datScreened4, aes(condition, IPD_Score, group=condition)) +
  geom_boxplot()

t.test(IPD_Score ~ condition, data = datScreened4)

# conds 1 & 3 (coop) vs. conds 2 & 4 (comp) - cooperation rate & expectation 

datScreened5 <- mutate(datScreened, condition_type = ifelse(as.numeric(condition) == 1 | as.numeric(condition) == 3, "Con_1or3", "Con_2or4"))

datScreened5 %>% select(IPD_Score, PPIR_SCImp, PPIR_C, PPIR_FearDom) %>%
  correlation(p.adjust="none")

R5_analysis_CondType <- lm(IPD_Score ~ as.factor(condition_type), data = datScreened5)

datScreened5$PPIR_SCImp_std <- as.matrix(scale(datScreened5$PPIR_SCImp))

R5_analysis_SCI <- lm(IPD_Score ~PPIR_SCImp_std*condition_type, data = datScreened5)

datScreened5$PPIR_C_std <- as.matrix(scale(datScreened5$PPIR_C))

R5_analysis_CH <- lm(IPD_Score ~PPIR_C_std*condition_type, data = datScreened5)

datScreened5$PPIR_FD_std <- as.matrix(scale(datScreened5$PPIR_FearDom))

R5_analysis_FD <- lm(IPD_Score ~PPIR_FD_std*condition_type, data = datScreened5)

sjPlot::tab_model(R5_analysis_CondType, R5_analysis_SCI, R5_analysis_CH, R5_analysis_FD)










 





