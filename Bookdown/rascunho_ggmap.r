options(download.file.method='libcurl',url.method='libcurl')

# load package
library(sjPlot)
library(sjmisc)
library(sjlabelled)

mod <- lm (wt ~ hp,data=mtcars)

tab_model(mod0,rm.terms = ignorar)


? tab_model

library(stargazer)
stargazer(mod0,type = 'html',keep="S(X,Y)", omit.labels="S(X,Y)")


library(ggmap)
xxx <- st_centroid(st_geometry(st_transform(casos.pt,4326)))
yyy <- as.data.frame(as_Spatial(xxx))
names(yyy) <- c('X','Y')
yyy$sexo <- casos.pt$CS_SEXO
qmplot(X,Y,data=yyy,color=sexo,alpha=0.4,zoom=14)
