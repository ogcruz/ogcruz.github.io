#Installing anomalize
install.packages('anomalize')

ldeaths.df <- tibble(tempo=time(ldeaths),obitos=ldeaths,mes=cycle(ldeaths),tdata= seq(as.Date('1974-01-01'),as.Date('1979-12-1'),by='month'))

ldeaths.df %>% 
  time_decompose(obitos, method = "stl", frequency = "auto", trend = "auto") %>%  
  anomalize(remainder, method = "gesd", alpha = 0.05, max_anoms = 0.1) %>% 
  plot_anomaly_decomposition()

ldeaths.df %>% 
  time_decompose(obitos, method = "stl", frequency = "auto", trend = "auto") %>%  
  anomalize(remainder) %>% 
  time_recompose() %>% 
 plot_anomalies(time_recomposed = TRUE, ncol = 3, alpha_dots = 0.5)
