#<!--
#%\VignetteIndexEntry{Using the Google Chart Tools with R}
#%\VignetteEngine{knitr::knitr}
#-->
Using the Google Chart Tools with R
========================================================

Markus Gesmann and Diego de Castillo





### Overview

The googleVis package provides an interface between R and the
Google Chart Tools.  The Google Chart Tools offer interactive
charts which can be embedded into web pages. The best 
known of these charts is probably the Motion Chart, popularised 
by Hans Rosling in his TED talks. 
 
The functions of the googleVis package allow the user to visualise
data stored in R data frames with the Google Chart Tools
without uploading the data to Google. The output of a \googleVis
function is html code that contains the data and references to
JavaScript functions hosted by Google.
  
googleVis makes use of the internal R HTTP server to display the
output locally. A modern browser with an Internet connection is
required and for some charts Flash.


# References





