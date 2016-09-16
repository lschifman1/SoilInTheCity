# Function

library(aqp)
library(lattice)
library(shiny)
full <- read.csv("//Aa.ad.epa.gov/ord/CIN/Users/main/L-P/LSchifma/Net MyDocuments/PROJECTS/Multicity Soil Analysis/Full1_InclPredictedTexture.csv")


depths(full) <- SampleSite_ID ~ top + bottom
site(full) <- ~ City_Name


in1 <- selectInput("pick_attribute",
                   label = "Pick a Soil Attribute",
                   choices = names(full@horizons)[31:56], selected="Percent_Sand")


out2 <- plotOutput("city_plots", height = "600px") 


# Function to plot the variable varname from profile soilprof
#  rows and cols for lattice plot layout
city_plot <- function(varname, rows, cols) {
  agg <- slab(full, fm = as.formula(paste("City_Name ~", varname)))
  xyplot(top ~ p.q50 | City_Name, data=agg, ylab='Depth',
         xlab='median bounded by 25th and 75th percentiles',
         lower=agg$p.q25, upper=agg$p.q75, ylim=c(500,-2),
         panel=panel.depth_function,
         alpha=0.25, sync.colors=TRUE,
         par.settings=list(superpose.line=list(col='RoyalBlue', lwd=2)),
         prepanel=prepanel.depth_function,
         cf=agg$contributing_fraction, cf.col='black', cf.interval=20, 
         layout=c(cols,rows), strip=strip.custom(bg=grey(0.8)),
         scales=list(x=list(tick.number=4, alternating=3, relation='free'))
  )  
}




server <- function(input, output) {
  output[["city_plots"]] <- renderPlot(
    city_plot(input[["pick_attribute"]], 3, 4)
  )
}


tab <- tabPanel("Soils Data",in1, out2)
ui <- navbarPage("Urban Soils Assessment", tab)
shinyApp(ui = ui, server = server)


