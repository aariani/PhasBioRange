## helpers
library(vioplot)

processDB=function(db, pool) {
### function for parsing database based on genepool
	s=subset(db, db$biostatus==pool)
	return(s)
	}



plotData=function(db, var, color, t, yleg) {
## make subset of the dataset	
	names=c('P. vulgaris', 'P. lunatus', 'P. coccineus', 'P. dumosus', 'P. acutifolius')
	pv=na.omit(subset(db, db$species=='vulgaris')[,var])
	pl=na.omit(subset(db, db$species=='lunatus')[,var])
	pc=na.omit(subset(db, db$species=='coccineus')[,var])
	pd=na.omit(subset(db, db$species=='dumosus')[,var])
	pa=na.omit(subset(db, db$species=='acutifolius')[,var])
	vioplot(pv, pl, pc, pd, pa, names=names, col=color)#, drawRect=F)
	title(paste(t, '(', yleg, ')'))
	}
		
