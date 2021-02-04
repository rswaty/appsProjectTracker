### Try Apps Project Tracker

# Process:
#   * fill out Google Form, data goes to spreadsheet
#   * use gsheet to import data periodically
#   * rerun code
#   * stage-commit-push to github
# 


# get data
library(googlesheets4)

appsProjects <- read_sheet('https://docs.google.com/spreadsheets/d/1XfDIKH37OEOdZ2sJdaO_ui8HDC36bUNBxUk2awcG0Jo/edit#gid=0')


#text for popups
mytext <- paste(
  "Project Name: ", appsProjects$ProjectName,"<br/>", 
  "Person Reporting: ", appsProjects$PersonReporting, "<br/>", 
  "Project category: ", appsProjects$Category, "<br/>",
  sep="") %>%
  lapply(htmltools::HTML)

# make simple map
library(leaflet)
m <-
  leaflet(data = appsProjects) %>%
  addTiles() %>%
  addMarkers(lng = ~Long, lat = ~Lat, popup = mytext, label = ~ProjectName)
  
  library(htmlwidgets)
  saveWidget(m, file="m.html")
