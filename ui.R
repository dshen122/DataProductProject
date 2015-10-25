library(shiny)


shinyUI(fluidPage(
  
  titlePanel("Location Map Display"),
  
  sidebarLayout(
    sidebarPanel(
      # create empty row
      hr(),
  
      # add a slider to adjust the map zoom level.  
      # per ggmap function call, the range one can adjust is between 3 and 21
      sliderInput(inputId="num", label="Please Choose a Map Zoom Level:",
                  value=14, min=3, max=21),
  
      # add some space radio button group
      # radio buttons enable user to select the map type
      hr(),
      radioButtons("maptyp", "Select Map Type To Display:", list("terrain", "satellite","roadmap", "hybrid"), "roadmap"),
  
      hr(),
      #text box for user to enter the search string.
      textInput("location", "Please Enter Search Location:", value="new york"),
      
      hr()
     
     
               
               
    ),
   
    #output area
    mainPanel(
      tabsetPanel(
      tabPanel("Plot", plotOutput(outputId = "mapDisplay")),
      tabPanel("Documentation",
        helpText("This small shiny application takes name of the place specified by the user and display the road map of the place entered."),
        helpText("The application calls ggmap package developed by David Kahle and Hadley Wickham to do spatial viaualization with ggplot 2."),
        helpText("The program provides the following features:"),
        helpText("Change different zoom level of the map using the slider provide, 3: completely zoom out vs. 21: completely zoom in."),
        helpText("The application can display different type of maps, the type of map will change per user selection of map type provided by radio button."),
        helpText("The application provides the textbox where user can enter the name of the place he/she is interested, the map will dynamically updated per google map search."),
        hr(),
        hr(),
        helpText("Known limitation:"),
        helpText("Due to dynamic search and stitching nature of the program, the program waits a bit to display the map.  So be patient with the performance.")
      )
      )
    )
  
  )))

