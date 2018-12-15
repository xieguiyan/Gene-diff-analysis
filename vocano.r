###vocano for diff genes
library(ggplot2)
data =read.table("NOISeq_mirna_nofilter.xls",header=T,row.names=1)
r03 = ggplot(data,aes(log2FC,-1*log10(1-prob)))
###r03 + geom_point() ###no color
data$threshold <- as.factor(ifelse(data$prob > 0.99 & abs(data$log2FC) >=1.5,ifelse(data$log2FC > 1.5 ,'Up','Down'),'Not'))###diff color upon gene_down and gene_up
ggplot(data,aes(log2FC,-1*log10(1-prob),colour=threshold))+geom_point() +scale_color_manual(values = c("#4876FF","#0A0A0A", "#FF6A6A" ))
ggsave("vocano.tiff",device = "tiff",width = 8,height = 6)