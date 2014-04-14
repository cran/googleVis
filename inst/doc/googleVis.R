### R code from vignette source 'googleVis.Rnw'

###################################################
### code chunk number 1: options
###################################################
options(prompt = "R> ", digits = 4, show.signif.stars = FALSE)


###################################################
### code chunk number 2: googleVis.Rnw:246-281 (eval = FALSE)
###################################################
## ## Code for screen shot
## MC <- gvisMotionChart(Fruits, "Fruit", "Year", options=list(width=500, height=300))
## ATL <- gvisAnnotatedTimeLine(Stock, datevar="Date",
##                            numvar="Value", idvar="Device",
##                            titlevar="Title", annotationvar="Annotation",
##                            options=list(
##                              width=300, height=300,
##                              fill=10, displayExactValues=TRUE,
##                              colors="['#0000ff','#00ff00']")
##                            )
##                           
## Map <- gvisMap(Andrew, "LatLong" , "Tip",
##               options=list(showTip=TRUE, showLine=TRUE, enableScrollWheel=TRUE,
##                            mapType='terrain', useMapTypeControl=TRUE,
##                            width=400, height=200))
## Geo <- gvisGeoMap(Exports, locationvar='Country', numvar='Profit',
##                  options=list(dataMode="regions", width=400,height=200)) 
## 
## ## Table with enabled paging
## Table <- gvisTable(Population, options=list(page='enable', height=200, width=500))
## 
## Tree <- gvisTreeMap(Regions,  "Region", "Parent", "Val", "Fac",
##                     options=list(width=300, height=200,
##                                  fontSize=16,
##                                  minColor='#EDF8FB',
##                                  midColor='#66C2A4',
##                                  maxColor='#006D2C',
##                                  headerHeight=20,
##                                  fontColor='black',
##                                  showScale=TRUE))
## 
## M <- gvisMerge(gvisMerge(gvisMerge(MC, ATL, TRUE, tableOptions="cellspacing=10"), 
##                          gvisMerge(Map, Geo, TRUE, tableOptions="cellspacing=10")), 
##                          gvisMerge(Table, Tree, TRUE, tableOptions="cellspacing=10"))
## plot(M)


###################################################
### code chunk number 3: googleVis.Rnw:297-298 (eval = FALSE)
###################################################
## install.packages('googleVis') 


###################################################
### code chunk number 4: googleVis.Rnw:302-303
###################################################
library(googleVis)


###################################################
### code chunk number 5: googleVis.Rnw:305-306 (eval = FALSE)
###################################################
## library(googleVis)


###################################################
### code chunk number 6: googleVis.Rnw:308-309
###################################################
cat(googleVis:::gvisWelcomeMessage())


###################################################
### code chunk number 7: googleVis.Rnw:338-339 (eval = FALSE)
###################################################
## help('gvisMotionChart')


###################################################
### code chunk number 8: googleVis.Rnw:384-386
###################################################
data(Fruits)
Fruits


###################################################
### code chunk number 9: googleVis.Rnw:393-394
###################################################
 M <- gvisMotionChart(Fruits, idvar="Fruit", timevar="Year")


###################################################
### code chunk number 10: googleVis.Rnw:398-399 (eval = FALSE)
###################################################
##  str(M)


###################################################
### code chunk number 11: googleVis.Rnw:401-403
###################################################
## This statement avoids truncation
cat(paste(substring( capture.output( str(M) ) , 0, 66), sep="\n", collapse="\n"))


###################################################
### code chunk number 12: googleVis.Rnw:408-410
###################################################
M$type
M$chartid


###################################################
### code chunk number 13: googleVis.Rnw:417-418
###################################################
print(M, tag='header')


###################################################
### code chunk number 14: googleVis.Rnw:433-434
###################################################
names(M$html$chart)


###################################################
### code chunk number 15: googleVis.Rnw:437-438
###################################################
print(M, tag='chart')  ## or cat(M$html$chart)


###################################################
### code chunk number 16: googleVis.Rnw:441-442 (eval = FALSE)
###################################################
## cat(M$html$chart['jsChart']) # or print(M, 'jsChart')


###################################################
### code chunk number 17: googleVis.Rnw:444-445
###################################################
cat(paste(substring( capture.output( cat(M$html$chart['jsChart']) ) , 0, 66), sep="\n", collapse="\n"))


###################################################
### code chunk number 18: googleVis.Rnw:450-451 (eval = FALSE)
###################################################
## print(M, tag='caption')


###################################################
### code chunk number 19: googleVis.Rnw:453-454
###################################################
cat(paste(substring( capture.output( cat(M$html$caption) ) , 0, 66), sep="\n", collapse="\n"))


###################################################
### code chunk number 20: googleVis.Rnw:457-458 (eval = FALSE)
###################################################
## print(M, tag='footer')


###################################################
### code chunk number 21: googleVis.Rnw:460-461
###################################################
cat(paste(substring( capture.output( cat(M$html$footer) ) , 0, 66), sep="\n", collapse="\n"))


###################################################
### code chunk number 22: googleVis.Rnw:468-469 (eval = FALSE)
###################################################
## plot(M)  # returns invisibly the file name


###################################################
### code chunk number 23: googleVis.Rnw:484-485 (eval = FALSE)
###################################################
## print(M, file="myGoogleVisChart.html")


###################################################
### code chunk number 24: googleVis.Rnw:514-515 (eval = FALSE)
###################################################
## plot.gvis("/Users/JoeBloggs/myGoogleVisChart.html")


###################################################
### code chunk number 25: googleVis.Rnw:571-580
###################################################
G <- gvisGeoChart(Exports, "Country", "Profit", 
                  options=list(width=200, height=100))
T <- gvisTable(Exports, 
                  options=list(width=200, height=270))
M <- gvisMotionChart(Fruits, "Fruit", "Year",
                     options=list(width=400, height=370))
GT <- gvisMerge(G,T, horizontal=FALSE) 
GTM <- gvisMerge(GT, M, horizontal=TRUE, 
                 tableOptions="bgcolor=\"#CCCCCC\" cellspacing=10")


###################################################
### code chunk number 26: googleVis.Rnw:582-583 (eval = FALSE)
###################################################
## plot(GTM)


###################################################
### code chunk number 27: googleVis.Rnw:603-624 (eval = FALSE)
###################################################
## df <- data.frame(country=c("US", "GB", "BR"), 
##                         val1=c(1,3,4), val2=c(23,12,32))
## 
## Line <-  gvisLineChart(df, xvar="country", yvar=c("val1","val2"),
##                         options=list(
##                           title="Hello World",
##                           titleTextStyle="{color:'red', 
##                                            fontName:'Courier', 
##                                            fontSize:16}",                         
##                           backgroundColor="#D3D3D3",                          
##                           vAxis="{gridlines:{color:'red', count:3}}",
##                           hAxis="{title:'Country', titleTextStyle:{color:'blue'}}",
## 		          series="[{color:'green', targetAxisIndex: 0},	
##                                    {color: 'orange',targetAxisIndex:1}]",
##                           vAxes="[{title:'val1'}, {title:'val2'}]",
##                           legend="bottom",
##                           curveType="function",
##                           width=500,
##                           height=300                         
##                           ))
## plot(Line)


###################################################
### code chunk number 28: googleVis.Rnw:672-680 (eval = FALSE)
###################################################
## Geo <- gvisGeoChart(CityPopularity, locationvar='City', 
##                     colorvar='Popularity',
##                      options=list(region='US', height=350, 
##                       displayMode='markers',
##             	      colorAxis="{values:[200,400,600,800],
##                        colors:[\'red', \'pink\', \'orange',\'green']}")
##                       ) 
## plot(Geo)


###################################################
### code chunk number 29: googleVis.Rnw:698-700 (eval = FALSE)
###################################################
## Editor <- gvisLineChart(df, options=list(gvis.editor='Edit me!'))
## plot(Editor)


###################################################
### code chunk number 30: googleVis.Rnw:722-729
###################################################
df <- data.frame("Year"=c(2009,2010), "Lloyd\\'s"=c(86.1, 93.3), 
                 "Munich Re\\'s R/I"=c(95.3, 100.5),
                 check.names=FALSE) 
df
CR <- gvisColumnChart(df, options=list(vAxis='{baseline:0}', 
                            title="Combined Ratio %",
                            legend="{position:'bottom'}"))


###################################################
### code chunk number 31: googleVis.Rnw:731-732 (eval = FALSE)
###################################################
## plot(CR)


###################################################
### code chunk number 32: googleVis.Rnw:750-751 (eval = FALSE)
###################################################
## print(M, 'chart')  ## or cat(M$html$chart) 


###################################################
### code chunk number 33: googleVis.Rnw:754-755 (eval = FALSE)
###################################################
## print(M, 'chart', file='myfilename')


###################################################
### code chunk number 34: googleVis.Rnw:776-778 (eval = FALSE)
###################################################
## M <- gvisMotionChart(Fruits, "Fruit", "Year",
## 		     options=list(width=400, height=370))


###################################################
### code chunk number 35: googleVis.Rnw:781-782 (eval = FALSE)
###################################################
## print(M, 'chart')


###################################################
### code chunk number 36: googleVis.Rnw:819-821
###################################################
M <- gvisMotionChart(Fruits, "Fruit", "Year")
G <- createGoogleGadget(M)


###################################################
### code chunk number 37: googleVis.Rnw:823-824 (eval = FALSE)
###################################################
## cat(G, file="myGadget.xml")


###################################################
### code chunk number 38: googleVis.Rnw:904-907 (eval = FALSE)
###################################################
## library(R.rsp) 
## browseRsp() 
## # Follow the link for googleVis in the opening browser window


###################################################
### code chunk number 39: googleVis.Rnw:911-912 (eval = FALSE)
###################################################
## file.path(system.file("rsp", package = "googleVis"), "index.rsp")


###################################################
### code chunk number 40: googleVis.Rnw:970-971 (eval = FALSE)
###################################################
## install.packages('brew')


###################################################
### code chunk number 41: googleVis.Rnw:1005-1006 (eval = FALSE)
###################################################
## system.file("brew", package = "googleVis")


###################################################
### code chunk number 42: googleVis.Rnw:1030-1070 (eval = FALSE)
###################################################
## require(Rook)
## require(googleVis)
## s <- Rhttpd$new()
## s$start(listen='127.0.0.1')
## 
## my.app <- function(env){
##  ## Start with a table and allow the user to upload a CSV-file
##   req <- Request$new(env)
##   res <- Response$new()
## 
##   ## Provide some data to start with
##   ## Exports is a sample data set of googleVis
##   data <- Exports[,1:2] 
##   ## Add functionality to upload CSV-file
##   if (!is.null(req$POST())) {
##     ## Read data from uploaded CSV-file
##    data <- req$POST()[["data"]]
##    data <- read.csv(data$tempfile)
##   }
##   ## Create table with googleVis
##   tbl <- gvisTable(data, 
##                    options=list(gvis.editor="Edit me!",
##                                 height=350),
##                                 chartid="myInitialView")
##   ## Write the HTML output and
##   ## make use of the googleVis HTML output.
##   ## See vignette('googleVis') for more details
##   res$write(tbl$html$header) 
##   res$write("<h1>My first Rook app with googleVis</h1>")
##   res$write(tbl$html$chart)
##   res$write('
## Read CSV file:<form method="POST" enctype="multipart/form-data">
## <input type="file" name="data">
## <input type="submit" name="Go">\n</form>')            
##   res$write(tbl$html$footer)
##   res$finish()
## }
## s$add(app=my.app, name='googleVisTable')
## ## Open a browser window and display the web app
## s$browse('googleVisTable')


###################################################
### code chunk number 43: googleVis.Rnw:1089-1116 (eval = FALSE)
###################################################
## # server.R
## library(googleVis)
## 
## shinyServer(function(input, output) {
##   datasetInput <- reactive({
##     switch(input$dataset,
##            "rock" = rock,
##            "pressure" = pressure,
##            "cars" = cars)
##   })
##   
##   output$view <- renderGvis({
##     gvisScatterChart(datasetInput())
##   })
## })
## 
## # ui.R
## shinyUI(pageWithSidebar(
##   headerPanel("googleVis on Shiny"),
##   sidebarPanel(
##     selectInput("dataset", "Choose a dataset:", 
##                 choices = c("rock", "pressure", "cars"))
##   ),
##   mainPanel(
##     htmlOutput("view")
##   )
## ))


###################################################
### code chunk number 44: googleVis.Rnw:1127-1129 (eval = FALSE)
###################################################
## library(shiny) ## Version >= 0.4.0 required
## runApp(system.file("shiny/", package="googleVis"))


###################################################
### code chunk number 45: googleVis.Rnw:1328-1334 (eval = FALSE)
###################################################
## jscode <- "window.open('http://en.wikipedia.org/wiki/' 
##                   + data.getValue(chart.getSelection()[0].row,0)); "
## 
## J1 <- gvisGeoMap(Exports, locationvar='Country', numvar='Profit',
##                  options=list(dataMode="regions", gvis.listener.jscode=jscode))
## plot(J1)


###################################################
### code chunk number 46: googleVis.Rnw:1337-1339 (eval = FALSE)
###################################################
## plot(gvisOrgChart(Regions,  options=list(gvis.listener.jscode=jscode)))
## plot(gvisLineChart(Regions[,c(1,3)], options=list(gvis.listener.jscode=jscode)))


###################################################
### code chunk number 47: googleVis.Rnw:1343-1351 (eval = FALSE)
###################################################
## jscode <- "
##        var sel = chart.getSelection();
##        var row = sel[0].row;
##        var text = data.getValue(row,1);
##        alert(text);
## "
## J2 <- gvisTable(Population, options=list(gvis.listener.jscode=jscode))
## plot(J2)


###################################################
### code chunk number 48: googleVis.Rnw:1416-1426 (eval = FALSE)
###################################################
## library(googleVis)
## dat <- data.frame(x=LETTERS[1:10], 
##                   y=c(0, 4, -2, 2, 4, 3, 8, 15, 10, 4))
## area1 <- gvisAreaChart(xvar="x", yvar="y", data=dat,
##     	options=list(vAxes="[{viewWindowMode:'explicit',
## 			viewWindow:{min:0, max:10}}]",
##                         width=500, height=400, 
##                         title="y-limits set from 0 to 10"),
## 			chartid="area1ylim")
## plot(area1)


###################################################
### code chunk number 49: googleVis.Rnw:1467-1468 (eval = FALSE)
###################################################
## citation("googleVis")


###################################################
### code chunk number 50: googleVis.Rnw:1471-1472 (eval = FALSE)
###################################################
## citation()


