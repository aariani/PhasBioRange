## server

library(vioplot)
source('helpers.R')
db=read.table('data/data.csv', sep='\t', header=T)

shinyServer(function(input, output){
## Choose pool data

	pool=reactive({
		switch(input$data,
			'All'='All', 
			'Wild'='Wild',
			'Domesticated'='Cultivated'
			)
		})

### Chose final data
	finalData=reactive({
		if (pool() =='All') return(db)
		processDB(db, pool())
		})
### Choose vars
	vars=reactive({
		switch(input$var, ### modify the name in the table according to your data
			'Annual Precipitation'='prec',
			'Annual Mean Temperature'='temp',
			'Altitude'='alt'
			)
		})

	output$violinplots=renderPlot({
		color=switch(input$var,
			'Annual Precipitation'='blue',
			'Annual Mean Temperature'='red',
			'Altitude'='green4'
			)			

		yleg=switch(input$var,
			'Annual Precipitation'='mm', 
			'Annual Mean Temperature'='Celsius', 
			'Altitude'='meters'
			)

		plotData(finalData(), vars(), color, input$var, yleg)
		})	

	output$summaryData=renderDataTable({
		getSummary(finalData(), vars())
		})
	})
