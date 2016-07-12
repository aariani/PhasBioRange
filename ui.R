# ui.R


shinyUI(fluidPage(
	titlePanel('PhasBioRange'),
	
	hr(),

	sidebarPanel(
		helpText('Plot and compare geographic and climatic distribution of the ', em('Phaseoulus'), ' clade in the Americas.'),

		br(),
		br(),
		selectInput('data', 'Select gene pool:', choices=c('All', 'Wild', 'Domesticated'), selected='All'),
		hr(),
		selectInput('var', 'Select Data:', choices=c('Annual Precipitation', 'Annual Mean Temperature', 'Altitude') , selected='Annual Precipitation')
		),

	mainPanel(
		plotOutput('violinplots'),
		dataTableOutput('summaryData')
		)
	)
)
