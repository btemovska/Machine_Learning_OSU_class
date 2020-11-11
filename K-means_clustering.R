library(cluster)
install.packages("factoextra")
library(factoextra)

df <- USArrests
head(df)
df <- scale(df)
head(df)

k2 <- kmeans(df, centers = 2, nstart = 25)
k2
fviz_cluster(k2, data = df)

k3 <- kmeans(df, centers = 3, nstart = 25)
k4 <- kmeans(df, centers = 4, nstart = 25)
k5 <- kmeans(df, centers = 5, nstart = 25)

p1 <- fviz_cluster(k2, geom = "point", data = df) + ggtitle("k = 2")
p2 <- fviz_cluster(k3, geom = "point", data = df) + ggtitle("k = 3")
p3 <- fviz_cluster(k4, geom = "point", data = df) + ggtitle("k = 4")
p4 <- fviz_cluster(k5, geom = "point", data = df) + ggtitle("k = 5")

library(gridExtra)
grid.arrange(p1, p2, p3, p4, nrow = 2)

fviz_nbclust(df, kmeans, method = "wss")

fviz_nbclust(df, pam, method = "silhouette")+theme_classic()
pam.best <- pam(df, 2)
print(pam.best)

pam.best$medoids

head(pam.best$clustering)

fviz_cluster(pam.best, data = df)
