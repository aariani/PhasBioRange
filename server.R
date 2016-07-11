## server.R
library(vioplot)
source('helpers.R')

## Load data
## This database will have a species col, a pool color (with 'W' or 'D')
db=read.table('data/data.csv', sep='\t', header=T)

shinyServer(function(input, output){

	output$violinplots=renderPlot({

### Determine the dataset to use
		pool=switch(input$data,
			'All'='All',
			'Wild'='Wild',
			'Domesticated'='Cultivated'
			)

### Get the dataset based on the input$data filed
		finalData=reactive({
			if (pool=='All') return(db)
			processDB(db, pool) ## subsample fo the database
			})
		
##### chose the color
		color=switch(input$var,
			'Annual Precipitation'='blue',
			'Annual Mean Temperature'='red',
			'Altitude'='green4'
			)

### Determine the variable to plot
                vars=switch(input$var, ### modify the name in the table according to your data
                        'Annual Precipitation'='prec',
                        'Annual Mean Temperature'='temp',
                        'Altitude'='alt'
                        )

		yleg=switch(input$var,
			'Annual Precipitation'='mm', 
			'Annual Mean Temperature'='Celsius * 10', 
			'Altitude'='meters'
			)

		plotData(finalData(), vars, color, input$var, yleg)
                
		})
	})

