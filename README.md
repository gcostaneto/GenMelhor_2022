<img align="center" src="/PGMP.png" width="100%" height="100%">

# Enviromics em Melhoramento de Plantas - Workshop

Data: 06 e 07 de Abril de 2022 - Virtual

Autor: Germano Costa-Neto

email: germano.cneto@gmail.com


* Detalhes do uso do pacote EnvRtype: veja o curso em portugues/ingles neste [link](https://github.com/gcostaneto/Enviromics_Curso_PT)

* Slides estarão disponiveis (em pdf) neste **link** após o término do curso (até o dia 12 de Abril, depois ficarão indisponiveis)

* Usufrua do nosso forum online [link](https://groups.google.com/g/genmelhor_2022) para fazer perguntas sobre o pacote e sobre "enviromics" de um modo geral. Esse forum é exclusivo para os participantes do curso e ficará aberto "para sempre". Perguntas/criticas/sugestoes acessando especificamente sobre o pacote podem tambem ser feitas no [link](https://groups.google.com/g/melhoramento_precisao_envirotyping) 


# Visao Geral: O que é "Envirotyping"? e "Enviromics"?

Por Germano Costa-Neto, 25-02-2022


A tipificação/tipagem de ambientes (environmental typing = envirotyping) é um ramo da ciência de dados que visa compreender as condições ambientais de uma dada localidade para assim relacioná-las às causas não-genéticas que podem explicar a adaptação dos organismos vivos. Por condições ambientais entendemos todo o “meio” em que um dado organismo se encontra, assim como sua atuação em diferentes níveis de estudo, desde o nível intracelular, passando por tecidos e órgãos, até contemplar todo o organismo, incluindo também o c conjunto de organismos que coexistem no mesmo espaço. O ambiente passa então a ser definido como um balanço de recursos necessários para a realização de processos biológicos, respeitando às Leis de Liebg (Lei do Minimo) e de Shelford (Limites da Tolerância) que são geneticamente definidas para cada organismo. Esse balanço de recursos vincula-se a fenômenos como expressão genica (transcrição e tradução), regulação do epigenoma, balanço hormonal entre tecidos/órgãos, atuando direta e indiretamente na expressão fenotípica final do produto de interesse (e.g., produção de grãos, produção de madeira). Matematicamente, podemos estabelecer modelos que relacionam fenótipos à fatores ambientais, isto e, as normas de reação e como estas definem os padrões observáveis de interacao genótipo x ambiente.

Além da disponibilidade de recursos no meio, a qualidade de um ambiente também é definida pela capacidade do organismo em utilizá-los, o que depende de fatores como seu atual estágio de desenvolvimento (e.g., fenologia em plantas) e os “limites genéticos” que definem as zonas de absorção ótima, de estresse (por falta ou por excesso do recurso) e morte (estresse drástico e irreversível), o que vincula-se a fatores pleitóricos que afetam a plasticidade fenotípica (e de desenvolvimento) que regem os mecanismos de adaptação do organismo à um dado gradiente ambiental (amplitude de condições ambientais). Essas zonas irão definir o que é um estresse do que é uma condição ótima de expressão do potencial genético. Portanto, é impossível definir o ambiente particular de uma espécie sem considerar os fatores intrínsecos da espécie, definidos sobretudo por sua genética e fisiologia. Duas espécies distintas convivendo no mesmo local não irão experienciar o mesmo ambiente, mesmo que as condições de solo, chuva ou temperatura sejam as mesmas. Portanto, há um ambiente “meteorológico” e um ambiente “agrometereologico”, ou melhor, vinculado á ecofisiologia do organismo. Nesse sentido, trata-se de uma ciência de dados que depende de conhecimentos multidisciplinares para atingir seu potencial e máxima resolução, no entanto tem aplicabilidade mesmo focando-se nas condições edafoclimaticas e os estresses bióticos e abióticos vinculados as mesmas.


Em Costa-Neto et al. (2021), apresentamos o pacote EnvRtype R, um novo kit de ferramentas desenvolvido para interagir dados de "envirotipagem" em larga escala (enviromics) em genética quantitativa. Ou seja, para o estudo do envirome das espécies ou de uma dada localidade. Na linguagem do melhoramento de plantas, o envirome pode ser definido como: 

> "conjunto de possibilidades ambientais que o germoplasma do programa pode enfrentar, desde os estagios de *breeding*, pasando pelo *post-breeding* até o desenvolvimento e alocaçao dos produtos na regiao alvo de interesse." (definiçao adaptada de Costa-Neto et al., 2021 e Costa-Neto & Fritsche-Neto, 2021)

Não se tratam de conceitos novos, muito pelo contrario, sua aplicação remonta aos anos 1960s. Buscamos no pacote organizar uma “linearidade de raciocínio” para padronizar ao máximo o que se trata “envirotyping”, evitando erros comuns de coleta e processamento de dados, assim como seu uso pouco consciente da fisiologia do organismo.

Para iniciar um pipeline de ambientação amigável, este pacote oferece: 

(1) ferramentas de sensoriamento remoto para coleta (funções get_weather e extract_GIS) e processamento de variáveis ecofisiológicas (funções param_temperature, param_radiation e param_atmospheric) de dados ambientais brutos em locais únicos ou em todo o mundo; 

(2) caracterização ambiental por meio de tipagem de ambientes e perfilamento de descritores de qualidade ambiental (função env_typing), além da coleta de covariáveis ambientais como descritores quantitativos para fins preditivos (função W_matrix); e 

(3) identificação de similaridade ambiental que pode ser usada como um kernel baseado em ambiente (função env_typing) na seleção assistida por modelos preditivos baseados em genômica (ou simplesmente, predição genômica, GP), visando assim aumentar o conhecimento ecofisiológico nestes modelos, assim como emular efeitos de normas de reação (funções get_kernel e kernel_model). Neste curso, espero destacar a importância dos conceitos de mineração de literatura no ajuste fino dos parâmetros de ambiente para cada espécie de planta e ambientes de cultivo alvo. Em seguida, exemplificar seu uso para criar redes de envirotipagem em escala global e integrar a modelagem de normas de reação em GP também são descritos.




# Forum de Debate 

Sugiro a todos que usem e abusem do forum. As vezes alguma duvida pode ja ter sido esclarecida. Ou podem nascer novos debates e ideias.

> [Getting help](https://groups.google.com/u/1/g/envrtype)


# Software

Podemos instalar o pacote usando a funcao install_git do pacote devtools:

```{r, eval=FALSE}
library(devtools)
install_github('allogamous/EnvRtype')
library(EnvRtype)
```

Porem um pacote no R nada mais é do que um compilado de funçoes, que podem ser baixads usando a funçao source() tais como:

```{r, eval=FALSE}
source("https://raw.githubusercontent.com/allogamous/EnvRtype/master/sourceEnvRtype.R")
```

Assim como apenas algumas funçoes em especifico:

```{r, eval=FALSE}

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
```



**Outros pacotes que podem ser uteis para nossos estudos**

```{r, eval=FALSE}
source("https://raw.githubusercontent.com/gcostaneto/Funcoes_naive/master/instpackage.R")
inst.package(c("superheat","FactoMineR","tidyverse","ggplot2","reshape2","plyr"))
```

# Modulos de uma plataforma de Envirotyping

Abaixo estao disponiveis alguns tutorias para serem consultados de forma suplementar.

[MODULE 1](https://github.com/gcostaneto/EnvRtype_course/blob/main/MODULE1.md) - Coleta Remota de Dados

[MODULE 2](https://github.com/gcostaneto/EnvRtype_course/blob/main/MODULE2.md) - Caracterizacao e tipiicaçao de ambientes

[MODULE 3](https://github.com/gcostaneto/EnvRtype_course/blob/main/MODULE3.md) - Modelos Preditivos baseados em "estruturas de relacionamento" ambiental/genetica
