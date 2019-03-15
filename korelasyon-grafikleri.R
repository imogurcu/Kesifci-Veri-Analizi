
# Korelasyonlarin Incelenmesi

## Scatter Plot 

library(tidyverse)

glimpse(iris)
df <- iris

ggplot(df, aes(Sepal.Length, Sepal.Width))+
  geom_point(size = 2,
             shape = 21,
             stroke = 1,
             color = "black",
             fill = "orange")+
  geom_smooth(color = "red")

## Kategorik degiskenleri gorsellestirme 

ggplot(df, aes(Sepal.Length, Sepal.Width, color = Species, shape = Species))+
  geom_point(size = 6,
             alpha = 0.6)

## Surekli degiskenin boyutunu degiskene ekleyip daha farklý cýkarýmlara ulasýyoruz.

ggplot(df, aes(Sepal.Length, Sepal.Width, color = Petal.Length, size = Petal.Length))+
  geom_point(alpha = 0.6)

### Birimlere Grafik Ekleme

df <- mtcars

ggplot(df, aes(x = wt, y = mpg))+
  geom_point()+
  geom_text(label = row.names(df), 
            nudge_x = 0.25, 
            nudge_y = 0.25,
            check_overlap = T)




ggplot(df, aes(x = wt, y = mpg, fill = cyl))+
  geom_point()+
  geom_label(label = row.names(df), 
            nudge_x = 0.25, 
            nudge_y = 0.25)+
  geom_smooth(method = lm, se = FALSE)


## Marjinlere Dagilim Eklemek

library(ggExtra)

g <- ggplot(df, aes(x = wt, y = mpg, fill = cyl))+
  geom_point()+
  geom_label(label = row.names(df), 
             nudge_x = 0.25, 
             nudge_y = 0.25)+
  geom_smooth(method = lm, se = FALSE)


ggMarginal(g, type = "histogram", fill = "slateblue")


## Heatmap (isi haritasi)
#Pattern detection
#Kullanicilarin sitede hangi bolumlerinde gezdiginin gorulmesi

df <- as.matrix(mtcars)

heatmap(df, Colv = NA, 
        Rowv = NA,
        scale = "column")


## Korelasyon Matrisleri

library(GGally)

df <- mtcars[ , c(1,3:6)]

cor(df)

cor.test(df$mpg, df$wt)
plot(df)

ggcorr(df)

ggpairs(df)





















