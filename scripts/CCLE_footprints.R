library(readr)
library(dplyr)
library(decoupleR)
library(reshape2)

OmicsExpressionProteinCodingGenesTPMLogp1 <- as.data.frame(
  read_csv("data/OmicsExpressionProteinCodingGenesTPMLogp1.csv"))

row.names(OmicsExpressionProteinCodingGenesTPMLogp1) <- OmicsExpressionProteinCodingGenesTPMLogp1[,1]
OmicsExpressionProteinCodingGenesTPMLogp1 <- as.data.frame(t(OmicsExpressionProteinCodingGenesTPMLogp1[,-1]))
row.names(OmicsExpressionProteinCodingGenesTPMLogp1) <- gsub(" .*","",row.names(OmicsExpressionProteinCodingGenesTPMLogp1))

write(row.names(OmicsExpressionProteinCodingGenesTPMLogp1), file = "support/CCLE_coding_genes.txt")
### progeny

progeny_model <- decoupleR::get_progeny(top = 100)

progeny_activities <- run_ulm(OmicsExpressionProteinCodingGenesTPMLogp1, progeny_model)

progeny_activities_wf <- reshape2::dcast(progeny_activities[,c(2,3,4)], source~condition)

write_csv(progeny_model, file = "support/progeny_model.csv")
write_csv(progeny_activities_wf, file = "results/CCLE_progeny_activities.csv")

### collectrI

collectrI <- decoupleR::get_collectri()

TF_activities <- run_ulm(OmicsExpressionProteinCodingGenesTPMLogp1, collectrI)

TF_activities_df <- reshape2::dcast(TF_activities[,c(2,3,4)], source~condition)

write_csv(collectrI, file = "support/collectrI.csv")
write_csv(TF_activities_df, file = "results/CCLE_TF_activities.csv")

##### 