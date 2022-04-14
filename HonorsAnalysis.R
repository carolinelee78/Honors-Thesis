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
lapply(c("ggstatsplot"), pkgTest)
lapply(c("psych"), pkgTest)
lapply(c("ggpubr"), pkgTest)
lapply(c("Hmisc"), pkgTest)
lapply(c("ggnewscale"), pkgTest)
lapply(c("emmeans"), pkgTest)
lapply(c("ggpubr"), pkgTest)
lapply(c("ggsci"), pkgTest)
lapply(c("data.table"), pkgTest)
lapply(c("multcomp"), pkgTest)
lapply(c("report"), pkgTest)
lapply(c("broom"), pkgTest)
lapply(c("rstatix"), pkgTest)
lapply(c("ggfortify"), pkgTest)
lapply(c("survMisc"), pkgTest)
lapply(c("stats"), pkgTest)
library(apaTables)
library(tidyverse)
library(purrr)
library(tidyr)
library(ggplot2)
library(correlation)
library(varhandle)
library(cowplot) 
library(ggstatsplot)
library(sjPlot)
library(sjmisc)
library(ggplot2)
library(psych)
library(ggpubr)
library(Hmisc)
library(ggnewscale)
library(emmeans)
library(ggsci)
library(data.table)
library(multcomp)
library(report)
library(broom)
library(rstatix)
library(ggfortify)
library(stats)
theme_set(theme_sjplot())

# set working directory 

setwd("/Users/carolinelee/Desktop/Honors")

dat1 <- read.csv(file = 'undergrad_dat.csv', header = TRUE)
dat2 <- read.csv(file = 'undergrad_dat_ppin.csv', header = TRUE)
dat3 <- read.csv(file = 'prolific_dat.csv', header = TRUE)
dat4 <- read.csv(file = 'prolific_dat_ppin.csv', header = TRUE)

undergrad_dat <- dplyr::bind_rows(dat1, dat2)

table(undergrad_dat$attention_check) 

undergrad_dat <-
  undergrad_dat %>% filter(attention_check == "TRUE")

prolific_dat <- dplyr::bind_rows(dat3, dat4)

table(prolific_dat$attention_check) 

prolific_dat <-
  prolific_dat %>% filter(attention_check == "TRUE")

combined_dat <- dplyr::bind_rows(undergrad_dat, prolific_dat)

##################################
##### DESCRIPTIVE STATISTICS #####
##################################

psych::describe(combined_dat) 

table(combined_dat$race_ethnicity) 

2/237 # other 
61/237 # asian 
18/237 # black/african-american 
(1+1+1+3+1+13+4+1)/237 # mixed 
36/237 # hispanic 
2/237 # middle eastern or north african 
2/237 # prefer not to respond 
91/237 # white 
2+61+18+(1+1+1+3+1+13+4+1)+36+2+2+91

table(combined_dat$gender)

70/237 # male 
162/237 # female 
4/237 # non-binary, gender non conforming 
1/237 # prefer not to respond 
70+162+4+1

summary(combined_dat$age)
sd(combined_dat$age)

combined_dat <- combined_dat %>% mutate(AffectiveFeedback = ifelse(condition == 1, "Cooperative", 
                                                                   ifelse(condition == 2, "Competitive",
                                                                          ifelse(condition == 3, "Cooperative",
                                                                                 "Competitive"))),
                                        Stroop = ifelse(condition == 1 | condition == 2, "Incongruent", "Congruent")
)

# visualizing distributions - PPI 

combined_total_dist <-
  combined_dat %>%
  ggplot(aes(x=PPIR_TOTAL, na.rm = TRUE)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="white", bins = 20)+
  geom_density(alpha=.2, fill="#12a7cc") + 
  labs(x = "PPI-R Total", y = "Density") + 
  theme_classic()

combined_sci_dist <- 
  combined_dat %>%
  ggplot(aes(x=PPIR_SCImp, na.rm = TRUE)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="white", bins = 20)+
  geom_density(alpha=.2, fill="#12a7cc") + 
  labs(x = "PPI-R Self-Centered Impulsivity", y = "Density") + 
  theme_classic()

combined_fd_dist <- 
  combined_dat %>%
  ggplot(aes(x=PPIR_FearDom)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="white", bins = 20)+
  geom_density(alpha=.2, fill="#12a7cc") + 
  labs(x = "PPI-R Fearless Dominance", y = "Density") + 
  theme_classic()

combined_c_dist <- 
  combined_dat %>%
  ggplot(aes(x=PPIR_C)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="white", bins = 10)+
  geom_density(alpha=.2, fill="#12a7cc") + 
  labs(x = "PPI-R Coldheartedness", y = "Density") + 
  theme_classic()

combined_me_dist <- 
  combined_dat %>%
  ggplot(aes(x=PPIR_ME)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="white", bins = 20)+
  geom_density(alpha=.2, fill="#12a7cc") + 
  labs(x = "PPI-R Machiavellian Egocentricity", y = "Density") + 
  theme_classic()

combined_be_dist <-
  combined_dat %>%
  ggplot(aes(x=PPIR_BE)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="white", bins = 20)+
  geom_density(alpha=.2, fill="#12a7cc") + 
  labs(x = "PPI-R Blame Externalization", y = "Density") + 
  theme_classic()

combined_rn_dist <- 
  combined_dat %>%
  ggplot(aes(x=PPIR_RN)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="white", bins = 20)+
  geom_density(alpha=.2, fill="#12a7cc") + 
  labs(x = "PPI-R Rebellious Nonconformity", y = "Density") + 
  theme_classic() 

combined_soi_dist <- 
  combined_dat %>%
  ggplot(aes(x=PPIR_SOI)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="white", bins = 20)+
  geom_density(alpha=.2, fill="#12a7cc") + 
  labs(x = "PPI-R Social Influence", y = "Density") + 
  theme_classic()

combined_cn_dist <- 
  combined_dat %>%
  ggplot(aes(x=PPIR_CN)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="white", bins = 10)+
  geom_density(alpha=.2, fill="#12a7cc") + 
  labs(x = "PPI-R Carefree Nonplanfulness", y = "Density") + 
  theme_classic()

combined_f_dist <- 
  combined_dat %>%
  ggplot(aes(x=PPIR_F)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="white", bins = 20)+
  geom_density(alpha=.2, fill="#12a7cc") + 
  labs(x = "PPI-R Fearlessness", y = "Density") + 
  theme_classic()

combined_sti_dist <- 
  combined_dat %>%
  ggplot(aes(x=PPIR_STI)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="white", bins = 10)+
  geom_density(alpha=.2, fill="#12a7cc") + 
  labs(x = "PPI-R Stress Immunity", y = "Density") + 
  theme_classic()

# visualizing distributions - FERT 

combined_fert_dist <- 
  combined_dat %>%
  ggplot(aes(x=FERT_Score)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="white")+
  geom_density(alpha=.2, fill="#47c97f") + 
  labs(x = "FERT Score", y = "Density") + 
  theme_classic()

# SAM-V: happiness (1) to unhappiness (5)

mean(combined_dat$SAM_valence_pre)
sd(combined_dat$SAM_valence_pre)

mean(combined_dat$SAM_valence_post)
sd(combined_dat$SAM_valence_post)

t.test(combined_dat$SAM_valence_pre, combined_dat$SAM_valence_post, paired = TRUE, alternative = "two.sided") %>% report()

# SAM-A: excited (1) to calm (5)

mean(combined_dat$SAM_arousal_pre)
sd(combined_dat$SAM_arousal_pre)

mean(combined_dat$SAM_arousal_post)
sd(combined_dat$SAM_arousal_post)

t.test(combined_dat$SAM_arousal_pre, combined_dat$SAM_arousal_post, paired = TRUE, alternative = "two.sided") %>% report()

# ppi - internal consistency 

PPI_items <- combined_dat %>% dplyr::select(c(PPIR_27_r:PPIR_153_r, PPIR_33:PPIR_154, PPIR_4:PPIR_149, PPIR_89_r:PPIR_130_r, PPIR_18:PPIR_122, PPIR_87_r:PPIR_46, PPIR_47_r:PPIR_148, PPIR_10_r:PPIR_140)) 
PPI_C_items <- combined_dat %>% dplyr::select(PPIR_27_r:PPIR_153_r)
PPI_SCI_items <- combined_dat %>% dplyr::select(c(PPIR_33:PPIR_154, PPIR_4:PPIR_149, PPIR_89_r:PPIR_130_r, PPIR_18:PPIR_122))
PPI_FD_items <- combined_dat %>% dplyr::select(c(PPIR_87_r:PPIR_46, PPIR_47_r:PPIR_148, PPIR_10_r:PPIR_140))

psych::alpha(PPI_items, check.keys = TRUE)
psych::alpha(PPI_C_items, check.keys = TRUE)
psych::alpha(PPI_SCI_items, check.keys = TRUE)
psych::alpha(PPI_FD_items, check.keys = TRUE)

# ppi - intercorrelations 

combined_ppi <- combined_dat %>%
  dplyr::select(PPIR_TOTAL, PPIR_FearDom, PPIR_SCImp, PPIR_C)

apa.cor.table(combined_ppi, filename="test.doc")

cor.test(combined_ppi$PPIR_TOTAL, combined_ppi$PPIR_FearDom, method="pearson") 
cor.test(combined_ppi$PPIR_TOTAL, combined_ppi$PPIR_SCImp, method="pearson")
cor.test(combined_ppi$PPIR_TOTAL, combined_ppi$PPIR_C, method="pearson")
cor.test(combined_ppi$PPIR_FearDom, combined_ppi$PPIR_SCImp, method="pearson")
cor.test(combined_ppi$PPIR_FearDom, combined_ppi$PPIR_C, method="pearson")
cor.test(combined_ppi$PPIR_SCImp, combined_ppi$PPIR_C, method="pearson")

# fert - intercorrelations 

combined_fert <- combined_dat %>%
  dplyr::select(FERT_Score, FERT_CorrectEstimate, FERT_Anger, FERT_Disgust, FERT_Fear, FERT_Happiness, FERT_Sadness, FERT_Surprise)

apa.cor.table(combined_fert, filename="test.doc")

rcorr(as.matrix(combined_fert))

##################################
######### HYPOTHESIS 1A ##########
##################################

# ppi - fert correlations 

combined_ppi_fert <- combined_dat %>%
  dplyr::select(FERT_Score, PPIR_TOTAL, PPIR_FearDom, PPIR_STI, PPIR_SOI, PPIR_F, PPIR_SCImp, PPIR_CN, PPIR_ME, PPIR_BE, PPIR_RN, PPIR_C)

rcorr(as.matrix(combined_ppi_fert)) # ME p = .0097

combined_ppi_fert <- combined_dat %>%
  dplyr::select(FERT_Score_2, PPIR_TOTAL, PPIR_FearDom, PPIR_STI, PPIR_SOI, PPIR_F, PPIR_SCImp, PPIR_CN, PPIR_ME, PPIR_BE, PPIR_RN, PPIR_C)

rcorr(as.matrix(combined_ppi_fert)) 

combined_ppi_fert <- combined_dat %>%
  dplyr::select(FERT_CorrectEstimate, PPIR_TOTAL, PPIR_FearDom, PPIR_STI, PPIR_SOI, PPIR_F, PPIR_SCImp, PPIR_CN, PPIR_ME, PPIR_BE, PPIR_RN, PPIR_C)

rcorr(as.matrix(combined_ppi_fert)) # FD p = 0.0164; STI p = 0.0078; RN p = 0.04

combined_ppi_fert <- combined_dat %>%
  dplyr::select(FERT_Anger, PPIR_TOTAL, PPIR_FearDom, PPIR_STI, PPIR_SOI, PPIR_F, PPIR_SCImp, PPIR_CN, PPIR_ME, PPIR_BE, PPIR_RN, PPIR_C)

rcorr(as.matrix(combined_ppi_fert)) # TOTAL p = 0.0409; F p = 0.0268; C p = 0.0398

combined_ppi_fert <- combined_dat %>%
  dplyr::select(FERT_Disgust, PPIR_TOTAL, PPIR_FearDom, PPIR_STI, PPIR_SOI, PPIR_F, PPIR_SCImp, PPIR_CN, PPIR_ME, PPIR_BE, PPIR_RN, PPIR_C)

rcorr(as.matrix(combined_ppi_fert)) # no sig

combined_ppi_fert <- combined_dat %>%
  dplyr::select(FERT_Fear, PPIR_TOTAL, PPIR_FearDom, PPIR_STI, PPIR_SOI, PPIR_F, PPIR_SCImp, PPIR_CN, PPIR_ME, PPIR_BE, PPIR_RN, PPIR_C)

rcorr(as.matrix(combined_ppi_fert)) # ME p = 0.0090; RN p = 0.0364

combined_ppi_fert <- combined_dat %>%
  dplyr::select(FERT_Happiness, PPIR_TOTAL, PPIR_FearDom, PPIR_STI, PPIR_SOI, PPIR_F, PPIR_SCImp, PPIR_CN, PPIR_ME, PPIR_BE, PPIR_RN, PPIR_C)

rcorr(as.matrix(combined_ppi_fert)) # TOTAL p = 0.0435; SCImp p = 0.0099; ME p = 0.0105; BE p = 0.0065

combined_ppi_fert <- combined_dat %>%
  dplyr::select(FERT_Sadness, PPIR_TOTAL, PPIR_FearDom, PPIR_STI, PPIR_SOI, PPIR_F, PPIR_SCImp, PPIR_CN, PPIR_ME, PPIR_BE, PPIR_RN, PPIR_C)

rcorr(as.matrix(combined_ppi_fert)) # no sig

combined_ppi_fert <- combined_dat %>%
  dplyr::select(FERT_Surprise, PPIR_TOTAL, PPIR_FearDom, PPIR_STI, PPIR_SOI, PPIR_F, PPIR_SCImp, PPIR_CN, PPIR_ME, PPIR_BE, PPIR_RN, PPIR_C)

rcorr(as.matrix(combined_ppi_fert)) # SOI p = 0.0427 

##################################
######### HYPOTHESIS 1B ##########
##################################

t.test(combined_dat$FERT_Score_2, combined_dat$FERT_CorrectEstimate, paired = TRUE, alternative = "two.sided")

combined_fert_dk_2 <- combined_dat %>%
  dplyr::select(FERT_Score_2, FERT_CorrectEstimate)

mean(combined_fert_dk_2$FERT_Score_2)

mean(combined_fert_dk_2$FERT_CorrectEstimate)

dk_2_list_1 <- list(combined_fert_dk_2$FERT_Score_2)

dk_2_list_2 <- list(combined_fert_dk_2$FERT_CorrectEstimate)

dk_2_list <- c(dk_2_list_1, dk_2_list_2)

dk_2_unlist <- unlist(dk_2_list)

dk_2$Proportion <- dk_2_unlist 

dk_2 <- data.frame(dk_2_unlist)

Group <- c(rep("Score_2", 237), rep("CorrectEstimate", 237))

dk_2$Group <- Group 

dk_2 <- rename(dk_2, Proportion = dk_2_unlist)

dk_2 %>% cohens_d(Proportion ~ Group, paired = TRUE)

##################

t.test(combined_dat$FERT_Score, combined_dat$FERT_CorrectEstimate)

ggscatterstats(data=combined_dat, 
               x=FERT_Score_2, 
               y=FERT_CorrectEstimate, 
               xlab = "Actual FERT Score", 
               ylab = "Estimated FERT Score", 
               caption = "FERT = Facial Expression Recognition Task")


combined_fert_dk <- combined_dat %>%
  dplyr::select(FERT_Score, FERT_CorrectEstimate)

mean(combined_fert_dk$FERT_Score)

mean(combined_fert_dk$FERT_CorrectEstimate)

dk_list_1 <- list(combined_fert_dk$FERT_Score)

dk_list_2 <- list(combined_fert_dk$FERT_CorrectEstimate)

dk_list <- c(dk_list_1, dk_list_2)

dk_unlist <- unlist(dk_list)

dk$Proportion <- dk_unlist 

dk <- data.frame(dk_unlist)

Group <- c(rep("Score", 237), rep("CorrectEstimate", 237))

dk$Group <- Group 

dk <- rename(dk, Proportion = dk_unlist)

dk %>% cohens_d(Proportion ~ Group, paired = TRUE)

##################

vQuart = quantile(combined_dat$FERT_Score_2, c(0:4/4))

# classify values
combined_dat$quartile = with(combined_dat, 
               cut(FERT_Score_2, 
                   vQuart, 
                   include.lowest = T, 
                   labels = c("Bottom", "Second", "Third", "Top")))

combined_dat$quartile <- as.factor(combined_dat$quartile)

aggregate(combined_dat$FERT_Score_2, list(combined_dat$quartile), FUN=mean)

aggregate(combined_dat$FERT_Score_2, list(combined_dat$quartile), FUN=sd)

aggregate(combined_dat$FERT_CorrectEstimate, list(combined_dat$quartile), FUN=mean)

aggregate(combined_dat$FERT_CorrectEstimate, list(combined_dat$quartile), FUN=sd)

combined_dat %>% 
  group_by(quartile) %>% 
  do(tidy(t.test(.$FERT_CorrectEstimate, 
                 .$FERT_Score_2, 
                 mu = 0, 
                 alt = "two.sided", 
                 paired = TRUE, 
                 conf.level = 0.95)))  

table(combined_dat$quartile)

Quartile <- rep(c("Bottom", "Second", "Third", "Top"), 2)
Prpt <- c(0.5844749, 0.6844262, 0.7352941, 0.8135684, 0.6252055, 0.6455738, 0.6698039, 0.6813462)
Measure <- c(rep(c("Actual"), 4), rep(c("Estimate"), 4))

dk.data.quart <- data.frame(Quartile, Prpt, Measure)

dk.quart.bottom <- combined_dat[combined_dat$quartile=="Bottom", c("FERT_Score_2", "FERT_CorrectEstimate")]

dk.quart.bottom <- gather(dk.quart.bottom, Group, Proportion, FERT_Score_2, FERT_CorrectEstimate)

t.test(Proportion ~ Group, data = dk.quart.bottom, paired = TRUE)

dk.quart.second <- combined_dat[combined_dat$quartile=="Second", c("FERT_Score_2", "FERT_CorrectEstimate")]

dk.quart.second <- gather(dk.quart.second, Group, Proportion, FERT_Score_2, FERT_CorrectEstimate)

t.test(Proportion ~ Group, data = dk.quart.second, paired = TRUE)

dk.quart.third <- combined_dat[combined_dat$quartile=="Third", c("FERT_Score_2", "FERT_CorrectEstimate")]

dk.quart.top <- combined_dat[combined_dat$quartile=="Top", c("FERT_Score_2", "FERT_CorrectEstimate")]

quart_plot <- ggplot(data=dk.data.quart, aes(x=Quartile, y=Prpt, group=Measure)) +
  geom_point(aes(color=Measure)) + 
  geom_line(aes(color=Measure)) + 
  scale_color_manual(values = c("#CAB2D6", "#6A3D9A"), labels = c("Actual", "Estimate")) + 
  labs(y = "Average Proportion of Correct Responses")

##################

vTert = quantile(combined_dat$FERT_Score_2, c(0:3/3))

# classify values
combined_dat$tertile = with(combined_dat, 
                             cut(FERT_Score_2, 
                                 vTert, 
                                 include.lowest = T, 
                                 labels = c("Lower", "Middle", "Upper")))

aggregate(combined_dat$FERT_Score_2, list(combined_dat$tertile), FUN=mean)

aggregate(combined_dat$FERT_Score_2, list(combined_dat$tertile), FUN=sd)

aggregate(combined_dat$FERT_CorrectEstimate, list(combined_dat$tertile), FUN=mean)

aggregate(combined_dat$FERT_CorrectEstimate, list(combined_dat$tertile), FUN=sd)

combined_dat %>% 
  group_by(tertile) %>% 
  do(tidy(t.test(.$FERT_CorrectEstimate, 
                 .$FERT_Score_2, 
                 mu = 0, 
                 alt = "two.sided", 
                 paired = TRUE, 
                 conf.level = 0.95)))  

table(combined_dat$tertile)

Tertile <- rep(c("Lower", "Middle", "Upper"), 2)
Prpt <- c(0.6035088, 0.7058081, 0.7934942, 0.6386316, 0.6412121, 0.6792105)
Measure <- c(rep(c("Actual"), 3), rep(c("Estimate"), 3))

dk.data.tert <- data.frame(Tertile, Prpt, Measure)

dk.tert.lower <- dk.data.tert[ c(1,4), ]

dk.tert.middle <- dk.data.tert[ c(2,5), ]

dk.tert.upper <- dk.data.tert[ c(3,6), ]

tert_plot <- ggplot(data=dk.data.tert, aes(x=Tertile, y=Prpt, group=Measure)) +
  geom_point(aes(color=Measure)) + 
  geom_line(aes(color=Measure)) + 
  scale_color_manual(values = c("#CAB2D6", "#6A3D9A"), labels = c("Actual", "Estimate")) + 
  labs(y = "Average Proportion of Correct Responses", x = "Tercile")

cowplot::plot_grid(quart_plot, tert_plot, nrow=2, labels=c("A1", "A2"))

aov(PPIR_ME ~ factor(tertile), data = combined_dat) %>%
  report()

aov(PPIR_ME ~ factor(quartile), data = combined_dat) %>%
  report()

lm_output_1 <- lm(PPIR_ME ~ factor(tertile), data = combined_dat)

apa.aov.table(lm_output_1, filename = "test.doc")

sjPlot::tab_model(lm_output_1, show.std=T)

lm_output_2 <- lm(PPIR_ME ~ factor(quartile), data = combined_dat)

apa.aov.table(lm_output_2, filename = "test.doc")

# FERT correct percentage score dunning-kruger

combined_dat =
  mutate(combined_dat,
         FERT_Score_SQ = scale(FERT_Score_2)*scale(FERT_Score_2))

combined_dat =
  mutate(combined_dat,
         FERT_Score_cubed = scale(FERT_Score_2)*scale(FERT_Score_2)*scale(FERT_Score_2), 
         FERT_Score_std = scale(FERT_Score_2), 
         FERT_CorrectEstimate_std = scale(FERT_CorrectEstimate))

model.1 = lm (scale(FERT_CorrectEstimate) ~ scale(FERT_Score_2), data=combined_dat)

model.2 = lm (scale(FERT_CorrectEstimate) ~ scale(FERT_Score_2) + FERT_Score_SQ, data=combined_dat)

model.3 = lm (scale(FERT_CorrectEstimate) ~ scale(FERT_Score_2) + FERT_Score_SQ + FERT_Score_cubed, data=combined_dat)

summary(model.3)

sjPlot::tab_model(model.1, model.2,model.3, show.std=T)

apa.reg.table(model.1, model.2, model.3, filename = "test.doc")

fert_plot_1 <- ggplot(combined_dat, aes(x=FERT_Score_2, y=FERT_CorrectEstimate)) + 
  geom_point() +
  geom_smooth(aes(colour="Linear"), method='lm', se=FALSE, formula=y~x) + 
  geom_smooth(aes(colour="Quadratic"), method='lm', se=FALSE, formula=y~poly(x,2)) + 
  geom_smooth(aes(colour="Cubic"), method='lm', se=FALSE, formula=y~poly(x,3)) +
  labs(x = "Proportion of Correct FERT Responses", y = "FERT Self-Report Performance Estimate") + 
  scale_colour_manual(name="Model", values=c("mediumslateblue", "mediumturquoise", "lightsalmon")) + 
  guides(colour = guide_legend(override.aes = list(alpha = 0))) +
  theme_classic() 

lm (scale(FERT_CorrectEstimate) ~ scale(FERT_Score_2), data=combined_dat) %>% report()

lm (scale(FERT_CorrectEstimate) ~ scale(FERT_Score_2) + FERT_Score_SQ, data=combined_dat) %>% report()

lm (scale(FERT_CorrectEstimate) ~ scale(FERT_Score_2) + FERT_Score_SQ + FERT_Score_cubed, data=combined_dat) %>% report()

# FERT composite 2PL score dunning-kruger 

combined_dat =
  mutate(combined_dat,
         FERT_Score_SQ = scale(FERT_Score)*scale(FERT_Score))

combined_dat =
  mutate(combined_dat,
         FERT_Score_cubed = scale(FERT_Score)*scale(FERT_Score)*scale(FERT_Score), 
         FERT_Score_std = scale(FERT_Score), 
         FERT_CorrectEstimate_std = scale(FERT_CorrectEstimate))

model.1 = lm (scale(FERT_CorrectEstimate) ~ scale(FERT_Score), data=combined_dat)

model.2 = lm (scale(FERT_CorrectEstimate) ~ scale(FERT_Score) + FERT_Score_SQ, data=combined_dat)

model.3 = lm (scale(FERT_CorrectEstimate) ~ scale(FERT_Score) + FERT_Score_SQ + FERT_Score_cubed, data=combined_dat)

summary(model.3)

lm (scale(FERT_CorrectEstimate) ~ scale(FERT_Score), data=combined_dat) %>% report()

lm (scale(FERT_CorrectEstimate) ~ scale(FERT_Score) + FERT_Score_SQ, data=combined_dat) %>% report()

lm (scale(FERT_CorrectEstimate) ~ scale(FERT_Score) + FERT_Score_SQ + FERT_Score_cubed, data=combined_dat) %>% report()

sjPlot::tab_model(model.1, model.2,model.3, show.std=T)

apa.reg.table(model.1, model.2, model.3, filename = "test.doc")

fert_plot_2 <- ggplot(combined_dat, aes(x=FERT_Score, y=FERT_CorrectEstimate)) + 
  geom_point() +
  geom_smooth(aes(colour="Linear"), method='lm', se=FALSE, formula=y~x) + 
  geom_smooth(aes(colour="Quadratic"), method='lm', se=FALSE, formula=y~poly(x,2)) + 
  geom_smooth(aes(colour="Cubic"), method='lm', se=FALSE, formula=y~poly(x,3)) +
  labs(x = "FERT Score", y = "FERT Self-Report Performance Estimate") + 
  scale_colour_manual(name="Model", values=c("mediumslateblue", "mediumturquoise", "lightsalmon")) + 
  guides(colour = guide_legend(override.aes = list(alpha = 0))) +
  theme_classic() 

cowplot::plot_grid(fert_plot_1, fert_plot_2, nrow=2, labels="AUTO")

##################################
######### HYPOTHESIS 2A ##########
##################################

options(contrasts = c("contr.sum", "contr.poly"))

lm_output_1 <- lm(scale(IPD_Score) ~ Stroop*AffectiveFeedback, data = combined_dat)

apa.aov.table(lm_output_1, filename = "test.doc")

lm_output_2 <- lm(scale(CoopExpect) ~ Stroop*AffectiveFeedback, data = combined_dat)

apa.aov.table(lm_output_2, filename = "test.doc")

aov.fit1 <- aov(IPD_Score ~ Stroop*AffectiveFeedback, data = combined_dat) 

aov.fit1 %>% report()

posthoc <- TukeyHSD(x=aov.fit1, conf.level=0.95)
posthoc

aov(scale(IPD_Score) ~ Stroop*AffectiveFeedback, data = combined_dat) %>%
  report()

apa.2way.table(iv1 = AffectiveFeedback, iv2 = Stroop, dv = IPD_Score, 
               data = combined_dat,
               filename = "test.doc",
               show.marginal.means = TRUE)

oneway.aov.1 <- lm(IPD_Score ~ factor(condition), data = combined_dat)

aov(IPD_Score ~ factor(condition), data = combined_dat) %>%
  report()

apa.aov.table(oneway.aov.1, filename = "test.doc")

oneway.aov.2 <- lm(CoopExpect ~ factor(condition), data = combined_dat)

aov(CoopExpect ~ factor(condition), data = combined_dat) %>%
  report()

apa.aov.table(oneway.aov.2, filename = "test.doc")

bartlett.test(IPD_Score ~ condition, data = combined_dat)

vplot_1 <- ggbetweenstats(
  combined_dat,
  condition,
  IPD_Score,
  ylab = "Cooperation",
  plot.type = "boxviolin",
  type = "parametric", 
  var.equal = TRUE)

bartlett.test(CoopExpect ~ condition, data = combined_dat)

vplot_2 <- ggbetweenstats(
  combined_dat,
  condition,
  CoopExpect,
  ylab = "Expectation of Cooperation",
  plot.type = "boxviolin",
  type = "parametric", 
  var.equal = TRUE)

cowplot::plot_grid(vplot_1, vplot_2, nrow=1, labels="AUTO")

aov.fit2 <- aov(CoopExpect ~ Stroop*AffectiveFeedback, data = combined_dat) 

aov.fit2 %>% report()

posthoc <- TukeyHSD(x=aov.fit2, conf.level=0.95)
posthoc

m1 <- lm(IPD_Score ~ Stroop * AffectiveFeedback, data = combined_dat)

sjPlot::tab_model(m1, show.std=T)

lindia::gg_diagnose(model)

apa.reg.table(reg1, filename = "test.doc")

m2 <- lm(IPD_Score ~ Stroop + AffectiveFeedback, data = combined_dat)

m1.emm <- emmeans(m1, specs = c("AffectiveFeedback", "Stroop"))  

m1.emm # modeled means 

m1.emm.AffectiveFeedback <- emmeans(m1, specs = c("AffectiveFeedback"))

m1.emm.stroop <- emmeans(m1, specs = c("Stroop"))

m1.emm.AffectiveFeedback # marginal means 

m1.emm.stroop # marginal means 

m1.contrast <- contrast(m1.emm, adjust = "none", method = "revpairwise")

m1.contrast.ci <- summary(m1.contrast, infer = c(TRUE, TRUE))

m1.contrast.ci # pairwise contrasts

m1.effects <- summary(contrast(m1.emm,
                               method="revpairwise",
                               adjust="none",
                               simple = "each",
                               combine=TRUE),
                      infer=c(TRUE,TRUE))

m1.effects # simple effects 

m1.emm.1 <- emmeans(m1, specs=c("AffectiveFeedback"))
m1.effects.1 <- summary(contrast(m1.emm.1,
                                 method="revpairwise",
                                 adjust="none"),
                        infer=c(TRUE,TRUE))
m1.effects.1 # marginal effects of factorial model for AffectiveFeedback vs. competitive 

m1.emm.2 <- emmeans(m1, specs=c("Stroop"))
m1.effects.2 <- summary(contrast(m1.emm.2,
                                 method="revpairwise",
                                 adjust="none"),
                        infer=c(TRUE,TRUE))
m1.effects.2 # marginal effects of factorial model for stroop incongruent vs. congruent 

m1.effects.marginal <- rbind(data.table(m1.effects.1), data.table(m1.effects.2))
m1.effects.marginal # marginal effects of factorial model combined 

###############

# need m1.emm and m1.effects from above
# convert to data.table
m1.coefs <- coef(summary(m1))
m1.ci <- confint(m1)
m1.coefs.dt <- data.table(Term=row.names(m1.coefs), m1.coefs, m1.ci)
# convert labels to match those of m1.effects
setnames(m1.coefs.dt, 
         old=c("Estimate", "Std. Error", "Pr(>|t|)", "2.5 %", "97.5 %"),
         new=c("estimate", "SE", "p.value", "lower.CL", "upper.CL"))
m1.contrasts.dt <- data.table(m1.effects)
# create a label for each contrast
m1.contrasts.dt[, Term:=ifelse(Stroop!=".", 
                               paste0(Stroop, ":", contrast), 
                               paste0(AffectiveFeedback, ":", contrast))]
m1.effects.dt <- rbind(m1.coefs.dt[4,], m1.contrasts.dt, fill=TRUE)

# effects plot
# get p-values
pval <- as.character(round(m1.effects.dt$p.value, 3))
pval[2] <- "0.0003"
gg_effects <- ggdotplot(x="Term", 
                        y="estimate", 
                        data=m1.effects.dt, 
                        color = (pal_jco("default")(4))[1],
                        fill = (pal_jco("default")(4))[1],
                        size=0.5) +
  geom_errorbar(aes(x=Term, ymin=lower.CL, ymax=upper.CL),
                width=0.15, color=(pal_jco("default")(4))[1]) +
  ylab("Contrast") +
  geom_hline(yintercept=0, linetype = 2) +
  annotate("text", x = 1:5, y = rep(7.75, 5), label = pval) +
  annotate("text", x=5.4, y=7.75, label="p-value") +
  expand_limits(y = 8.3) +
  xlab("Contrast") +
  coord_flip() + 
  NULL

gg_effects

gg_effects <- gg_effects + scale_y_continuous(position="right")

cowplot::plot_grid(gg_effects, gg_response, nrow=2, 
          align = "v", 
          rel_heights = c(1, 1.75))

###############

# bar-plot with 2nd factor different color
pd <- position_dodge(0.7)
gg1_1 <- ggbarplot(x="AffectiveFeedback",
                 y="IPD_Score",
                 fill="Stroop",
                 data=combined_dat,
                 add=c("mean_ci"),
                 position=pd) +
  geom_point(aes(fill=Stroop), 
             color="black", 
             position=position_jitterdodge(jitter.width=0.2), 
             show.legend=FALSE, 
             alpha=0.5) +
  ylab("Rate of Cooperation") + 
  xlab("Affective Feedback") +
  scale_fill_jco() +
  NULL

# "interaction" plot
m1.emm.dt <- data.table(summary(m1.emm))

AffectiveFeedback

pd = position_dodge(0.7)
gg2 <- ggplot(data=m1.emm.dt, 
              aes(x=AffectiveFeedback, 
                  y=emmean, 
                  shape=Stroop, 
                  color=Stroop, 
                  group=Stroop)) +
  geom_point(position=pd, size=3) +
  ylim(0, 1) + 
  geom_errorbar(aes(x=AffectiveFeedback, 
                    ymin=lower.CL, 
                    ymax=upper.CL,
                    group=Stroop)
                , position=pd, width=0.1) +
  geom_line(position=pd) +
  ylab("Rate of Cooperation") +
  xlab("Affective Feedback") +
  scale_color_jco() +
  theme_pubr() +
  #theme(legend.position="bottom") +
  NULL


gg2 <- m1.emm.dt %>% 
  mutate(AffectiveFeedback = fct_relevel(AffectiveFeedback, "Cooperative", "Competitive")) %>% 
  ggplot(aes(x=AffectiveFeedback, 
             y=emmean, 
             shape=Stroop, 
             color=Stroop, 
             group=Stroop)) +
    geom_point(position=pd, size=3) +
    ylim(0, 1) + 
    geom_errorbar(aes(x=AffectiveFeedback, 
                      ymin=lower.CL, 
                      ymax=upper.CL,
                      group=Stroop)
                  , position=pd, width=0.1) +
    geom_line(position=pd) +
    ylab("Rate of Cooperation") +
    xlab("Affective Feedback") +
    scale_color_jco() +
    theme_pubr() +
    #theme(legend.position="bottom") +
    NULL


# interaction "jitter" plot
gg3_1 <- gg2 +
  geom_point(data=combined_dat, aes(x=AffectiveFeedback, y=IPD_Score, fill=Stroop),
             position=position_jitterdodge(jitter.width=0.2)) +
  #             position=position_jitter(width=0.2)) +
  xlab("Affective Feedback") +
  theme(legend.position="top") +
  NULL
gg_response <- gg3_1 # used below

##################################

m1 <- lm(CoopExpect ~ Stroop * AffectiveFeedback, data = combined_dat)

sjPlot::tab_model(m1, show.std=T)

lindia::gg_diagnose(model)

apa.reg.table(reg1, filename = "test.doc")

m2 <- lm(CoopExpect ~ Stroop + AffectiveFeedback, data = combined_dat)

m1.emm <- emmeans(m1, specs = c("AffectiveFeedback", "Stroop"))  

m1.emm # modeled means 

m1.emm.AffectiveFeedback <- emmeans(m1, specs = c("AffectiveFeedback"))

m1.emm.stroop <- emmeans(m1, specs = c("Stroop"))

m1.emm.AffectiveFeedback # marginal means 

m1.emm.stroop # marginal means 

m1.contrast <- contrast(m1.emm, adjust = "none", method = "revpairwise")

m1.contrast.ci <- summary(m1.contrast, infer = c(TRUE, TRUE))

m1.contrast.ci # pairwise contrasts

m1.effects <- summary(contrast(m1.emm,
                               method="revpairwise",
                               adjust="none",
                               simple = "each",
                               combine=TRUE),
                      infer=c(TRUE,TRUE))

m1.effects # simple effects 

m1.emm.1 <- emmeans(m1, specs=c("AffectiveFeedback"))
m1.effects.1 <- summary(contrast(m1.emm.1,
                                 method="revpairwise",
                                 adjust="none"),
                        infer=c(TRUE,TRUE))
m1.effects.1 # marginal effects of factorial model for AffectiveFeedback vs. competitive 

m1.emm.2 <- emmeans(m1, specs=c("Stroop"))
m1.effects.2 <- summary(contrast(m1.emm.2,
                                 method="revpairwise",
                                 adjust="none"),
                        infer=c(TRUE,TRUE))
m1.effects.2 # marginal effects of factorial model for stroop incongruent vs. congruent 

m1.effects.marginal <- rbind(data.table(m1.effects.1), data.table(m1.effects.2))
m1.effects.marginal # marginal effects of factorial model combined 

###############

# need m1.emm and m1.effects from above
# convert to data.table
m1.coefs <- coef(summary(m1))
m1.ci <- confint(m1)
m1.coefs.dt <- data.table(Term=row.names(m1.coefs), m1.coefs, m1.ci)
# convert labels to match those of m1.effects
setnames(m1.coefs.dt, 
         old=c("Estimate", "Std. Error", "Pr(>|t|)", "2.5 %", "97.5 %"),
         new=c("estimate", "SE", "p.value", "lower.CL", "upper.CL"))
m1.contrasts.dt <- data.table(m1.effects)
# create a label for each contrast
m1.contrasts.dt[, Term:=ifelse(Stroop!=".", 
                               paste0(Stroop, ":", contrast), 
                               paste0(AffectiveFeedback, ":", contrast))]
m1.effects.dt <- rbind(m1.coefs.dt[4,], m1.contrasts.dt, fill=TRUE)

# effects plot
# get p-values
pval <- as.character(round(m1.effects.dt$p.value, 3))
pval[2] <- "0.0003"
gg_effects <- ggdotplot(x="Term", 
                        y="estimate", 
                        data=m1.effects.dt, 
                        color = (pal_jco("default")(4))[1],
                        fill = (pal_jco("default")(4))[1],
                        size=0.5) +
  geom_errorbar(aes(x=Term, ymin=lower.CL, ymax=upper.CL),
                width=0.15, color=(pal_jco("default")(4))[1]) +
  ylab("Contrast") +
  geom_hline(yintercept=0, linetype = 2) +
  annotate("text", x = 1:5, y = rep(7.75, 5), label = pval) +
  annotate("text", x=5.4, y=7.75, label="p-value") +
  expand_limits(y = 8.3) +
  xlab("Contrast") +
  coord_flip() + 
  NULL

gg_effects

gg_effects <- gg_effects + scale_y_continuous(position="right")

cowplot::plot_grid(gg_effects, gg_response, nrow=2, 
                   align = "v", 
                   rel_heights = c(1, 1.75))

###############

# bar-plot with 2nd factor different color
pd <- position_dodge(0.7)
gg1_2 <- ggbarplot(x="AffectiveFeedback",
                 y="CoopExpect",
                 fill="Stroop",
                 data=combined_dat,
                 add=c("mean_ci"),
                 position=pd) +
  geom_point(aes(fill=Stroop), 
             color="black", 
             position=position_jitterdodge(jitter.width=0.2), 
             show.legend=FALSE, 
             alpha=0.5) +
  ylab("Expectation of Cooperation") + 
  xlab("Affective Feedback") +
  scale_fill_jco() +
  NULL

# "interaction" plot
m1.emm.dt <- data.table(summary(m1.emm))

AffectiveFeedback

pd = position_dodge(0.7)
gg2 <- ggplot(data=m1.emm.dt, 
              aes(x=AffectiveFeedback, 
                  y=emmean, 
                  shape=Stroop, 
                  color=Stroop, 
                  group=Stroop)) +
  geom_point(position=pd, size=3) +
  ylim(0, 1) + 
  geom_errorbar(aes(x=AffectiveFeedback, 
                    ymin=lower.CL, 
                    ymax=upper.CL,
                    group=Stroop)
                , position=pd, width=0.1) +
  geom_line(position=pd) +
  ylab("Expectation of Cooperation") +
  xlab("Affective Feedback") +
  scale_color_jco() +
  theme_pubr() +
  #theme(legend.position="bottom") +
  NULL


gg2 <- m1.emm.dt %>% 
  mutate(AffectiveFeedback = fct_relevel(AffectiveFeedback, "Cooperative", "Competitive")) %>% 
  ggplot(aes(x=AffectiveFeedback, 
             y=emmean, 
             shape=Stroop, 
             color=Stroop, 
             group=Stroop)) +
  geom_point(position=pd, size=3) +
  ylim(0, 1) + 
  geom_errorbar(aes(x=AffectiveFeedback, 
                    ymin=lower.CL, 
                    ymax=upper.CL,
                    group=Stroop)
                , position=pd, width=0.1) +
  geom_line(position=pd) +
  ylab("Expectation of Cooperation") +
  xlab("Affective Feedback") +
  scale_color_jco() +
  theme_pubr() +
  #theme(legend.position="bottom") +
  NULL


# interaction "jitter" plot
gg3_2 <- gg2 +
  geom_point(data=combined_dat, aes(x=AffectiveFeedback, y=CoopExpect, fill=Stroop),
             position=position_jitterdodge(jitter.width=0.2)) +
  #             position=position_jitter(width=0.2)) +
  xlab("Affective Feedback") +
  theme(legend.position="top") +
  NULL
gg_response <- gg3 # used below

cowplot::plot_grid(gg1_1, gg3_1, gg1_2, gg3_2, nrow=2, labels = "AUTO")

##################################
######### HYPOTHESIS 2B ##########
##################################

combined_ppi_coop <- combined_dat %>%
  dplyr::select(IPD_Score, PPIR_TOTAL, PPIR_FearDom, PPIR_STI, PPIR_SOI, PPIR_F, PPIR_SCImp, PPIR_CN, PPIR_ME, PPIR_BE, PPIR_RN, PPIR_C)

rcorr(as.matrix(combined_ppi_coop)) 

combined_ppi_cexp <- combined_dat %>%
  dplyr::select(CoopExpect, PPIR_TOTAL, PPIR_FearDom, PPIR_STI, PPIR_SOI, PPIR_F, PPIR_SCImp, PPIR_CN, PPIR_ME, PPIR_BE, PPIR_RN, PPIR_C)

rcorr(as.matrix(combined_ppi_cexp)) # ME p = 0.0375  

##################################
######### HYPOTHESIS 2C ##########
##################################

# IPD expectation of cooperation 

combined_dat_AF <- combined_dat %>% dplyr::select(ends_with("AffectiveFeedback"))

combined_dat_AF$Condition <- combined_dat$condition 

combined_dat_AF_Cond1or3 <-
  combined_dat_AF %>% filter(Condition == 2 | Condition == 4)

combined_dat_AF_Cond1or3$Condition = NULL

combined_dat_AF_Cond2or4 <-
  combined_dat_AF %>% filter(Condition == 1 | Condition == 2)

combined_dat_AF_Cond2or4$Condition = NULL

table(unlist(combined_dat_AF_Cond1or3))

table(unlist(combined_dat_AF_Cond2or4))

combined_dat_CE <- combined_dat %>% dplyr::select(ends_with("CoopExpect"))

combined_dat_CE$Condition <- combined_dat$condition 

grep("_CoopExpect", names(combined_dat), value=TRUE)

coop.ce.avg = function(x){
  mean(combined_dat_CE[combined_dat_CE$Condition == 2 | combined_dat_CE$Condition == 4, x]) * 100 - 50
}

Cond1or3_AVG <- lapply(list("R1_CoopExpect", "R2_CoopExpect", "R3_CoopExpect", "R4_CoopExpect", "R5_CoopExpect", "R6_CoopExpect",
                            "R7_CoopExpect", "R8_CoopExpect", "R9_CoopExpect", "R10_CoopExpect", "R11_CoopExpect", "R12_CoopExpect",
                            "R13_CoopExpect", "R14_CoopExpect", "R15_CoopExpect", "R16_CoopExpect", "R17_CoopExpect", "R18_CoopExpect",
                            "R19_CoopExpect"), coop.ce.avg)

Coop_Feedback <- unlist(Cond1or3_AVG)

CE_Comparison <- data.frame(Coop_Feedback)

comp.ce.avg = function(x){
  mean(combined_dat_CE[combined_dat_CE$Condition == 1 | combined_dat_CE$Condition == 3, x]) * 100 - 50
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
  scale_color_manual(values = c("#A6CEE3","#1F78B4"), labels = c("Cooperative", "Competitive")) + 
  ylim(-50, 50) + 
  theme_classic() + 
  labs(x = "Round", y = "Expectation of Cooperation in the Following Round", color = "Affective Feedback") 

# IPD score comp vs. coop 

combined_dat_CR <- combined_dat %>% dplyr::select(ends_with("_Strategy"))

combined_dat_CR$Condition <- combined_dat$condition

grep("_Strategy", names(combined_dat), value=TRUE)

coop.cr = function(x){
  decision = data.frame(table(combined_dat_CR[combined_dat_CR$Condition == 2 | combined_dat_CR$Condition == 4, x]))
  (decision[1, 2] / (decision[1, 2] + decision[2, 2])) * 100
}

Cond1or3_CR <- lapply(list("R1_Strategy", "R2_Strategy", "R3_Strategy", "R4_Strategy", "R5_Strategy", "R6_Strategy", 
                           "R7_Strategy", "R8_Strategy", "R9_Strategy", "R10_Strategy", "R11_Strategy", "R12_Strategy",
                           "R13_Strategy", "R14_Strategy", "R15_Strategy", "R16_Strategy", "R17_Strategy", "R18_Strategy",
                           "R19_Strategy", "R20_Strategy"), coop.cr)

Cooperative_Feedback <- unlist(Cond1or3_CR)

CR_Comparison <- data.frame(Cooperative_Feedback)

comp.cr = function(x){
  decision = data.frame(table(combined_dat_CR[combined_dat_CR$Condition == 1 | combined_dat_CR$Condition == 3, x]))
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
  scale_color_manual(values = c("#A6CEE3","#1F78B4"), labels = c("Cooperative", "Competitive")) + 
  ylim(0, 100) + 
  theme_classic() + 
  labs(x = "Round", y = "Cooperation Rate (%)", color = "Affective Feedback")

cowplot::plot_grid(CE_CompPlot, CR_CompPlot, labels = "AUTO")

##################################
######### HYPOTHESIS 2D ##########
##################################

reg_total <-lm(scale(IPD_Score) ~ scale(PPIR_TOTAL)*factor(condition) - 1, data = combined_dat)

sjPlot::tab_model(reg_total, show.std=T)

lm(scale(IPD_Score) ~ scale(PPIR_TOTAL)*factor(condition) - 1, data = combined_dat) %>% report()

reg_total <-lm(scale(CoopExpect) ~ scale(PPIR_TOTAL)*factor(condition) - 1, data = combined_dat)

sjPlot::tab_model(reg_total, show.std=T)

reg_fd <-lm(scale(IPD_Score) ~ scale(PPIR_FearDom)*factor(condition) - 1, data = combined_dat)

sjPlot::tab_model(reg_fd, show.std=T)

reg_fd <-lm(scale(CoopExpect) ~ scale(PPIR_FearDom)*factor(condition) - 1, data = combined_dat)

sjPlot::tab_model(reg_fd, show.std=T)

reg_sci <-lm(scale(IPD_Score) ~ scale(PPIR_SCImp)*factor(condition) - 1, data = combined_dat)

sjPlot::tab_model(reg_sci, show.std=T)

reg_sci <-lm(scale(CoopExpect) ~ scale(PPIR_SCImp)*factor(condition) - 1, data = combined_dat)

sjPlot::tab_model(reg_sci, show.std=T)

reg_co <-lm(scale(IPD_Score) ~ scale(PPIR_C)*factor(condition) - 1, data = combined_dat)

sjPlot::tab_model(reg_co, show.std=T)

reg_co <-lm(scale(CoopExpect) ~ scale(PPIR_C)*factor(condition) - 1, data = combined_dat)

sjPlot::tab_model(reg_co, show.std=T)

#########

regint_total_combined <- lm(scale(IPD_Score) ~ scale(PPIR_TOTAL)*AffectiveFeedback*Stroop, data = combined_dat)

sjPlot::tab_model(regint_total_combined, show.std=T)

plotint_total_combined <- plot_model(regint_total_combined, type = "pred", terms = c("PPIR_TOTAL", "AffectiveFeedback", "Stroop"), 
                                     title = "Predicted values of PD cooperation", axis.title = c("PPI-R Total", "Cooperation"), 
                                     legend.title = "Affective Feedback")

regint_c_combined <- lm(scale(IPD_Score) ~ scale(PPIR_C)*AffectiveFeedback*Stroop, data = combined_dat)

sjPlot::tab_model(regint_c_combined, show.std=T)

plotint_c_combined <- plot_model(regint_c_combined, type = "pred", terms = c("PPIR_C", "AffectiveFeedback", "Stroop"), 
                                 title = "Predicted values of PD cooperation", axis.title = c("PPI-R Coldheartedness", "Cooperation"), 
                                 legend.title = "Affective Feedback")

regint_scimp_combined <- lm(scale(IPD_Score) ~ scale(PPIR_SCImp)*AffectiveFeedback*Stroop, data = combined_dat)

sjPlot::tab_model(regint_scimp_combined, show.std=T)

plotint_scimp_combined <- plot_model(regint_scimp_combined, type = "pred", terms = c("PPIR_SCImp", "AffectiveFeedback", "Stroop"), 
                                     title = "Predicted values of PD cooperation", axis.title = c("PPI-R Self-Centered Impulsivity", "Cooperation"), 
                                     legend.title = "Affective Feedback")

regint_fd_combined <- lm(scale(IPD_Score) ~ scale(PPIR_FearDom)*AffectiveFeedback*Stroop, data = combined_dat)

sjPlot::tab_model(regint_fd_combined, show.std=T)

plotint_fd_combined <- plot_model(regint_fd_combined, type = "pred", terms = c("PPIR_FearDom", "AffectiveFeedback", "Stroop"), 
                                  title = "Predicted values of PD cooperation", axis.title = c("PPI-R Fearless Dominance", "Cooperation"), 
                                  legend.title = "Affective Feedback")

regint_sti_combined <- lm(scale(IPD_Score) ~ scale(PPIR_STI)*AffectiveFeedback*Stroop, data = combined_dat)

sjPlot::tab_model(regint_sti_combined, show.std=T)  

plotint_sti_combined <- plot_model(regint_sti_combined, type = "pred", terms = c("PPIR_STI", "AffectiveFeedback", "Stroop"), 
                                   title = "Predicted values of PD cooperation", axis.title = c("PPI-R Stress Immunity", "Cooperation"), 
                                   legend.title = "Affective Feedback")

regint_soi_combined <- lm(scale(IPD_Score) ~ scale(PPIR_SOI)*AffectiveFeedback*Stroop, data = combined_dat)

sjPlot::tab_model(regint_soi_combined, show.std=T)

plotint_soi_combined <- plot_model(regint_soi_combined, type = "pred", terms = c("PPIR_SOI", "AffectiveFeedback", "Stroop"), 
                                   title = "Predicted values of PD cooperation", axis.title = c("PPI-R Social Influence", "Cooperation"), 
                                   legend.title = "Affective Feedback")

regint_f_combined <- lm(scale(IPD_Score) ~ scale(PPIR_F)*AffectiveFeedback*Stroop, data = combined_dat)

sjPlot::tab_model(regint_f_combined, show.std=T)

plotint_f_combined <- plot_model(regint_f_combined, type = "pred", terms = c("PPIR_F", "AffectiveFeedback", "Stroop"), 
                                 title = "Predicted values of PD cooperation", axis.title = c("PPI-R Fearlessness", "Cooperation"), 
                                 legend.title = "Affective Feedback")

regint_cn_combined <- lm(scale(IPD_Score) ~ scale(PPIR_CN)*AffectiveFeedback*Stroop, data = combined_dat)

sjPlot::tab_model(regint_cn_combined, show.std=T)

plotint_cn_combined <- plot_model(regint_cn_combined, type = "pred", terms = c("PPIR_CN", "AffectiveFeedback", "Stroop"), 
                                  title = "Predicted values of PD cooperation", axis.title = c("PPI-R Carefree Nonplanfulness", "Cooperation"), 
                                  legend.title = "Affective Feedback")

regint_me_combined <- lm(scale(IPD_Score) ~ scale(PPIR_ME)*AffectiveFeedback*Stroop, data = combined_dat)

sjPlot::tab_model(regint_me_combined, show.std=T)

plotint_me_combined <- plot_model(regint_me_combined, type = "pred", terms = c("PPIR_ME", "AffectiveFeedback", "Stroop"), 
                                  title = "Predicted values of PD cooperation", axis.title = c("PPI-R Machiavellian Egocentricity", "Cooperation"), 
                                  legend.title = "Affective Feedback")

regint_be_combined <- lm(scale(IPD_Score) ~ scale(PPIR_BE)*AffectiveFeedback*Stroop, data = combined_dat)

sjPlot::tab_model(regint_be_combined, show.std=T)

plotint_be_combined <- plot_model(regint_be_combined, type = "pred", terms = c("PPIR_BE", "AffectiveFeedback", "Stroop"), 
                                  title = "Predicted values of PD cooperation", axis.title = c("PPI-R Blame Externalization", "Cooperation"), 
                                  legend.title = "Affective Feedback")

regint_rn_combined <- lm(scale(IPD_Score) ~ scale(PPIR_RN)*AffectiveFeedback*Stroop, data = combined_dat)

sjPlot::tab_model(regint_rn_combined, show.std=T)

plotint_rn_combined <- plot_model(regint_rn_combined, type = "pred", terms = c("PPIR_RN", "AffectiveFeedback", "Stroop"), 
                                 title = "Predicted values of PD cooperation", axis.title = c("PPI-R Rebellious Nonconformity", "Cooperation"), 
                                 legend.title = "Affective Feedback")

cowplot::plot_grid(plotint_total_combined, plotint_fd_combined, plotint_sti_combined, 
                   plotint_soi_combined, plotint_f_combined, plotint_scimp_combined, 
                   plotint_cn_combined, plotint_me_combined, plotint_be_combined, 
                   plotint_rn_combined, plotint_c_combined, nrow=3, labels="AUTO")
                   
# 3000 x 2000 

#########

regint_total_combined <- lm(scale(CoopExpect) ~ scale(PPIR_TOTAL)*AffectiveFeedback*Stroop, data = combined_dat)

sjPlot::tab_model(regint_total_combined, show.std=T)

apa.reg.table(regint_total_combined, filename = "test.doc")

plotint_total_combined <- plot_model(regint_total_combined, type = "pred", terms = c("PPIR_TOTAL", "AffectiveFeedback", "Stroop"), 
                                     title = "Predicted values of PD cooperation expectation", axis.title = c("PPI-R Total", "Cooperation Expectation"), 
                                     legend.title = "Affective Feedback")

regint_c_combined <- lm(scale(CoopExpect) ~ scale(PPIR_C)*AffectiveFeedback*Stroop, data = combined_dat)

sjPlot::tab_model(regint_c_combined, show.std=T)

regint_c_combined %>% report()

plotint_c_combined <- plot_model(regint_c_combined, type = "pred", terms = c("PPIR_C", "AffectiveFeedback", "Stroop"), 
                                 title = "Predicted values of PD cooperation expectation", axis.title = c("PPI-R Coldheartedness", "Cooperation Expectation"), 
                                 legend.title = "Affective Feedback")

regint_scimp_combined <- lm(scale(CoopExpect) ~ scale(PPIR_SCImp)*AffectiveFeedback*Stroop, data = combined_dat)

sjPlot::tab_model(regint_scimp_combined, show.std=T)

plotint_scimp_combined <- plot_model(regint_scimp_combined, type = "pred", terms = c("PPIR_SCImp", "AffectiveFeedback", "Stroop"), 
                                     title = "Predicted values of PD cooperation expectation", axis.title = c("PPI-R Self-Centered Impulsivity", "Cooperation Expectation"), 
                                     legend.title = "Affective Feedback")

regint_fd_combined <- lm(scale(CoopExpect) ~ scale(PPIR_FearDom)*AffectiveFeedback*Stroop, data = combined_dat)

sjPlot::tab_model(regint_fd_combined, show.std=T)

plotint_fd_combined <- plot_model(regint_fd_combined, type = "pred", terms = c("PPIR_FearDom", "AffectiveFeedback", "Stroop"), 
                                  title = "Predicted values of PD cooperation expectation", axis.title = c("PPI-R Fearless Dominance", "Cooperation Expectation"), 
                                  legend.title = "Affective Feedback")

regint_sti_combined <- lm(scale(CoopExpect) ~ scale(PPIR_STI)*AffectiveFeedback*Stroop, data = combined_dat)

sjPlot::tab_model(regint_sti_combined, show.std=T) # sig 

regint_sti_combined %>% report()

plotint_sti_combined <- plot_model(regint_sti_combined, type = "pred", terms = c("PPIR_STI", "AffectiveFeedback", "Stroop"), 
                                   title = "Predicted values of PD cooperation expectation", axis.title = c("PPI-R Stress Immunity", "Cooperation Expectation"), 
                                   legend.title = "Affective Feedback")
  
regint_soi_combined <- lm(scale(CoopExpect) ~ scale(PPIR_SOI)*AffectiveFeedback*Stroop, data = combined_dat)

sjPlot::tab_model(regint_soi_combined, show.std=T)
 
plotint_soi_combined <- plot_model(regint_sti_combined, type = "pred", terms = c("PPIR_SOI", "AffectiveFeedback", "Stroop"), 
                                   title = "Predicted values of PD cooperation expectation", axis.title = c("PPI-R Social Influence", "Cooperation Expectation"), 
                                   legend.title = "Affective Feedback")

regint_f_combined <- lm(scale(CoopExpect) ~ scale(PPIR_F)*AffectiveFeedback*Stroop, data = combined_dat)

sjPlot::tab_model(regint_f_combined, show.std=T)

plotint_f_combined <- plot_model(regint_f_combined, type = "pred", terms = c("PPIR_F", "AffectiveFeedback", "Stroop"), 
                                 title = "Predicted values of PD cooperation expectation", axis.title = c("PPI-R Fearlessness", "Cooperation Expectation"), 
                                 legend.title = "Affective Feedback")

regint_cn_combined <- lm(scale(CoopExpect) ~ scale(PPIR_CN)*AffectiveFeedback*Stroop, data = combined_dat)

sjPlot::tab_model(regint_cn_combined, show.std=T)

plotint_cn_combined <- plot_model(regint_cn_combined, type = "pred", terms = c("PPIR_CN", "AffectiveFeedback", "Stroop"), 
                                  title = "Predicted values of PD cooperation expectation", axis.title = c("PPI-R Carefree Nonplanfulness", "Cooperation Expectation"), 
                                  legend.title = "Affective Feedback")

regint_me_combined <- lm(scale(CoopExpect) ~ scale(PPIR_ME)*AffectiveFeedback*Stroop, data = combined_dat)

sjPlot::tab_model(regint_me_combined, show.std=T)

plotint_me_combined <- plot_model(regint_me_combined, type = "pred", terms = c("PPIR_ME", "AffectiveFeedback", "Stroop"), 
                                  title = "Predicted values of PD cooperation expectation", axis.title = c("PPI-R Machiavellian Egocentricity", "Cooperation Expectation"), 
                                  legend.title = "Affective Feedback")

regint_be_combined <- lm(scale(CoopExpect) ~ scale(PPIR_BE)*AffectiveFeedback*Stroop, data = combined_dat)

sjPlot::tab_model(regint_be_combined, show.std=T)

plotint_be_combined <- plot_model(regint_be_combined, type = "pred", terms = c("PPIR_BE", "AffectiveFeedback", "Stroop"), 
                                  title = "Predicted values of PD cooperation expectation", axis.title = c("PPI-R Blame Externalization", "Cooperation Expectation"), 
                                  legend.title = "Affective Feedback")

regint_rn_combined <- lm(scale(CoopExpect) ~ scale(PPIR_RN)*AffectiveFeedback*Stroop, data = combined_dat)

sjPlot::tab_model(regint_rn_combined, show.std=T)

plotint_rn_combined <- plot_model(regint_rn_combined, type = "pred", terms = c("PPIR_RN", "AffectiveFeedback", "Stroop"), 
                                  title = "Predicted values of PD cooperation expectation", axis.title = c("PPI-R Rebellious Nonconformity", "Cooperation Expectation"), 
                                  legend.title = "Affective Feedback")

cowplot::plot_grid(plotint_total_combined, plotint_fd_combined, plotint_sti_combined, 
                   plotint_soi_combined, plotint_f_combined, plotint_scimp_combined, 
                   plotint_cn_combined, plotint_me_combined, plotint_be_combined, 
                   plotint_rn_combined, plotint_c_combined, nrow=3, labels="AUTO")

cowplot::plot_grid(plotint_sti_combined, plotint_c_combined, nrow=1)

# 3000 x 2000 

#########

regint_coop_cexp <- lm(scale(IPD_Score) ~ CoopExpect*AffectiveFeedback*Stroop, data = combined_dat)

sjPlot::tab_model(regint_coop_cexp, show.std=T)

plot_model(regint_coop_cexp, type = "pred", terms = c("CoopExpect", "AffectiveFeedback", "Stroop"), 
          title = "Predicted values of PD cooperation", axis.title = c("Cooperation Expectation", "Cooperation"), 
          legend.title = "Affective Feedback")

#########








