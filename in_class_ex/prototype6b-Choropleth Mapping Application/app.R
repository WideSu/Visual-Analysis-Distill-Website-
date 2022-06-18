library(shiny)
library(sf)
library(tmap)
library(tidyverse)

mpsz <- st_read(dsn = "data/geospatial", 
                layer = "MP14_SUBZONE_WEB_PL")

popagsex <- read_csv("data/aspatial/respopagsex2000to2018.csv")

popagsex2018_male <- popagsex %>%
    filter(Sex == "Males") %>%
    filter(Time == 2018) %>%
    spread(AG, Pop) %>%
    mutate(YOUNG = `0_to_4`+`5_to_9`+`10_to_14`+
               `15_to_19`+`20_to_24`) %>%
    mutate(`ECONOMY ACTIVE` = rowSums(.[9:13])+
               rowSums(.[15:17]))%>%
    mutate(`AGED`=rowSums(.[18:22])) %>%
    mutate(`TOTAL`=rowSums(.[5:22])) %>%  
    mutate(`DEPENDENCY` = (`YOUNG` + `AGED`)
           /`ECONOMY ACTIVE`) %>%
    mutate_at(.vars = vars(PA, SZ), 
              .funs = funs(toupper)) %>%
    select(`PA`, `SZ`, `YOUNG`, 
           `ECONOMY ACTIVE`, `AGED`, 
           `TOTAL`, `DEPENDENCY`) %>%
    filter(`ECONOMY ACTIVE` > 0)

mpsz_agemale2018 <- left_join(mpsz,
                              popagsex2018_male,
                              by = c("SUBZONE_N" = "SZ"))

ui <- fluidPage(
    titlePanel("Choropleth Mapping Application"),
    sidebarLayout(
        sidebarPanel(
            selectInput(inputId = "classification",
                        label = "Classification method:",
                        choices = list("fixed" = "fixed", 
                                       "sd" = "sd", 
                                       "equal" = "equal", 
                                       "pretty" = "pretty", 
                                       "quantile" = "quantile", 
                                       "kmeans" = "kmeans", 
                                       "hclust" = "hclust", 
                                       "bclust" = "bclust", 
                                       "fisher" = "fisher", 
                                       "jenks" = "jenks"),
                        selected = "pretty"),
            sliderInput(inputId = "classes",
                        label = "Number of classes",
                        min = 6,
                        max = 12,
                        value = c(6)),
            selectInput(inputId = "colour",
                        label = "Colour scheme:",
                        choices = list("blues" = "Blues", 
                                       "reds" = "Reds", 
                                       "greens" = "Greens",
                                       "Yellow-Orange-Red" = "YlOrRd",
                                       "Yellow-Orange-Brown" = "YlOrBr",
                                       "Yellow-Green" = "YlGn",
                                       "Orange-Red" = "OrRd"),
                        selected = "YlOrRd")
        ),
        mainPanel(
            plotOutput("mapPlot")
        )
    )
)

server <- function(input, output){
    output$mapPlot <- renderPlot({
        tm_shape(mpsz_agemale2018)+
            tm_fill("DEPENDENCY", 
                    n = input$classes,
                    style = input$classification,
                    palette = input$colour) +
            tm_borders(lwd = 0.1,
                       alpha = 1)
        })
}

shinyApp (ui=ui, server=server)

