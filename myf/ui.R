#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinyWidgets)

# Define UI for application that draws a histogram
shinyUI(
    navbarPage("Application",
               tabPanel("Analysis",
                        fluidPage(
                            titlePanel("The relationship between variables and miles per gallon (MPG)"),
                            setBackgroundColor(
                              color = c("#F7FBFF", "#2171B5"),
                              gradient = "linear",
                              direction = "bottom"
                            ),
                            sidebarLayout(
                                sidebarPanel(
                                    selectInput("variable", "Variable:",
                                                c("Number of cylinders" = "cyl",
                                                  "Displacement" = "disp",
                                                  "Horsepower" = "hp",
                                                  "Rear axle ratio" = "drat",
                                                  "Weight " = "wt",
                                                  "1/4 mile time" = "qsec",
                                                  "V/S" = "vs",
                                                  "Transmission" = "am",
                                                  "Number of forward gears" = "gear",
                                                  "Number of carburetors" = "carb"
                                                )),
                                    
                                    checkboxInput("outliers", "Show BoxPlot's outliers", FALSE)
                                ),
                                
                                mainPanel(
                                    h3(textOutput("caption")),
                                    
                                    tabsetPanel(type = "tabs", 
                                                tabPanel("BoxPlot", plotOutput("mpgBoxPlot")),
                                                tabPanel("Regression model", 
                                                         plotOutput("mpgPlot"),
                                                         verbatimTextOutput("fit")
                                                )
                                    )
                                )
                            )
                        )
               ),
               tabPanel("About the Data Set",
                        
                        h3("Regression model and Exploratory data analyses by Motor Trends"),
                        p("The relationship between manual or automatic transmission and miles per gallon (MPG) is reported using `mtcars` dataset to determine which transmission type produces a higher MPG.  The relationship between a set of variables such as weight, transmission type, horsepower, and number of 
                          cylinders and MPG (outcome) is explored "),
               ),
               tabPanel("Variables",
                        
                        h3("Variable Description"),
                 
                        p("The data frame consists of 32 observations with 11 variables."),
                        tags$ol(
                          tags$li("Miles/gallon (mpg)"), 
                          tags$li("Number of cylinders (cyl)"), 
                          tags$li("Displacement (disp)"),
                          tags$li("horsepower (hp)"), 
                          tags$li("Rear axle ratio (drat)"), 
                          tags$li("Weight (wt)"),
                          tags$li("1/4 mile time (qsec)"), 
                          tags$li("V/S (vs)"),
                          tags$li("Transmission type (am)"), 
                          tags$li("Number of forward gears (gear)"),
                          tags$li("Number of carburetors (carb)")
                        ),
                        ),
               tabPanel("Conclusion",
                        h3("Conclusion on analysis"),
                        p("Manual transmission vehicles have greater MPG compared with automatic transmission vehicles. However weight, horsepower and number of cylinders are more statistically significant when determining MPG. "),
               )
    )
)