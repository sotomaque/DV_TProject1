require("jsonlite")
require("RCurl")
require(ggplot2)
require(dplyr)
require(extrafont)

df <- data.frame(fromJSON(getURL(URLencode('skipper.cs.utexas.edu:5001/rest/native/?query="select * from SOCIALMEDIADATA"'),httpheader=c(DB='jdbc:oracle:thin:@sayonara.microlab.cs.utexas.edu:1521:orcl', USER='C##cs329e_es29937', PASS='orcl_es29937', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))

ggplot() + 
  coord_cartesian() + 
  scale_x_continuous() +
  scale_y_continuous() +
  #facet_grid(FATALITIES, labeller=label_both) +
  labs(title='Scatter Plot') +
  labs(x="TWITTER", y=paste("FACEBOOK")) +
  layer(data=df, 
        mapping=aes(x=TWITTER, y=as.numeric(as.character(FACEBOOK))), 
        stat="identity", 
        stat_params=list(), 
        geom="point",
        geom_params=list(), 
        #position=position_identity()
        position=position_jitter(width=0.3, height=0)
  )
