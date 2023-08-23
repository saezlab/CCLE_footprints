To reproduce, Download all RNA-Seq processed data from from https://depmap.org/portal/download/all/ -- (OmicsExpressionProteinCodingGenesTPMLogp1.csv) data folder. Install the decoupleR, reshape2 and dplyr packages, and run scripts/CCLE_footprints.R

You can find the progeny pathway activity estimate with up-to-date version of the decoupleR package in results/CCLE_progeny_activities.csv (estimated with the ULM method, top 100 model weight)

You can find the TF activity estimate with up-to-date version of the decoupleR package in results/CCLE_TF_activities.csv (estimated with the ULM method, collectrI regulons, minimum 5 targets/TF)

See https://saezlab.github.io/decoupleR/articles/pw_bk.html for more info on progeny/TF pathway activity