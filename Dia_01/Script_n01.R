#'============================================================================
#' Enviromics em Melhoramento de Plantas - 2022 - GenMelhor
#'============================================================================
#'
#' Script n01: Conceitos basicos para entendimento de modelos de analise da GxA
#' 
#' Autor     : Germano Costa Neto
#' Data      : 06-04-2022
#' Atualizado:
#' 
#' Precisa de ajuda? fale no forum publico:
#' https://groups.google.com/u/1/g/envrtype?pli=1
#' 
#'============================================================================


# Instalar o Pacote
#'============================================================================

library(devtools)
install_github('allogamous/EnvRtype')
library(EnvRtype)


# jeito que eu mais uso:

source("https://raw.githubusercontent.com/allogamous/EnvRtype/master/sourceEnvRtype.R")

# funcoes especificas:

source('https://raw.githubusercontent.com/allogamous/EnvRtype/master/R/AtmosphericPAram.R')
source('https://raw.githubusercontent.com/allogamous/EnvRtype/master/R/SradPARAM.R')
source('https://raw.githubusercontent.com/allogamous/EnvRtype/master/R/SupportFUnction.R')
source('https://raw.githubusercontent.com/allogamous/EnvRtype/master/R/EnvTyping.R')
source('https://raw.githubusercontent.com/allogamous/EnvRtype/master/R/Wmatrix.R')
source('https://raw.githubusercontent.com/allogamous/EnvRtype/master/R/covfromraster.R')
source('https://raw.githubusercontent.com/allogamous/EnvRtype/master/R/envKernel.R')
source('https://raw.githubusercontent.com/allogamous/EnvRtype/master/R/gdd.R')
source('https://raw.githubusercontent.com/allogamous/EnvRtype/master/R/getGEenriched.R')
source('https://raw.githubusercontent.com/allogamous/EnvRtype/master/R/get_weather_gis.R')
source('https://raw.githubusercontent.com/allogamous/EnvRtype/master/R/processWTH.R')
source('https://raw.githubusercontent.com/allogamous/EnvRtype/master/R/met_kernel_model.R')
source('https://raw.githubusercontent.com/allogamous/EnvRtype/master/R/summary_weather.R')


# Hand-on: Conceitos basicos para exercirtar o racicionio (durante a aula, copiem!)
#'============================================================================


home.dir <- getwd()
data.dir <- paste0(home.dir,'/data')

arroz <- readRDS(paste0(data.dir,'/arroz_MET'))

head(arroz)

milho <- readRDS(paste0(data.dir,'/milho_MET'))

head(milho)



