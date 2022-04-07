<img align="center" src="/genmelhor.png" width="100%" height="100%">

# Enviromics em Melhoramento de Plantas - Workshop

Data: 06 e 07 de Abril de 2022 - Virtual

Autor: Germano Costa-Neto

email: germano.cneto@gmail.com


* Detalhes do uso do pacote EnvRtype: veja o curso em portugues/ingles neste [link](https://github.com/gcostaneto/Enviromics_Curso_PT)

* Slides estarão disponiveis (em pdf) neste **link** após o término do curso (até o dia 12 de Abril, depois ficarão indisponiveis)

* Usufrua do nosso forum online neste [link](https://groups.google.com/g/genmelhor_2022) para fazer perguntas sobre o pacote e sobre "enviromics" de um modo geral. Esse forum é exclusivo para os participantes do curso e ficará aberto "para sempre". Codigos detalhados (em R) tambem serao disponibilizados nesse forum.
 
* Perguntas/criticas/sugestoes sobre o pacote podem tambem ser feitas no forum publico do EnvRtype neste [link](https://groups.google.com/g/melhoramento_precisao_envirotyping) 


# Visao Geral: O que é "Envirotyping"? e "Enviromics"?

Por Germano Costa-Neto, 25-02-2022



A tipificação/tipagem de ambientes (environmental typing = envirotyping) é um ramo da ciência de dados que visa compreender as condições ambientais de uma dada localidade, para assim relacioná-las às causas não-genéticas que podem elucidar o origem da adaptação dos organismos. Por condições ambientais entendemos todo o “meio” em que um dado organismo se encontra, assim como sua atuação em diferentes níveis de estudo, desde o nível intracelular, passando por tecidos e órgãos, até contemplar todo o organismo, incluindo também o conjunto de organismos que coexistem no mesmo espaço. Por exemplo, uma lavoura comercial ou campos experimentais (ensaios). O ambiente passa então a ser definido como um balanço de recursos necessários para a realização de processos biológicos, respeitando às Leis de Liebg (Lei do Minimo) e de Shelford (Limites da Tolerância) que são geneticamente definidas para cada organismo. Esse balanço de recursos vincula-se a fenômenos como expressão genica (transcrição e tradução), regulação do epigenoma, balanço hormonal entre tecidos/órgãos, atuando direta e indiretamente na expressão fenotípica final do produto de interesse (e.g., produção de grãos, produção de madeira). Matematicamente, podemos estabelecer modelos que relacionam fenótipos à fatores ambientais, isto é; as normas de reação e como estas definem os padrões observáveis de interação genótipo x ambiente. Essa logica, porém, pode ser expandida para contemplar "fenótipos moleculares", tais como metabolitos, proteínas, hormônios ou mesmo SNPs (vide estudos de associação genômica para condições ambientais, isto é, “environmental GWAS”), desde que estes sejam coletados sob múltiplas condições ambientais – ou seja, que experimentaram um “gradiente de variação das condições ambientais”. 

A tipificação/tipagem de ambientes (environmental typing = envirotyping) é um ramo da ciência de dados que visa compreender as condições ambientais de uma dada localidade, para assim relacioná-las às causas não-genéticas que podem elucidar o origem da adaptação dos organismos. Por condições ambientais entendemos todo o “meio” em que um dado organismo se encontra, assim como sua atuação em diferentes níveis de estudo, desde o nível intracelular, passando por tecidos e órgãos, até contemplar todo o organismo, incluindo também o conjunto de organismos que coexistem no mesmo espaço. Por exemplo, uma lavoura comercial ou campos experimentais (ensaios). O ambiente passa então a ser definido como um balanço de recursos necessários para a realização de processos biológicos, respeitando às Leis de Liebg (Lei do Minimo) e de Shelford (Limites da Tolerância) que são geneticamente definidas para cada organismo. Esse balanço de recursos vincula-se a fenômenos como expressão genica (transcrição e tradução), regulação do epigenoma, balanço hormonal entre tecidos/órgãos, atuando direta e indiretamente na expressão fenotípica final do produto de interesse (e.g., produção de grãos, produção de madeira). Matematicamente, podemos estabelecer modelos que relacionam fenótipos à fatores ambientais, isto é; as normas de reação e como estas definem os padrões observáveis de interação genótipo x ambiente. Essa logica, porém, pode ser expandida para contemplar "fenótipos moleculares", tais como metabolitos, proteínas, hormônios ou mesmo SNPs (vide estudos de associação genômica para condições ambientais, isto é, “environmental GWAS”), desde que estes sejam coletados sob múltiplas condições ambientais – ou seja, que experimentaram um “gradiente de variação das condições ambientais”. 

Além da disponibilidade de recursos no meio, a qualidade de um ambiente também é definida pela capacidade do organismo em utilizá-los, o que depende de fatores como seu atual estágio de desenvolvimento (e.g., fenologia em plantas) e os “limites genéticos” que definem as zonas de absorção ótima, de estresse (por falta ou por excesso do recurso) e morte (estresse drástico e irreversível), o que vincula-se a fatores pleitóricos que afetam a plasticidade fenotípica (e de desenvolvimento) que regem os mecanismos de adaptação do organismo à um dado gradiente ambiental (amplitude de condições ambientais). Essas zonas irão definir o que é um estresse do que é uma condição ótima de expressão do potencial genético. Alem disso, o ambiente passado que um organismo enfrentou tem efeito decisivo em definir como organismo irá enfrentar o ambiente atual. Portanto, é impossível definir o ambiente particular de uma espécie sem considerar os fatores intrínsecos da espécie, definidos sobretudo por sua genética e fisiologia.  Duas espécies distintas convivendo no mesmo local não irão experienciar o mesmo ambiente, mesmo que as condições de solo, chuva ou temperatura sejam as mesmas. Portanto, há um ambiente “meteorológico” e um ambiente “agrometereologico”, ou melhor, vinculado á ecofisiologia do organismo. Nesse sentido, trata-se de uma ciência de dados que depende de conhecimentos multidisciplinares para atingir seu potencial e máxima resolução, no entanto tem aplicabilidade mesmo focando-se nas condições edafoclimaticas e os estresses bióticos e abióticos vinculados as mesmas.

# Participaçao do "ambiente" nas interações Genótipo x Ambiente (GxA)

Diante do que foi exposto, podemos inferir que o fenômeno da interação GxA nada mais é do que um reflexo putativo (isto é, emergente) de como os diferentes genes respondem à diversidade de condições ambientais enfrentadas em uma rede experimental ou região alvo. Na figura abaixo, baseada na Lei de Shelford, podemos observar que quanto maior a diversidade ambiental, melhor é a amostragem da plasticidade fenotípica (curvas).


<img align="center" src="/rede.png" width="70%" height="70%">

Portanto o número de ambientes não é tão relevante quanto a diversidade que estes possuem entre si. Do contrário, a caracterizacao da “interação GxA” é *viesada* por critérios de incorreta amostragem das condições ambientais. As linhas entre os “limites ambientais” do gradiente ambiental de cada rede experimental nos mostram o que chamamos de “norma de reação”, que pode contemplar um índice ambiental vinculado à média fenotípica (no caso, desdobrando-se em adaptabilidade x estabilidade), mas também à respostas fenotípicas frente a variação de algum fator ambiental (e.g., temperatura). Portanto, o fator ambiental que apresentar a maior diversidade estará com certeza relacionado a explicação da interação GxA, enquanto os fatores ambientais com menor diversidade não terão maior impacto na variação fenotípica. Para entender esses fatores, podemos estudar a diversidade dos ambientes, mas também relacionar matematicamente diferentes fatores ambientais com as medias fenotípicas observadas nos ensaios. No primeiro caso podemos fazer isso tanto a *priori* como a *posteri*, estudando os padrões ambientais de uma certa região, o que pode, por exemplo, auxiliar no dimensionamento de uma rede experimental. A segunda técnica também permite tais inferências, porém aprofunda-se no estudo das normas de reação dos genótipos, o que pode ser útil para compreender a sensibilidade/responsividade dos genótipos aos fatores chave de uma dada região, isto é; quais genótipos respondem melhor a maiores condições de radiação, temperatura, estresse hídrico, entre outros. Essa técnica pode ser acoplada a genômica viabilizando o estudo das regiões genômicas que podem estar associadas à expressão dessas caraterísticas (Li et al., 2021).



# Pipelines para tipificação/tipagem de ambientes e o pacote EnvRtype

Antes de começar qualquer estudo envolvendo dados ambientais, precisamos aprender onde coletar, como processar e organizar tais dados. E principalmente: como extrair informações uteis desses dados. Existem muitos níveis nos quais podemos trabalhar, mas em geral, podemos classificar em: macro-ambiente e micro-ambiente. O macro-ambiente representa as condiçoes do meio em uma lavoura, floresta ou região, enquanto o micro-ambiente é o detalhamento das condiçoes do meio desde o nível de parcela, planta, órgão, tecido, celula etc. Enquanto o primeiro campo ainda está aprendendo a andar, o segundo está aprendendo a engatinhar.

Em Costa-Neto et al. (2021), apresentamos o pacote EnvRtype R, um novo kit de ferramentas desenvolvido para interagir dados de "envirotipagem" em larga escala (enviromics) em genética quantitativa, no nível macro-ambiental. Ou seja, para o estudo do envirome das espécies ou de uma dada localidade. Na linguagem do melhoramento de plantas, o envirome pode ser definido como:



> "conjunto de possibilidades ambientais que o germoplasma do programa pode enfrentar, desde os estagios de *breeding*, passando pelo *post-breeding* até o desenvolvimento e alocaçao dos produtos na regiao alvo de interesse." (definiçao adaptada de Costa-Neto et al., 2021 e Costa-Neto & Fritsche-Neto, 2021)

Não se tratam de conceitos novos, muito pelo contrario, sua aplicação remonta aos anos 1960s. Buscamos no pacote organizar uma “linearidade de raciocínio” para padronizar ao máximo o que se trata “envirotyping”, evitando erros comuns de coleta e processamento de dados, assim como seu uso pouco consciente da fisiologia do organismo.

Para iniciar um pipeline de ambientação amigável, este pacote oferece: 

(1) ferramentas de sensoriamento remoto para coleta (funções get_weather e extract_GIS) e processamento de variáveis ecofisiológicas (funções param_temperature, param_radiation e param_atmospheric) de dados ambientais brutos em locais únicos ou em todo o mundo; 

(2) caracterização ambiental por meio de tipagem de ambientes e perfilamento de descritores de qualidade ambiental (função env_typing), além da coleta de covariáveis ambientais como descritores quantitativos para fins preditivos (função W_matrix); e 

(3) identificação de similaridade ambiental que pode ser usada como um kernel baseado em ambiente (função env_typing) na seleção assistida por modelos preditivos baseados em genômica (ou simplesmente, predição genômica, GP), visando assim aumentar o conhecimento ecofisiológico nestes modelos, assim como emular efeitos de normas de reação (funções get_kernel e kernel_model). Neste curso, espero destacar a importância dos conceitos de mineração de literatura no ajuste fino dos parâmetros de ambiente para cada espécie de planta e ambientes de cultivo alvo. Em seguida, exemplificar seu uso para criar redes de envirotipagem em escala global e integrar a modelagem de normas de reação em GP também são descritos.


Esses tópicos sao ilustrados pelos seguintes módulos (Costa-Neto et al., 2021):

<img align="center" src="/envrtype.png" width="70%" height="70%">

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


# Livros e Artigos Uteis

Referencias bibliograficas e artigos uteis podem ser encontrados [aqui](https://github.com/gcostaneto/GEMS_R/tree/main/References)

# Codigos


* Dia 01 [conceitos basicos e coleta de dados](https://github.com/gcostaneto/GenMelhor_2022/tree/main/Dia_01) 

* Dia 02 [caracterizacao ambiental e predidcao da GxE](https://github.com/gcostaneto/GenMelhor_2022/blob/main/Dia_02.zip)

obs:(disponivel online ate o dia 12, "pra sempre" no nosso forum")

