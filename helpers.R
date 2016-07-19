## helpers
library(vioplot)

processDB=function(db, pool) {
### function for parsing database based on genepool
	s=subset(db, db$biostatus==pool)
	return(s)
	}



plotData=function(db, var, color, t, yleg, max) {
## make subset of the dataset	
	names=c('P. vulgaris', 'P. lunatus', 'P. coccineus', 'P. dumosus', 'P. acutifolius')
	pv=na.omit(subset(db, db$species=='vulgaris')[,var])
	pl=na.omit(subset(db, db$species=='lunatus')[,var])
	pc=na.omit(subset(db, db$species=='coccineus')[,var])
	pd=na.omit(subset(db, db$species=='dumosus')[,var])
	pa=na.omit(subset(db, db$species=='acutifolius')[,var])
	vioplot(pv, pl, pc, pd, pa, names=names, col=color, ylim=c(0, max))
	title(paste(t, '(', yleg, ')'))
	}


getSummary=function(db, var){
	names=c('P. vulgaris', 'P. lunatus', 'P. coccineus', 'P. dumosus', 'P. acutifolius')
	avg=tapply(db[,var], db['species'], mean, na.rm=T)
	stand.dev=tapply(db[,var], db['species'], sd, na.rm=T)
	low=tapply(db[,var], db['species'], min, na.rm=T)
	high=tapply(db[,var], db['species'], max, na.rm=T)
	d=cbind.data.frame(names, 
		c(avg['vulgaris'], avg['lunatus'], avg['coccineus'], avg['dumosus'], avg['acutifolius']),
		c(stand.dev['vulgaris'], stand.dev['lunatus'], stand.dev['coccineus'], stand.dev['dumosus'], stand.dev['acutifolius']),
		c(low['vulgaris'], low['lunatus'], low['coccineus'], low['dumosus'], low['acutifolius']),
		c(high['vulgaris'], high['lunatus'], high['coccineus'], high['dumosus'], high['acutifolius']))

	colnames(d)=c('Species', 'mean', 'standard dev', 'min', 'max')
	rownames(d)=NULL
	return(d)
	}
	
