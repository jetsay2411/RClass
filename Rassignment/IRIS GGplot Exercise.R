


# Exercises for ggplot

library(ggplot2)
ggplot()
?iris
names(iris)
head(iris)

# Exercise 1
# Plot density chart for column Sepal Width of Iris Dataset. Hint : density().
# 
df = iris
df
str(df)
ggplot(iris, aes(x=Sepal.Width, colour=Species, fill=Species)) +
  geom_density(alpha=.3) +
  geom_vline(aes(xintercept=mean(Sepal.Width),  colour=Species), linetype="dashed",color="grey", size=1)+
  xlab("Sepal Width (cm)") +  
  ylab("Density")+
  theme(legend.position="none")

# Exercise 2
# Compare Sepal.Length with Sepal.Width. Also apply Color format wrt Species
# Hint : point().
#png('pointchartiris.png')
plt<-ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species)) +
  geom_point(size=2) +
  theme_light(base_size=20) + 
  ggtitle("Sepal Width vs. Sepal Length")
#dev.off()
# 
ggsave("sepalWidthvsLength.png", plt, height=6, width=10, units="in")



# Exercise 3
# This time you have to make bar chart for Species. Also try to fill it with unique colors
# Hint : bar().
# 
ggplot(iris, aes(x=Species, fill = Species)) + 
  geom_bar() + 
  xlab("Species") +  
  ylab("Count") + 
  ggtitle("Bar plot of Sepal Length")

# Exercise 4
# You Nailed it till now.
# This time, create object 'df' and save "iris" dataset to it.
# Assuming flowers dimensions are square in shape, you have to
#find area of sepal (lentgh * breadth) and petal(lentgh * breadth).
# Then compare the areas and use color option to differentiate wrt
#'Species'
# Add title, ylab, xlab.
# Hint : mutate funtion of dplyr and bar.
# 
library(dplyr)
df = iris
df
df2=df %>%
  mutate(area_sepal_=(Sepal.Length * Sepal.Width),
area_petal_=(Petal.Length * Petal.Width))
df2
str(df2)
summary(df2)

ggplot(df2, aes(x=area_sepal_)) + 
  geom_histogram(binwidth=0.2, color="black", aes(fill=Species)) + 
  xlab(" Area of Sepal") + 
  ylab("Frequency") + 
  ggtitle("Histogram of Sepal Area")

ggplot(df2, aes(x=area_petal_)) + 
  geom_histogram(binwidth=0.2, color="black", aes(fill=Species)) + 
  xlab(" Area of pepal") + 
  ylab("Frequency") + 
  ggtitle("Histogram of Petal Area")


ggplot(df2,aes(x=Species, fill=area_sepal_))+
  geom_bar(stat='count',fill=rainbow(length(unique(df2$Species)))) 

ggplot(df2,aes(x=Species, fill=area_petal_))+
  geom_bar(stat='count',fill=rainbow(length(unique(df2$Species))))

ggplot(df2,aes(x=Species, y=area_sepal_, color=Species))+
  geom_boxplot()

ggplot(df2,aes(x=Species, y=area_sepal_, color=Species))+
  geom_point()

ggplot(df2,aes(x=area_petal_, y=area_sepal_, color=Species))+
  geom_bar()





