library(aqp)
library(sharpshootR)

## Example
data(loafercreek, package='soilDB')

# cut-down to a subset
loafercreek <- loafercreek[1:20, ]

# get depth class
sdc <- getSoilDepthClass(loafercreek)
site(loafercreek) <- sdc

# diagnostic properties to consider, no need to convert to factors
v <- c('lithic.contact', 'paralithic.contact', 'argillic.horizon', 
       'cambic.horizon', 'ochric.epipedon', 'mollic.epipedon', 'very.shallow',
       'shallow', 'mod.deep', 'deep', 'very.deep')


x <- diagnosticPropertyPlot(loafercreek, v, k=5)



##My inefficient code to follow... 

Full1_updated1 <- read.csv("~/NRC RAP POSTDOC Green Infrastructure -EPA/R/MultiCitySoil/SoilInTheCity/Full1_updated1.csv")
Full1_updated1->full
depths(full) <- SamplePoint_ID ~ top + bottom

site(full) <- ~ SampleSite_ID
site(full) <- ~ Passive
site(full) <- ~ Private
site(full) <- ~ Disturbed
site(full) <- ~ Anthropogenic
site(full) <- ~ Land_Use
site(full) <- ~ Park_Name

sdc_full <- getSoilDepthClass(full, depth.classes = c(very.shallow = 300, 
                                                shallow = 400, 
                                                mod.deep = 500, 
                                                deep = 600, 
                                                very.deep = 700), 
                              name="Horizon",top="top",bottom="bottom")
site(full) <- sdc_full
v <- c('Passive', 'Private','Anthropogenic','Disturbed', 'very.shallow',
       'shallow', 'mod.deep', 'deep', 'very.deep')

x <- diagnosticPropertyPlot(full, v, k=5,id="City_Name")

## holy cow, that is illegible but it works! 


## by city... 
##ATL
Full1_updated1[1:110,]->ATL
depths(ATL) <- SamplePoint_ID ~ top + bottom
site(ATL) <- ~ Passive
site(ATL) <- ~ Private
site(ATL) <- ~ Disturbed
site(ATL) <- ~ Anthropogenic
site(ATL) <- ~ Land_Use
site(ATL) <- ~ Park_Name
sdc_ATL <- getSoilDepthClass(ATL, depth.classes = c(very.shallow = 300, 
                                                      shallow = 400, 
                                                      mod.deep = 500, 
                                                      deep = 600, 
                                                      very.deep = 700), 
                              name="Horizon",top="top",bottom="bottom")
v <- c('Passive', 'Private','Anthropogenic','Disturbed', 'very.shallow',
       'shallow', 'mod.deep', 'deep', 'very.deep')
x <- diagnosticPropertyPlot(ATL, v, k=5,id="SamplePoint_ID")
x <- diagnosticPropertyPlot2(ATL, v, k=5,id="SamplePoint_ID")

##CAM
Full1_updated1[111:334,]->CAM
depths(CAM) <- SamplePoint_ID ~ top + bottom
site(CAM) <- ~ Passive
site(CAM) <- ~ Private
site(CAM) <- ~ Disturbed
site(CAM) <- ~ Anthropogenic
site(CAM) <- ~ Land_Use
site(CAM) <- ~ Park_Name
sdc_CAM <- getSoilDepthClass(CAM, depth.classes = c(very.shallow = 300, 
                                                    shallow = 400, 
                                                    mod.deep = 500, 
                                                    deep = 600, 
                                                    very.deep = 700), 
                             name="Horizon",top="top",bottom="bottom")
v <- c('Passive', 'Private','Anthropogenic','Disturbed', 'very.shallow',
       'shallow', 'mod.deep', 'deep', 'very.deep')
x <- diagnosticPropertyPlot(CAM, v, k=5, id="SamplePoint_ID")
x <- diagnosticPropertyPlot2(CAM, v, k=5, id="SamplePoint_ID")


##CIN
Full1_updated1[335:602,]->CIN
depths(CIN) <- SamplePoint_ID ~ top + bottom
site(CIN) <- ~ Passive
site(CIN) <- ~ Private
site(CIN) <- ~ Disturbed
site(CIN) <- ~ Anthropogenic
site(CIN) <- ~ Land_Use
site(CIN) <- ~ Park_Name
sdc_CIN <- getSoilDepthClass(CIN, depth.classes = c(very.shallow = 300, 
                                                    shallow = 400, 
                                                    mod.deep = 500, 
                                                    deep = 600, 
                                                    very.deep = 700), 
                             name="Horizon",top="top",bottom="bottom")
v <- c('Passive', 'Private', 'Anthropogenic', 'Disturbed', 'very.shallow',
       'shallow', 'mod.deep', 'deep', 'very.deep')
x <- diagnosticPropertyPlot(CIN, v, k=5, id="SamplePoint_ID")
x <- diagnosticPropertyPlot2(CIN, v, k=5, id="SamplePoint_ID")

##CLE
Full1_updated1[603:1264,]->CLE
depths(CLE) <- SamplePoint_ID ~ top + bottom
site(CLE) <- ~ Passive
site(CLE) <- ~ Private
site(CLE) <- ~ Disturbed
site(CLE) <- ~ Anthropogenic
site(CLE) <- ~ Land_Use
site(CLE) <- ~ Park_Name
sdc_CLE <- getSoilDepthClass(CLE, depth.classes = c(very.shallow = 300, 
                                                    shallow = 400, 
                                                    mod.deep = 500, 
                                                    deep = 600, 
                                                    very.deep = 700), 
                             name="Horizon",top="top",bottom="bottom")
v <- c('Passive', 'Private', 'Anthropogenic', 'Disturbed', 'very.shallow',
       'shallow', 'mod.deep', 'deep', 'very.deep')
x <- diagnosticPropertyPlot(CLE, v, k=5, id="SamplePoint_ID")
x <- diagnosticPropertyPlot2(CLE, v, k=5, id="SamplePoint_ID")



##DET
Full1_updated1[1265:1633,]->DET
depths(DET) <- SamplePoint_ID ~ top + bottom
site(DET) <- ~ Passive
site(DET) <- ~ Private
site(DET) <- ~ Disturbed
site(DET) <- ~ Anthropogenic
site(DET) <- ~ Land_Use
site(DET) <- ~ Park_Name
sdc_DET <- getSoilDepthClass(DET, depth.classes = c(very.shallow = 300, 
                                                    shallow = 400, 
                                                    mod.deep = 500, 
                                                    deep = 600, 
                                                    very.deep = 700), 
                             name="Horizon",top="top",bottom="bottom")
v <- c('Passive', 'Private', 'Anthropogenic', 'Disturbed', 'very.shallow',
       'shallow', 'mod.deep', 'deep', 'very.deep')
x <- diagnosticPropertyPlot(DET, v, k=5, id="SamplePoint_ID")
x <- diagnosticPropertyPlot2(DET, v, k=5, id="SamplePoint_ID")

##NOL
Full1_updated1[1634:1753,]->NOL
depths(NOL) <- SamplePoint_ID ~ top + bottom
site(NOL) <- ~ Passive
site(NOL) <- ~ Private
site(NOL) <- ~ Disturbed
site(NOL) <- ~ Anthropogenic
site(NOL) <- ~ Land_Use
site(NOL) <- ~ Park_Name
sdc_NOL <- getSoilDepthClass(NOL, depth.classes = c(very.shallow = 300, 
                                                    shallow = 400, 
                                                    mod.deep = 500, 
                                                    deep = 600, 
                                                    very.deep = 700), 
                             name="Horizon",top="top",bottom="bottom")
v <- c('Passive', 'Private', 'Anthropogenic', 'Disturbed', 'very.shallow',
       'shallow', 'mod.deep', 'deep', 'very.deep')
x <- diagnosticPropertyPlot(NOL, v, k=5, id="SamplePoint_ID")
x <- diagnosticPropertyPlot2(NOL, v, k=5, id="SamplePoint_ID")


##OMA
Full1_updated1[1754:1965,]->OMA
depths(OMA) <- SamplePoint_ID ~ top + bottom
site(OMA) <- ~ Passive
site(OMA) <- ~ Private
site(OMA) <- ~ Disturbed
site(OMA) <- ~ Anthropogenic
site(OMA) <- ~ Land_Use
site(OMA) <- ~ Park_Name
sdc_OMA <- getSoilDepthClass(OMA, depth.classes = c(very.shallow = 300, 
                                                    shallow = 400, 
                                                    mod.deep = 500, 
                                                    deep = 600, 
                                                    very.deep = 700), 
                             name="Horizon",top="top",bottom="bottom")
v <- c('Passive', 'Private', 'Anthropogenic', 'Disturbed', 'very.shallow',
       'shallow', 'mod.deep', 'deep', 'very.deep')
x <- diagnosticPropertyPlot(OMA, v, k=5, id="SamplePoint_ID")
x <- diagnosticPropertyPlot2(OMA, v, k=5, id="SamplePoint_ID")

##POR
Full1_updated1[1966:2103,]->POR
depths(POR) <- SamplePoint_ID ~ top + bottom
site(POR) <- ~ Passive
site(POR) <- ~ Private
site(POR) <- ~ Disturbed
site(POR) <- ~ Anthropogenic
site(POR) <- ~ Land_Use
site(POR) <- ~ Park_Name
sdc_POR <- getSoilDepthClass(POR, depth.classes = c(very.shallow = 300, 
                                                    shallow = 400, 
                                                    mod.deep = 500, 
                                                    deep = 600, 
                                                    very.deep = 700), 
                             name="Horizon",top="top",bottom="bottom")
v <- c('Passive', 'Private', 'Anthropogenic', 'Disturbed', 'very.shallow',
       'shallow', 'mod.deep', 'deep', 'very.deep')
x <- diagnosticPropertyPlot(POR, v, k=5, id="SamplePoint_ID")
x <- diagnosticPropertyPlot2(POR, v, k=5, id="SamplePoint_ID")

##PHO
Full1_updated1[2104:2175,]->PHO
depths(PHO) <- SamplePoint_ID ~ top + bottom
site(PHO) <- ~ Passive
site(PHO) <- ~ Private
site(PHO) <- ~ Disturbed
site(PHO) <- ~ Anthropogenic
site(PHO) <- ~ Land_Use
site(PHO) <- ~ Park_Name
sdc_PHO <- getSoilDepthClass(PHO, depth.classes = c(very.shallow = 300, 
                                                    shallow = 400, 
                                                    mod.deep = 500, 
                                                    deep = 600, 
                                                    very.deep = 700), 
                             name="Horizon",top="top",bottom="bottom")
v <- c('Passive', 'Private', 'Anthropogenic', 'Disturbed', 'very.shallow',
       'shallow', 'mod.deep', 'deep', 'very.deep')
x <- diagnosticPropertyPlot(PHO, v, k=5, id="SamplePoint_ID")
x <- diagnosticPropertyPlot2(PHO, v, k=5, id="SamplePoint_ID")

##SAN
Full1_updated1[2105:2364,]->SAN
depths(SAN) <- SamplePoint_ID ~ top + bottom
site(SAN) <- ~ Passive
site(SAN) <- ~ Private
site(SAN) <- ~ Disturbed
site(SAN) <- ~ Anthropogenic
site(SAN) <- ~ Land_Use
site(SAN) <- ~ Park_Name
sdc_SAN <- getSoilDepthClass(SAN, depth.classes = c(very.shallow = 300, 
                                                    shallow = 400, 
                                                    mod.deep = 500, 
                                                    deep = 600, 
                                                    very.deep = 700), 
                             name="Horizon",top="top",bottom="bottom")
v <- c('Passive', 'Private', 'Anthropogenic', 'Disturbed', 'very.shallow',
       'shallow', 'mod.deep', 'deep', 'very.deep')
x <- diagnosticPropertyPlot(SAN, v, k=5, id="SamplePoint_ID")
x <- diagnosticPropertyPlot2(SAN, v, k=5, id="SamplePoint_ID")

##TAC
Full1_updated1[2365:2439,]->TAC
depths(TAC) <- SamplePoint_ID ~ top + bottom
site(TAC) <- ~ Passive
site(TAC) <- ~ Private
site(TAC) <- ~ Disturbed
site(TAC) <- ~ Anthropogenic
site(TAC) <- ~ Land_Use
site(TAC) <- ~ Park_Name
sdc_TAC <- getSoilDepthClass(TAC, depth.classes = c(very.shallow = 300, 
                                                    shallow = 400, 
                                                    mod.deep = 500, 
                                                    deep = 600, 
                                                    very.deep = 700), 
                             name="Horizon",top="top",bottom="bottom")
v <- c('Passive', 'Private', 'Anthropogenic', 'Disturbed', 'very.shallow',
       'shallow', 'mod.deep', 'deep', 'very.deep')
x <- diagnosticPropertyPlot(TAC, v, k=5, id="SamplePoint_ID")
x <- diagnosticPropertyPlot2(TAC, v, k=5, id="SamplePoint_ID")
