plot(popsetor['pop'],pal=terrain.colors(13))
plot(casos.pt['CS_SEXO'],pch=19,add=TRUE)


dengue.ppp.sf <- st_as_sf(as.SpatialPoints.ppp(dengue.ppp), crs = 31981)

plot(dengue.ppp.sf,pch=19,col=2,add=T)


############ 

ggplot(popsetor) + 
  geom_sf(aes(fill=pop)) + 
  geom_sf(data=casos.pt,color='white',size=0.7) +
  theme_void()


###############


sG <- Sobj_SpatialGrid(as_Spatial(contorno),maxDim=50)$SG
gt <- slot(sG,"grid")


contorno.xy <- as.data.frame(slot(slot(slot(as_Spatial(contorno),"polygons")[[1]],"Polygons")[[1]],"coords"))

casos.pt$X <- casos$X
casos.pt$Y <- casos$Y


grade <-  GridTopology(cellcentre.offset=as.numeric(st_bbox(contorno)[c(1,4)]),
                       cellsize=c(10,10),cells.dim=c(239,345))

grd_sf  <-  st_as_sf(contorno, coords = c("lon", "lat"), 
                     crs = 31981, agr = "constant")

st_bbox(contorno)

grade <- expand.grid(X = seq(720900.6,734155.5,length.out = 150),Y = seq(7535267.6,7544897.2 ,length.out = 100) )

library(mgcv)

mod0 <- gam(CLASSI_FIN==1 ~   s(X,Y),data=casos.pt,family = binomial)
mod1 <- gam(CLASSI_FIN==1 ~  CS_SEXO + s(X,Y),data=casos.pt)


TAM <- 400
#caixa <- bbox(cont)
grade <- expand.grid(x=seq(caixa[1],caixa[3],length.out = TAM),y=seq(caixa[2],caixa[4],length.out = TAM))
#inside <- in.out(grade, pbdry, bound=NULL)

inside <- in.out(as.matrix(contorno.xy),as.matrix(grade))


outside <- list(x=seq(caixa[1],caixa[3],length.out = TAM), 
                y=seq(caixa[2],caixa[4],length.out = TAM), z=matrix(rep(0,TAM^2),ncol=TAM) )
outside$z[inside] <- NA 
x <-  outside$x
y <-  outside$y

newgam <- data.frame(X=grade[,1],Y=grade[,2])
gg.pred <- predict(mod0,newdata=newgam, type="terms", terms="s(X,Y)",se.fit=T)

gg.pred$fit[inside==F]<-NA
gg.pred$se.fit[inside==F]<-NA
z <- exp(matrix(gg.pred$fit,TAM,TAM))

## a very rough estimate of confidence intervals 
z.inf <- exp(gg.pred$fit + (1.96 * gg.pred$se.fit))
z.sup <- exp(gg.pred$fit - (1.96 * gg.pred$se.fit))
z.inf <- matrix(z.inf,TAM,TAM)
z.sup <- matrix(z.sup,TAM,TAM)

cores <- c("#053061","#2166ac","#4393c3","#92c5de","#d1e5f0","#f7f7f7","#fddbc7","#f4a582","#d6604d",
           "#b2182b","#67001f")

split.screen(rbind(c(0,.9,0,1), c(.9,1,0,1)))
screen(1) 

image(x,y,z,zlim=range(z, na.rm=T), col=cores, asp=1, xlab="", ylab="", main="",axes=F)   
#points(den$x_coord, den$y_coord, pch=19, col="blue", cex=0.1)
contour(x, y, z.inf, nlevels=1, add=T, col="blue", lwd=2, levels=1,cex=0.1,labels = '<1')
contour(x, y, z.sup, nlevels=1, add=T, col="red", lwd=2, levels=1,cex=0.1,labels = '>1')
polymap(contorno.xy,add=T,lwd=2)

screen(2) # The legend
range(z, na.rm=T) # to make a pretty legend

ticks <- seq(-0.8,0.5,0.2)
ticks <- quantile(na.omit(as.vector(z)),prob=seq(0,1,by=1/3))
ticks <- seq(0.021,4.4,by=0.2)

image.plot(zlim=range(z, na.rm=T), col=cores, axis.args=list(at=ticks, labels=ticks),legend.only=TRUE, smallplot=c(.1,.25, .15,.85), legend.width=3, legend.shrink=.8, horizontal=F)


###### 

