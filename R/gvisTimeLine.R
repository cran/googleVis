### File R/gvisPieChart.R
### Part of the R package googleVis
### Copyright 2010, 2011, 2012, 2013 Markus Gesmann, Diego de Castillo

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

gvisTimeLine <- function(data, rowlabel="", barlabel="", start="", end="", options=list(), chartid){

  my.type <- "TimeLine"
  dataName <- deparse(substitute(data))

  my.options <- list(gvis=modifyList(list(width=500, height=100),options), dataName=dataName,
                     data=list(rowlabel=rowlabel, barlabel=barlabel, start=start, end=end,
                       allowed=c("number", "string", "date"))
                     )

 
  checked.data <- gvisCheckTimeLineData(data, my.options)
  
  output <- gvisChart(type=my.type, checked.data=checked.data, options=my.options,
                      chartid=chartid, package="timeline") 
  
  return(output)
}

gvisCheckTimeLineData <- function(data, options){

  data.structure <- list(
                         rowlabel = list(mode="required", FUN=check.char),
                         barlabel = list(mode="optional", FUN=check.char),
                         start = list(mode="required", FUN=check.num),
                         end = list(mode="required", FUN=check.num)
                         )
  x <- gvisCheckData(data=data, options=options, data.structure=data.structure)

  return(data)
}

