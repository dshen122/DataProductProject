library(shiny)
require(ggmap)
shinyServer(function(input, output){
  
  # create the function to get radio button user has selected.  it should be just get from input$maptyp to call qmap 
  # insider the renderPlot directly,  somehow the program doesn't like the syntax. hence the two step processes
  plotType <- function(type){
    # get the radio button user has selected to have maptype select correctly
    switch(type,
           terrain={qmap(input$location, zoom<-input$num, source="google", maptype="terrain")},
           satellite={qmap(input$location, zoom<-input$num, source="google", maptype="satellite")},
           roadmap={qmap(input$location, zoom<-input$num, source="google", maptype="roadmap")},
           hybrid = {qmap(input$location, zoom<-input$num, source="google", maptype="hybrid")}
           
    )
  }
  
  # render the map display 
  output$mapDisplay <- renderPlot(plotType(input$maptyp))
  
})
