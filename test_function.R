# Function

library(aqp)
library(lattice)

full <- read.csv("Full2.csv")
depths(full) <- SampleSite_ID ~ UpperDepth_cm + LowerDepth_cm
site(full) <- ~ City_Name

# Function to plot the variable varname from profile soilprof
#  rows and cols for lattice plot layout
city_plot <- function(soilprof, varname, rows, cols) {
  soilprof@horizons$var <- soilprof@horizons[[varname]]
  agg <- slab(soilprof, fm = City_Name ~ var)
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

city_plot(full, "Percent_Sand", 3, 4)

