library(DiagrammeR) # Diagramme
library(networkD3)  # Network
grViz("
  digraph {
    layout = twopi
    node [shape = circle]
    A -> {B C D} 
  }")


 #Network
data(MisLinks, MisNodes)
forceNetwork(Links = MisLinks, Nodes = MisNodes, Source = "source",
             Target = "target", Value = "value", NodeID = "name",
             Group = "group", opacity = 0.4)


library(visNetwork) #Network
nodes <- data.frame(id = 1:6, title = paste("node", 1:6), 
                    shape = c("dot", "square"),
                    size = 10:15, color = c("blue", "red"))
edges <- data.frame(from = 1:5, to = c(5, 4, 6, 3, 3))
visNetwork(nodes, edges) %>%
  visOptions(highlightNearest = TRUE, nodesIdSelection = TRUE)


library(DT) #Data table display
datatable(iris, options = list(pageLength = 5))
# colnames(iris) is a character vector of length 5, and we replace it
datatable(head(iris), colnames = c('Here', 'Are', 'Some', 'New', 'Names'))
datatable(head(iris), colnames = c('A Better Name' = 'Sepal.Width'))
datatable(head(iris), colnames = c('Another Better Name' = 2, 'Yet Another Name' = 4))
# change the first column name to 'ID'
datatable(head(iris), colnames = c('ID' = 1))

# a custom table container
sketch = htmltools::withTags(table(
  class = 'display',
  thead(
    tr(
      th(rowspan = 2, 'Species'),
      th(colspan = 2, 'Sepal'),
      th(colspan = 2, 'Petal')
    ),
    tr(
      lapply(rep(c('Length', 'Width'), 2), th)
    )
  )
))
print(sketch)

# use rownames = FALSE here because we did not generate a cell for row names in
# the header, and the header only contains five columns
datatable(iris[1:20, c(5, 1:4)], container = sketch, rownames = FALSE)

# a custom table with both header and footer

datatable(
  head(iris, 10),
  container = sketch, options = list(pageLength = 5, dom = 'tip'), rownames = FALSE
)

#Table caption
datatable(
  head(iris),
  caption = 'Table 1: This is a simple caption for the table.'
)

# display the caption at the bottom, and <em> the caption
datatable(
  head(iris),
  caption = htmltools::tags$caption(
    style = 'caption-side: bottom; text-align: center;',
    'Table 2: ', htmltools::em('This is a simple caption for the table.')
  )
)

#Column filters

iris2 = iris[c(1:10, 51:60, 101:110), ]
datatable(iris2, filter = 'top', options = list(
  pageLength = 5, autoWidth = TRUE
))

#Below is a simple example to demonstrate filters for character, date, and time columns:
  
  d = data.frame(
    names = rownames(mtcars),
    date = as.Date('2015-03-23') + 1:32,
    time = as.POSIXct('2015-03-23 12:00:00', tz = 'UTC') + (1:32) * 5000,
    stringsAsFactors = FALSE
  )
str(d)
## 'data.frame':    32 obs. of  3 variables:
##  $ names: chr  "Mazda RX4" "Mazda RX4 Wag" "Datsun 710" "Hornet 4 Drive" ...
##  $ date : Date, format: "2015-03-24" "2015-03-25" ...
##  $ time : POSIXct, format: "2015-03-23 13:23:20" "2015-03-23 14:46:40" ...
datatable(d, filter = 'bottom', options = list(pageLength = 5))




library(d3heatmap) # Heat Maps
d3heatmap(mtcars, scale="column", colors="Blues")


library(dygraphs) #Time series
dygraph(nhtemp, main = "New Haven Temperatures") %>% 
  dyRangeSelector(dateWindow = c("1920-01-01", "1960-01-01"))



library(DiagrammeR)
grViz("
digraph boxes_and_circles {
      
      # a 'graph' statement
      graph [overlap = true, fontsize = 10]
      
      # several 'node' statements
      node [shape = box,
      fontname = Helvetica]
      A; B; C; D; E; F
      
      node [shape = circle,
      fixedsize = true,
      width = 0.9] // sets as circles
      1; 2; 3; 4; 5; 6; 7; 8
      
      # several 'edge' statements
      A->1 B->2 B->3 B->4 C->A
      1->D E->A 2->4 1->5 1->F
      E->6 4->6 5->7 6->7 3->8
      }
      ")

