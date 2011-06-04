### File R/gvisCoreCharts.R
### Part of the R package googleVis
### Copyright 2011 Markus Gesmann, Diego de Castillo

### It is made available under the terms of the GNU General Public
### License, version 2, or at your option, any later version,
### incorporated herein by reference.
###
### This program is distributed in the hope that it will be
### useful, but WITHOUT ANY WARRANTY; without even the implied
### warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
### PURPOSE.  See the GNU General Public License for more
### details.
###
### You should have received a copy of the GNU General Public
### License along with this program; if not, write to the Free
### Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
### MA 02110-1301, USA

gvisLineChart <- function(data, xvar="", yvar="", options=list(), chartid){

      gvisCoreChart(data, xvar, yvar, options, chartid, chart.type="LineChart")
  }

gvisAreaChart <- function(data, xvar="", yvar="", options=list(), chartid){

      gvisCoreChart(data, xvar, yvar, options, chartid, chart.type="AreaChart")
  }

gvisBarChart <- function(data, xvar="", yvar="", options=list(), chartid){

      gvisCoreChart(data, xvar, yvar, options, chartid, chart.type="BarChart")
  }

gvisColumnChart <- function(data, xvar="", yvar="", options=list(), chartid){

      gvisCoreChart(data, xvar, yvar, options, chartid, chart.type="ColumnChart")
  }


gvisScatterChart <- function(data, options=list(), chartid){

  my.type <- "ScatterChart"
  dataName <- deparse(substitute(data))

  my.options <- list(gvis=modifyList(list(allowHtml=TRUE),options), dataName=dataName,
                     data=list(allowed=c("number")))
  
  checked.data <- gvisCheckScatterChartData(data)
  
  output <- gvisChart(type=my.type, checked.data=checked.data, options=my.options, chartid=chartid, package="corechart") 
  
  return(output)
}



## plot(gvisScatterChart(women, options=list(legend="none", lineWidth=2, pointSize=0, hAxis.title="weight", title="Women", vAxis="{title:'height'}", hAxis="{title: 'weight'}")))

gvisCheckScatterChartData <- function(data){

  # nothing to check at the moment here
  return(data)
}



gvisCoreChart <- function(data, xvar="", yvar="", options=list(), chartid, chart.type){

   dataName <- deparse(substitute(data))

  my.options <- list(gvis=modifyList(list(allowHtml=TRUE),options), dataName=dataName,
                     data=list(xvar=xvar, yvar=yvar,
                       allowed=c("string", "number"))
                     )

 
  checked.data <- gvisCheckCoreChartData(data, xvar=xvar, yvar=yvar)

  
  output <- gvisChart(type=chart.type, checked.data=checked.data, options=my.options, chartid=chartid, package="corechart") 
  
  return(output)
}



gvisCheckCoreChartData <- function(data, xvar, yvar){

  if(class(data) != "data.frame"){
    stop("Error: data has to be a data.frame.")
  }
  if(xvar=="")
    xvar <- names(data)[1]
  data[,xvar] <- as.character(data[,xvar])

   if("" %in% yvar){
     yvar <- sapply(data, is.numeric)
     yvar <- names(yvar[yvar])
   }
  data <-  data[,c(xvar, yvar)]
  
  return(data)
}