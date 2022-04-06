#'============================================================================
#' Enviromics em Melhoramento de Plantas - 2022 - GenMelhor
#'============================================================================
#'
#' Script n02: Introducao ao Modulo 1 do pacote EnvRtype
#'           : Modulo 1: Coleta e processamento de dados remotos
#' 
#' Autor     : Germano Costa Neto
#' Data      : 06-04-2022
#' Atualizado:
#' 
#' Precisa de ajuda? fale no forum publico:
#' https://groups.google.com/u/1/g/envrtype?pli=1
#' 
#'============================================================================

#' Pacotes uteis

require(EnvRtype)
require(plyr)
require(reshape2)
require(superheat)
require(viridis)
require(FactoMineR)

### Download de Dados Climaticos ####
#'============================================================================
# Funcao chave: EnvRtype::get_weather()
# Example Nairobi, Kenya (latitude 1.367 N, longitude 36.834 E) from 01 march 2015 to 01 April 2015.
# Use decimal values for the coordinates (negative for west and south). Use year-month-day structure for date values (YYYY-MM-DD).

require(EnvRtype)
env.data = get_weather(env.id = 'NAIROBI',country = 'KEN',
                       lat = -1.367,lon = 36.834,
                       start.day = '2015-03-01',end.day = '2015-04-01')

head(env.data)

#saveRDS(object = env.data,file = 'Nairobi')

env.data <- readRDS('Nairobi')


### Download de rasters de cenarios climaticos  ####
#'============================================================================
# Funcao chave: raster::getData() e EnvRtype::extract_GIS()
require(raster)

getData('worldclim', var='tmin', res=10, lon=36.834, lat=-1.367) # temperature min (average across years)
getData('worldclim', var='bio', res=10) # bioclimatic variables
getData('CMIP5', var='tmin', res=10, rcp=85, model='AC', year=70) # different scenarios (see https://www.worldclim.org/)

# voce pode ir direto em https://worldclim.org/data/worldclim21.html para baixar dados historicos
# ou ir direto em https://worldclim.org/data/cmip6/cmip6climate.html para baixar dados de cenarios futuros
# entao usar o extract_GIS como definido abaixo!




### Download de rasters de solos   ####
#'============================================================================
# Funcao chave: raster::getData() e EnvRtype::extract_GIS()

data("clay_5_15") # dados de argila para o Kenya

clay_data = extract_GIS(covraster = clay_5_15,name.out = 'clay_5_15',env.data = env.data)
head(env.data)


env.data = extract_GIS(covraster = clay_5_15,name.out = 'clay_any_name_you_want',env.data = env.data)
head(env.data)

# vamos brincar:
# (1) baixe sue raster em soil.grids (raster GeoTIFF file)
# (2) salve no seu computador
# (3) leia com seuraster <- raster('nomedoraster')
# (4) use o extract_GIS para extrair os valores pontuais dentro do raster

### Download de Dados Climaticos - Modo 'Profissional' ####
#'============================================================================

env = c('GOI','TEX','BRI','MON','LOS','PON','CAL','PAL')
lat = c(-16.67,19.25,-27.47,43.61,14.170,6.294,3.261,-10.168)
lon = c(-49.25,-99.50,153.02,3.87,121.241,2.361,-76.312,-48.331)
cou = c('BRA','MEX','AUS','FRA','PHL','BEN','COL','BRA')
start = c('2020-03-15','2019-05-15','2018-09-15',
          '2017-06-18','2017-05-18','2016-07-18',
          '2017-11-18','2017-12-18')
end = c('2020-04-15','2019-06-15','2018-10-15',
        '2017-07-18','2017-06-18','2016-08-18',
        '2017-12-18','2018-01-18')


env.data = get_weather(env.id = env, lat = lat, lon = lon, start.day = start, end.day = end)
head(env.data)


# Jeito pro-McGayver
# usando paralelizacao

require(doParallel)
require(foreach)

cl <- makeCluster(3) # number of clusters
registerDoParallel(cl)

myData = foreach(ENV = 1:length(env), .combine = "rbind") %dopar%
  {
    cat(paste0('doing....',env[ENV],'\n'))
    myEnvData = EnvRtype::get_weather(
      env.id     = env  [ENV], 
      lat       = lat  [ENV], 
      lon       = lon  [ENV], 
      start.day = start[ENV], 
      end.day   = end  [ENV],
      country   = cou  [ENV]
      
    )
    
    return(myEnvData)
    
  }

stopCluster(cl)

head(myData)

# usando a funcao adaptada pelo Prof Dr. Tiago Olivoto
# ele corrigiu alguns problemas vinculados ao "bug do NASA POWER"
# funcao util pra baixar um numero ENORME de ambientes de uma soh vez

source('https://raw.githubusercontent.com/allogamous/EnvRtype/master/Supplementary%20Source%20and%20Data/get_weather_v2')

env = c('GOI','TEX','BRI','MON','LOS','PON','CAL','PAL')
lat = c(-16.67,19.25,-27.47,43.61,14.170,6.294,3.261,-10.168)
lon = c(-49.25,-99.50,153.02,3.87,121.241,2.361,-76.312,-48.331)
cou = c('BRA','MEX','AUS','FRA','PHL','BEN','COL','BRA')
start = c('2020-03-15','2019-05-15','2018-09-15',
          '2017-06-18','2017-05-18','2016-07-18',
          '2017-11-18','2017-12-18')
end = c('2020-04-15','2019-06-15','2018-10-15',
        '2017-07-18','2017-06-18','2016-08-18',
        '2017-12-18','2018-01-18')

df_climate <-
  get_weather2(env.id = env,
               lat = lat,
               lon = lon,
               start.day = start,
               end.day = end,
               parallel = TRUE,
               country = "BRA")



### Download de dados de solo ###
#'============================================================================


### Processamento de dados
#'============================================================================
# dados de temperatura EnRtype::param_temperature()

TempData = param_temperature(env.data = env.data,Tbase1 = 8,Tbase2 = 45,Topt1 = 30,Topt2 = 35)
head(TempData)
env.data = param_temperature(env.data = env.data,Tbase1 = 8,Tbase2 = 45,Topt1 = 30,Topt2 = 35,merge = TRUE)
head(env.data) # merging TempData automatically

# dados de radiacao EnvRtype::param_radiation()

RadData = param_radiation(env.data = env.data) 
head(RadData)
env.data = param_radiation(env.data = env.data,merge = TRUE)


# dados de "atmosfera" EnvRtype::param_atmospheric()

AtmData  = param_atmospheric(env.data = env.data, Alt = 1628) 
head(AtmData)
env.data = param_atmospheric(env.data = env.data, Alt = 1628,merge = TRUE)
# or
env.data = param_atmospheric(env.data = env.data, merge = TRUE)
head(env.data)


# Sumarizacao e estatisticas basicas
#'============================================================================


summaryWTH(env.data = env.data, env.id = 'env', days.id = 'daysFromStart',statistic = 'mean')
summaryWTH(env.data = env.data) # by default



# Criacao de Tipologias Ambientais
#'============================================================================

# Basic use of env_typing for typing temperature in Los Baños, Philipines, from 2000 to 2020 ################ 
env.data = get_weather(env.id = 'LOSBANOS',country = 'PHL',
                       lat = 14.170,lon = 121.241,variables.names = 'T2M',
                       start.day = '2000-03-01',end.day = '2020-03-01')

card = list(T2M=c(0,8,15,28,40,45,Inf)) # a list of vectors containing empirical and cardinal thresholds

env_typing(env.data = env.data,env.id = 'env', var.id = 'T2M', cardinals = card)

# usando mais de uma variavel, p.ex: duas variaveis

var = c("PRECTOT", "T2MDEW") # variables
env.data = get_weather(env.id = 'LOSBANOS',country = 'PHL',
                       lat = 14.170,lon = 121.241,variables.names = var,
                       start.day = '2000-03-01',end.day = '2020-03-01')
card = list(PRECTOT = c(0,5,10,25,40,100), T2MDEW = NULL) # cardinals and data-driven limits
env_typing(env.data = env.data,env.id = 'env', var.id = var, cardinals = card)


# usando diversas variaveis: exercicio

### fim do dia 01
#'============================================================================
# PLOS:
#'============================================================================


################ Descobrindo tipologias entre localidades ################
# Passo 1: download dos dados climaticos

env = c('GOI','TEX','BRI','MON','LOS','PON','CAL','PAL','DAV')
lat = c(-16.67,19.25,-27.47,43.61,14.170,6.294,3.261,-10.168,38.321)
lon = c(-49.25,-99.50,153.02,3.87,121.241,2.361,-76.312,-48.331,-121.442)
start = c('2020-03-15','2019-05-15','2018-09-15',
          '2017-06-18','2017-05-18','2016-07-18',
          '2017-11-18','2017-12-18','2018-07-18')
end = c('2020-04-15','2019-06-15','2018-10-15',
        '2017-07-18','2017-06-18','2016-08-18',
        '2017-12-18','2018-01-18','2018-08-18')

env.data = get_weather(env.id = env, lat = lat, lon = lon, start.day = start, end.day = end)

# Passo 2: computar as tipologias e suas frequencias

ET = env_typing(env.data = env.data,env.id = 'env',var.id = 'T2M',format = 'wide')

# podemos tambem calcular "variaveis ambientais centradas na media" (maiores detalhes amanha)
EC = W_matrix(env.data = env.data,var.id = 'T2M')
distances = env_kernel(env.data = ET,gaussian = T)[[2]] 
kinship   = env_kernel(env.data = EC,gaussian = F, sd.tol = 3)[[2]]

ET = env_typing(env.data = env.data,env.id = 'env',var.id = 'T2M',format = 'long')

# Passo 3: Uma figura pode ser util
require(ggplot2)
ggplot() + 
  scale_x_discrete(expand = c(0,0))+
  scale_y_continuous(labels = scales::percent,expand = c(0,0))+
  geom_bar(data=ET, aes(y=Freq, x=env,fill=env.variable), 
           position = "fill",stat = "identity",colour='white',width = 1,size=.2)+
  # scale_y_continuous(labels = scales::percent,expand = c(0,0))+ #coord_flip()+
  ylab('Frequency of Occurence\n')+ 
  xlab("\nEnvironment")+
  labs(fill='Envirotype')+
  scale_fill_manual(values = c('blue4','green4',"orange",'red'))+
  theme(axis.title = element_text(size=19),
        axis.text = element_text(size=15),
        legend.text = element_text(size=12),
        strip.text = element_text(size=20),
        legend.title = element_text(size=17),
        strip.background = element_rect(fill="gray95",size=1),
        legend.position = 'right')

# heatmaps legais!
require(superheat)
require(viridis)
## other plot
superheat(distances,
          #  pretty.order.rows = TRUE,
          #   pretty.order.cols = TRUE,
          row.dendrogram = F,
          col.dendrogram = T,
          grid.vline.col = "white",
          grid.hline.col = "white",
          #row.dendrogram = T,
          legend.width = 4,
          left.label.size = 0.1,
          bottom.label.text.size = 5,
          bottom.label.size = 0.2,
          bottom.label.text.angle = 90,
          heat.pal = viridis::inferno(100),
          #heat.pal = viridis::magma(100),
          legend.text.size = 17,
          #   X.text = round(as.matrix(a),1),X.text.col="white",
          legend.height=0.2)

require(FactoMineR)

PCA_ambientes <- PCA(distances)
clusters_HCPC <- HCPC(PCA_ambientes,nb.clust = -1)

# Pergunta: o que podemos fazer para agrupar os ambientes? quais outros algoritimos?

