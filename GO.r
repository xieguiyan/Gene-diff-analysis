###Go enrich 
enrich_go = read.table("filtered GO up.txt",header= T,sep="\t")
test1 = ggplot(enrich_go,aes(x=Description,y=Count))
test2 = test1+geom_col(aes(fill = ONTOLOGY))
test3 = test2 + coord_flip()
test4 = test3 + facet_grid(ONTOLOGY~.,scales = "free",space = "free")
test4 + theme(
       legend.position = "none",
       axis.text = element_text(colour = "black"),
       strip.text = element_text(colour = "black",size=12),
       plot.background = element_rect(fill = "white", colour = "black"),
       panel.background = element_rect(fill = "white", colour = "black"),
       panel.grid.major = element_blank(),
       panel.grid.minor = element_blank()
   )
ggsave("UP_GO_enrichment.tiff",device = "tiff",width = 8,height = 6)