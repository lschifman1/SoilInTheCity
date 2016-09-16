library("aqp", lib.loc="C:/Program Files/R/R-3.2.2/library")
library("Hmisc", lib.loc="C:/Program Files/R/R-3.2.2/library")
library("lattice", lib.loc="C:/Program Files/R/R-3.2.2/library")
library("MASS", lib.loc="C:/Program Files/R/R-3.2.2/library")
library("shiny", lib.loc="C:/Program Files/R/R-3.2.2/library")
library("dplyr", lib.loc="C:/Program Files/R/R-3.2.2/library")

full <- read.csv("//Aa.ad.epa.gov/ord/CIN/Users/main/L-P/LSchifma/Net MyDocuments/PROJECTS/Multicity Soil Analysis/Full1_InclPredictedTexture.csv")
ATL <- filter(full, City_Name=="Atlanta")
CAM <- filter(full, City_Name=="Camden")
CIN <- filter(full, City_Name=="Cincinnati")
CLE <- filter(full, City_Name=="Cleveland")
DET <- filter(full, City_Name=="Detroit")
NOLA <- filter(full, City_Name=="New Orleans")
OMA <- filter(full, City_Name=="Omaha")
PHO <- filter(full, City_Name=="Phoenix")
POR <- filter(full, City_Name=="Portland")
SAN <- filter(full, City_Name=="San Juan")
TAC <- filter(full, City_Name=="Tacoma")








####################ATLANTA###############
# load sample data set, a data.frame object with horizon-level data from 10 profiles
data(full)
str(full)
# optionally read about it...
# ?sp4
# upgrade to SoilProfileCollection
# 'id' is the name of the column containing the profile ID
# 'top' is the name of the column containing horizon upper boundaries
# 'bottom' is the name of the column containing horizon lower boundaries
depths(full) <- City_Name ~ top + bottom
# check it out:
class(full) 
# class name
print(full)

# methods for object inspection
idname(full) # self-explanitory
horizonDepths(full) # self-explanitory
depth_units(full) # defaults to 'cm'
metadata(full) # not much to start with
profile_id(full) # vector of profile IDs
horizonNames(full) # column names from horizon data
siteNames(full) # column names from site data

# further inspection with common function overloads
length(full) # number of profiles in the collection
nrow(full) # number of horizons in the collection
names(full) # column names from site and horizon data, concatenated into a single vector
min(full) # shallowest profile depth in collection
max(full) # deepest profile depth in collection
horizons(full)

# extraction of soil profile components
site(full)  # get or set site data
diagnostic_hz(full) # get or set diagnostic horizons
proj4string(full)
coordinates(full)
full$thickness <- full$bottom - full$top # horizon-level
# assign a single single value into horizon-level attributes
full$constant <- rep(1, times=nrow(full))


# promote horizon-level data to site-level data (when it makes sense to do so)
# note that this _moves_ the named column from horizon to site
site(full) <- ~ constant 

# extract horizon data to data.frame
h <- horizons(full)

# add a new column and save back to original object
h$random.numbers <- rnorm(n=nrow(h), mean=0, sd=1)

# _replace_ original horizon data with modified version
# ! row-order should not be altered !
horizons(full) <- h

# extract site data to data.frame
s <- site(full)

# add a fake group to the site data
s$group <- rep(c('A', 'B'), length.out=nrow(s))

# join new site data with previous data: old data are _not_ replaced
site(full) <- s

# check:
full


# aggregate a couple of the horizon-level attributes, 
# across the entire collection, 
# from 0--10 cm
# computing the mean value ignoring missing data
slab(full, fm= ~ Percent_sand + Percent_Silt + Percent_Clay, slab.structure=c(0,10), slab.fun=mean, na.rm=TRUE)


# again, this time within groups defined by a site-level attribute:
slab(full, fm= group ~ Percent_sand + Percent_Silt + Percent_Clay, slab.structure=c(0,10), slab.fun=mean, na.rm=TRUE)


# again, this time over several depth ranges
slab(full, fm= ~ Percent_sand + Percent_Silt + Percent_Clay, slab.structure=c(0,10,25,40), slab.fun=mean, na.rm=TRUE)

# again, this time along 1-cm slices, computing quantiles
agg <- slab(full, fm= ~ Percent_Sand + pred_sand + Percent_Silt + pred_silt + Percent_Clay +  pred_clay)

# see ?slab for details on the default aggregate function
head(agg)

# plot median +/i bounds defined by the 25th and 75th percentiles
# this is lattice graphics, syntax is a little rough
xyplot(top ~ p.q50 | variable, data=agg, ylab='Depth',
       xlab='median bounded by 25th and 75th percentiles',
       lower=agg$p.q25, upper=agg$p.q75, ylim=c(500,-2),
       panel=panel.depth_function,
       alpha=0.25, sync.colors=TRUE,
       par.settings=list(superpose.line=list(col='RoyalBlue', lwd=2)),
       prepanel=prepanel.depth_function,
       cf=agg$contributing_fraction, cf.col='black', cf.interval=20, 
       layout=c(6,1), strip=strip.custom(bg=grey(0.8)),
       scales=list(x=list(tick.number=4, alternating=3, relation='free'))
)

