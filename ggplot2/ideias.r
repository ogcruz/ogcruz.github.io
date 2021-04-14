

 p <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width,color=Species)) +
  geom_jitter(alpha = 1) +
  facet_grid(. ~ Species) +
  stat_smooth(method = "lm", se = F, col = "black")  +
  coord_equal() +
  labs( title = "Comprimento vs largura da Sépala em 3 especies de Lírios",
        subtitle = "Edgar Anderson's Iris Data",
        x="comprimento(cm)" ,
        y ="largura(cm)" ,
        color = "Especie" ) 


 
 
  ggplot(iris, aes(x = Species, y = Sepal.Width,color=Species,fill=Species)) +
   geom_boxplot() +
    coord_flip()
    
  
  ggplot(iris, aes(x = Sepal.Length,color=Species,fill=Species)) + geom_density(alpha=0.5)
  
  ### histograma 
  
  ggplot(iris, aes( Sepal.Length)) + geom_histogram()
  
  
  
  #############
  

  ggplot(iris, aes( Sepal.Length)) + geom_histogram(bins=40)
  
  
  ggplot(iris, aes( Sepal.Length)) + geom_histogram(binwidth = 0.1)
  
  ggplot(iris, aes( Sepal.Length,fill=Species))  + geom_histogram(binwidth = 0.1) 
  
  ggplot(iris, aes( Sepal.Length,fill=Species)) + geom_histogram(bins=40) + coord_polar() + theme_linedraw()
  
  
  
  
  
  ggplot(msleep, aes(vore)) +  geom_bar()  ## bar plot!!!!
  
  
#  "Janeiro",	"Fevereiro",	"Março"	, "Abril",	"Maio", 	"Junho"	, "Julho",	"Agosto",	"Setembro",	"Outubro",	"Novembro", "Dezembro")
 
rio <-   data.frame(
  T_media = c(26.1,	26,	25.2,	23.6,	21.8,	20.9,	20.6,	21,	21.7,	22.5,	23.8,	24.6) ,
  T_minima= c(22.3,	22.4,	21.7,	20.1,	18.2,	17,	16.7,	17,	18,	19,	20.3,	21),
  T_maxima = c(30,	29.7,	28.8,	27.2,	25.5,	24.9,	24.5,	25,	25.4,	26.1,	27.3,	28.2),
  Chuva = c(149,	147,	147,	130,	93,	58,	55,	59,	76,	103,	116,	145) ,
  mes = c("Janeiro",	"Fevereiro",	"Março"	, "Abril",	"Maio", 	"Junho"	, "Julho",	"Agosto",	"Setembro",	"Outubro",	"Novembro", "Dezembro"),
  stringsAsFactors = FALSE)
  

rio$m2 <- factor(rio$mes, levels=as.character(rio$mes))

ggplot(rio,aes(mes,Chuva)) + geom_bar()
ggplot(rio,aes(m2,Chuva)) + geom_bar(stat='identity')

ggplot(rio,aes(m2,Chuva,fill=Chuva)) + geom_bar(stat='identity') + scale_color_continuous()

  
##
  
  ggplot(iris,aes(Sepal.Length))
  
  ##
  
  iris.wide <- iris %>%  gather(tipo, valor, -Species)
  iris.wide %>%  ggplot(aes(tipo,valor,fill=Species)) + geom_boxplot()

  plot(iris$Sepal.Length, iris$Sepal.Width)
  
  ### exemplo com data
 muk <- data.frame(data= lubridate::make_date(rep(1974:1979,each=12),month = rep(1:12,6)) , 
                   ob.tot = as.numeric(ldeaths))
                
 h <- ggplot(muk, aes(data,ob.tot)) 
 h + geom_line() + scale_x_date(name="Anos",date_breaks = "1 year",date_labels = "%Y")
     
 
 
  
  d=data.frame(p=c(0:25,32:127))
  ggplot() +
    scale_y_continuous(name="") +
    scale_x_continuous(name="") +
    scale_shape_identity() +
    geom_point(data=d, mapping=aes(x=p%%16, y=p%/%16, shape=p), size=5, fill="red") +
    geom_text(data=d, mapping=aes(x=p%%16, y=p%/%16+0.25, label=p), size=3) + theme_void()
  
  
  d=data.frame(a=c("a","b","c","d","e","f","g","h", "i", "j", "k", "l"))
  ggplot() +
    scale_x_continuous(limits=c(0,1), breaks=NULL, name="") +
    scale_y_discrete(name=1:12) +
    scale_linetype_discrete() +
    geom_segment(data=d, mapping=aes(x=0, xend=1, y=a, yend=a, linetype=a)) 
  
  
  
  
  
  require(maps)
  d  <- data.frame(map(database="italy", plot=F)[c("x", "y")])
  ggplot() +
    coord_map() +
    geom_polygon(data=d, mapping=aes(x=x, y=y), fill=hsv(0, 1, 0.7), color=hsv(0, 1, 0.5), size=0.2)
  
  
  
 exemplo <-  data.frame(sexo = c( "Feminino","Masculino", "Ignorado"),
             total = c(4567,3567,90))
 
 ggplot(exemplo,aes(sexo)) + geom_bar()
 ggplot(exemplo,aes(total)) + geom_bar()
 
 ggplot(exemplo,aes(sexo,total)) + geom_bar()
 
 
 ggplot(exemplo,aes(sexo,total,fill=sexo)) + geom_bar(stat='identity')
 
  
 exemplo$sexo<- factor(exemplo$sexo, levels=as.character(exemplo$sexo))
 
 
 
 ################
 
 rio <-   data.frame(
   T_media = c(26.1,	26,	25.2,	23.6,	21.8,	20.9,	20.6,	21,	21.7,	22.5,	23.8,	24.6) ,
   T_minima= c(22.3,	22.4,	21.7,	20.1,	18.2,	17,	16.7,	17,	18,	19,	20.3,	21),
   T_maxima = c(30,	29.7,	28.8,	27.2,	25.5,	24.9,	24.5,	25,	25.4,	26.1,	27.3,	28.2),
   Chuva = c(149,	147,	147,	130,	93,	58,	55,	59,	76,	103,	116,	145) ,
   mes = c("Janeiro",	"Fevereiro",	"Março"	, "Abril",	"Maio", 	"Junho"	, "Julho",	"Agosto",	"Setembro",	"Outubro",	"Novembro", "Dezembro"),
   stringsAsFactors = FALSE)
 
 rio$mes <- factor(rio$mes, levels=as.character(rio$mes))
 
 
 ggplot(rio,aes(mes,T_media))  + 
   geom_bar(aes(fill=T_media),stat='identity') +
   scale_fill_gradient(low= "blue",high="red") +
   geom_errorbar(aes(ymin=T_minima,ymax=T_maxima))
 
 
 ggplot(rio,aes(x=as.numeric(mes),y=T_media))  + 
   geom_line() +
   geom_line(aes(y=T_minima,color="blue")) +
   geom_line(aes(y=T_maxima,color="red")) +
 scale_x_continuous(breaks = 1:12)

 
 ggplot(rio,aes(x=as.numeric(mes),y=T_media))  + 
   geom_ribbon(aes(ymin=T_minima,ymax=T_maxima),color='grey',alpha=0.4) +
   geom_smooth(se =  FALSE) +
    scale_x_continuous(breaks = 1:12)
 
 