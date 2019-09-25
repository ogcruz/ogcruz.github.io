##

library(tidyverse)
library(sf)
library(maptools)
library(spatstat)

casos <- read_csv('dados/dengue_dourados.csv')

casos.pt <- st_as_sf(casos, coords = c("X", "Y"), crs = 31981)
plot(casos.pt)
plot(casos.pt['CS_SEXO'])

contorno <- read_sf('dados/contorno_dourados.shp')
plot(contorno['ID'])

cont.w <- as.owin(as_Spatial(contorno))
dengue.ppp <- ppp(casos$X,casos$Y,cont.w)

plot(dengue.ppp,pch=19,cex=0.5)


plot(density(dengue.ppp,250,diggle = TRUE),main='kernel 250 m',col=terrain.colors(64))
plot(density(dengue.ppp,500,diggle = TRUE),main='kernel 500 m',col=terrain.colors(64))
plot(density(dengue.ppp,750,diggle = TRUE),main='kernel 750 m',col=terrain.colors(64))
plot(density(dengue.ppp,1000,diggle = TRUE),main='kernel 1000 m',col=terrain.colors(64))
#plot(density(dengue.ppp,2000,diggle = TRUE),main='kernel 2000 m')



masc <- casos %>% filter(CS_SEXO=='M')
masc.ppp <- ppp(masc$X,masc$Y,cont.w)

fem <- casos %>% filter(CS_SEXO=='F')
fem.ppp <- ppp(fem$X,fem$Y,cont.w)


plot(density(masc.ppp,750,diggle = TRUE),main='kernel Homens 750 m')
plot(density(fem.ppp,750,diggle = TRUE),main='kernel Mulheres 750 m')

D.masc <- density(masc.ppp,750,diggle = TRUE)
D.fem  <- density(fem.ppp,750,diggle = TRUE)

bw.diggle(centros.ppp)
D.pop <- density(centros.ppp,500,weights = popsetor$pop,scalekernel = TRUE)
plot(D.pop)

bw.diggle(dengue.ppp)
D.dengue <- density(dengue.ppp,250,diggle = TRUE)
D.res <- D.dengue
D.res$v <- (D.dengue$v / (D.pop$v))*1000
plot(D.res,main='Razao de Kernel dengue/população',col=terrain.colors(64))
#points(centros.ppp,cex=0.3,pch=19,col='white')
points(dengue.ppp,cex=0.3,pch=19,col='#00000040')
###### idade por setor

pop2010 <- read_csv('dados/pop2010.csv')

tmpdir <- tempdir()
download.file('https://gitlab.procc.fiocruz.br/oswaldo/eco2019/raw/master/dados/setores_dourados.zip',
              destfile = paste0(tmpdir,'/dourados.zip'))

unzip(zipfile = paste0(tmpdir,'/dourados.zip'),exdir = tmpdir)
dir(tmpdir)

setor <- read_sf(paste0(tmpdir,'/Setor_UTM_SIRGAS.shp'), crs = 31981)
contorno <- read_sf(paste0(tmpdir,'/contorno.shp'), crs = 31981)
popsetor <- setor %>% mutate (idsetor = as.numeric(CD_GEOCODI)) %>% inner_join(pop2010,by='idsetor')




centros <- st_centroid(st_geometry(popsetor) )

 
centros.tmp <- as.data.frame(as_Spatial(centros))
names(centros.tmp) <- c('X','Y')

centros.ppp <- ppp(centros.tmp$X,centros.tmp$Y,cont.w)

plot(centros.ppp,pch=19,cex=0.5)

kpop <- density(centros.ppp,750,weights = popsetor$pop,scalekernel = TRUE)
plot(kpop)

D.res <- D.masc
D.res$v <- (D.masc$v / D.fem$v)
plot(D.res,main='Razao de Kernel H/M')



# png('~/tmp/teste.png',height = 1024,width = 1024*1.5)
plot(popsetor['pop'],col=terrain.colors(16))
points(dengue.ppp)
plot(casos.pt['CS_SEXO'],add=T,pch=19,col='black',cex=0.5)


ggplot(popsetor) + 
  geom_sf(aes(fill=pop)) + 
  geom_sf(data=casos.pt,color='white',size=0.7) +
  theme_void()

##############

download.file()


############### rascunhos
plot(density(dengue.ppp,750,diggle = TRUE),main='kernel 750 m')
plot(dengue.ppp,)


ggplot(casos.pt) +
    geom_sf(data=contorno,alpha=0) +
  geom_sf(color='red',size=0.5)  +
  theme_void()

w <- as.owin(list(xrange=bbox(cont)[1,],yrange=bbox(cont)[2,]))



###







regions <- slot(cont, "polygons")
regions <- lapply(regions, function(x) { SpatialPolygons(list(x)) })
windows <- lapply(regions, as.owin)


y <- as(cont, "SpatialPolygons")
p <- slot(y, "polygons")
v <- lapply(p, function(z) { SpatialPolygons(list(z)) } )
winlist <- lapply(v, as.owin)
            