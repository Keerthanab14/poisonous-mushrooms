#install.packages("FFTrees", repos = "https://cran.rstudio.com/")
#install.packages("keras", repos = "https://cran.rstudio.com/")
#install.packages("randomForest", repos = "https://cran.rstudio.com/")
library(keras)
library(datasets)
library(FFTrees)
library(dplyr)
library(randomForest)
library(ggplot2)
mushrooms

#to plot a bar graph of the number of poisonous and non poisonous data in the dataset
ggplot(mushrooms, aes(poisonous, fill=poisonous)) + geom_bar()
rows <- sample(nrow(mushrooms), nrow(mushrooms)*.7,replace = FALSE)
#splitting the train and test data
train <-mushrooms[rows,]
test <- mushrooms[-rows,]

#creata an FFTree model to classify if the mushroom is poisonous
model <- FFTrees(poisonous ~ . , train)
#print the model details
model

plot(model)
#plot to estimate which attribute would give how much accuracy if considered alone
plot(model, what = "cues")

#testing the model
pred <-predict(model, test)
#prints a confusion table
table(pred, test$poisonous)
