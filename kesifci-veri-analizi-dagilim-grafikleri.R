
library(tidyverse)


df <- mpg
  
df$class <- factor(df$class)
glimpse(df)


df$disp_yeni <- ifelse(df$displ > 2, 1, 0)
df$disp_yeni <- factor(df$disp_yeni)

df$disp_iki <- cut(df$displ, breaks = c(0, 2, max(df$displ)))




colnames(df)
str(df)
glimpse(df)

psych::headtail(df) #ilk bastan 4 gozlem ve sondan 4 gozlem goster

summary(df) #degiskenlerin cesitli istatistiklerini veriyor
fivenum(df$displ) #ilk 5 istatistigi veriyor

levels(df$class) #kategorileri veriyor


library(funModeling)

profiling_num(df)
plot_num(df)

freq(df)


library(psych)
describe(mpg$displ)

library(Hmisc)
Hmisc::describe(mpg$displ)


library(pastecs)
stat.desc(mpg)
mpg

df <- select(mpg, trans, cty, cyl, hwy)

describe.by(df, df$trans)

describeBy(df, df$trans)


library(d3Tree)


d3tree(list(root = df2tree(rootname ='titanic',
                           struct = as.data.frame(Titanic)),
                           layout = 'collapse'))


library(xplorerr)
app_descriptive()



######################################
##### Dağılımların İncelenmesi ######
#####################################


## Bar Plot (SuTun Grafikler)

df <- diamonds

glimpse(df)


ggplot(df, aes(cut, fill = color))+
  geom_bar(position = position_dodge2())+
  ggtitle("Ana Baslik yazisi")+
  xlab("Pirlanta kaliteleri")+
  ylab("Sıklıkları")
    

# Histogram ve Yoğunluk Grafikleri #####

## Bir surekli degiskenini gorsellestirmek istendiğinde en sık kullanılan grafik cesididi


ggplot(df, aes(price))+
  geom_histogram(binwidth = 1000)


ggplot(df, aes(price))+
  geom_density()


ggplot(df, aes(price))+
  geom_histogram(aes(y = ..density..))+
  geom_density(alpha = 0.3, fill = "orange")
 


ggplot(df, aes(price))+
  geom_histogram() +
  facet_grid(cut ~ .)


## Ridgeline

library(ggridges)

ggplot(df, aes(x = price, y = cut, fill = cut))+
  geom_density_ridges2()

## Interaktif Histogram


library(plotly)

g <- plot_ly(x = rnorm(500), type = "histogram")


g

g <- plot_ly(x = rnorm(500), opacity = 0.6, type = "histogram") %>%
  add_trace(x = rnorm(500) + 1) %>%
  layout(barmode = "overlay")

g


## Coklu Frekans

ggplot(df, aes(price, y = ..density..))+
  geom_freqpoly(aes(colour = cut), binwidth = 500)


# Box Plot

## Bir degiskende aykiri gozlemleri gostermek icin kullanır

ggplot(df, aes(x = cut, y = price, fill = cut))+
  geom_boxplot()


## Violin 

ggplot(df, aes(x = cut, y = price, fill = cut))+
  geom_violin(alpha = 0.6)





































  

























































