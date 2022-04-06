#'============================================================================
#' Enviromics em Melhoramento de Plantas - 2022 - GenMelhor
#'============================================================================
#'
#' Exercicio_01: Analise Ambiental de uma Localidade
#' 
#' Autor     : Germano Costa Neto
#' Data      : 06-04-2022
#' Atualizado:
#' 
#' Precisa de ajuda? fale no forum publico:
#' https://groups.google.com/u/1/g/envrtype?pli=1
#' 
#'============================================================================


# Passo 1: Escolha uma localidade de interesse e entao:       ####

LAT  = # sua escolha!
LON  = # sua escolha!
NOME = "nomedolocal"

#'-----------------------------------------
#### Download de dados de solo #####
#'-----------------------------------------
# Faca download das layers de solo relacionadas a:
# > Nitrogenio in gc/kg
# > Carbono organico no solo in dg/kg
# > Capacidade de troca de cations (do ingles, CEC) in mmol/kg
# > Densidade do solo in cg/cm3
# > Teor de Argila no Solo in g/kg
# > Teor de Areia no Solo in g/kg

# Pesquise na internet o por que essas proriedades quimicas e fisicas de solo 
# sao importantes para a fisiologia da sua especie.


#'-----------------------------------------
#### Download de dados de clima (bioclimaticos) #####
#'-----------------------------------------
# Faca download das layers bioclimaticas:

# > BIO1 = Annual Mean Temperature
# > BIO2 = Mean Diurnal Range (Mean of monthly (max temp - min temp))
# > BIO3 = Isothermality (BIO2/BIO7) (×100)
# > BIO4 = Temperature Seasonality (standard deviation ×100)
# > BIO5 = Max Temperature of Warmest Month
# > BIO6 = Min Temperature of Coldest Month
# > BIO7 = Temperature Annual Range (BIO5-BIO6)
# > BIO8 = Mean Temperature of Wettest Quarter
# > BIO9 = Mean Temperature of Driest Quarter
# > BIO10 = Mean Temperature of Warmest Quarter
# > BIO11 = Mean Temperature of Coldest Quarter
# > BIO12 = Annual Precipitation
# > BIO13 = Precipitation of Wettest Month
# > BIO14 = Precipitation of Driest Month
# > BIO15 = Precipitation Seasonality (Coefficient of Variation)
# > BIO16 = Precipitation of Wettest Quarter
# > BIO17 = Precipitation of Driest Quarter
# > BIO18 = Precipitation of Warmest Quarter
# > BIO19 = Precipitation of Coldest Quarter

# Onde devemos usar essas variavies?
# como devemos usar? qual eh a resolucao esperada? (resolucao biologica)


#'-----------------------------------------
#### Download de dados de clima do NASA POWER #####
#'-----------------------------------------

start = 'YYYY-MM-DD' # ano-mes-dia
end   = 'YYYY-MM-DD' # ano-mes-dia



# Passo 2: Escolha um cultivo!   ####

# usando a funcao param_temperature() calcule:
# > FRUE # efeito da temperatura do ar sobre a eficiencia no uso da radiacao - RUE
# > GDD # somas termicas ou 'growing degree days'


# Passo 3: Montando tipologias   ####

# Vamos montar as tipologias de temperatura media (T2M) para essa localidade?
# E as tipologias de FRUE?
# faca um plot dessas tipologias. Seja criativo!


