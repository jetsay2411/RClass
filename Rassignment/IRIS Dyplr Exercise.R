


# Exercises for dplyr

library(dplyr)
?iris
names(iris)

# Exercise 1
# Select the first three columns of the iris dataset using their column names. HINT: Use select().
# 
df=as.data.frame(iris)
df

s1=select(df,Sepal.Length,Sepal.Width,Petal.Length)
s1 %>% head


# Exercise 2
# Select all the columns of the iris dataset except "Petal Width". HINT: Use "-".
s2=select(df,-Petal.Width)
s2 %>% head

  

# Exercise 3
# Select all columns of the iris dataset that start with the character string "P".
df
select(df, starts_with("P")) %>% head



# Exercise 4
# Filter the rows of the iris dataset for Sepal.Length >= 4.6 and Petal.Width >= 0.5.

df%>% 
  filter(Sepal.Length>=4.6,Petal.Width>=0.5) %>% head

# Exercise 5
# Pipe the iris data frame to the function that will select two columns (Sepal.Width and Sepal.Length). HINT: Use pipe operator.

df%>%  select(Sepal.Width,Sepal.Length) %>% head

# Exercise 6
# Arrange rows by a particular column, such as the Sepal.Width. HINT: Use arrange().

df%>% arrange(Sepal.Width) %>% head

# Exercise 7
# Select three columns from iris, arrange the rows by Sepal.Length, then arrange the rows by Sepal.Width.

df%>% select(Sepal.Length,Sepal.Width,Species) %>% arrange(Sepal.Length,Sepal.Width) %>% head


# Exercise 8
# Create a new column called proportion, which is the ratio of Sepal.Length to Sepal.Width. HINT: Use mutate().

df%>% mutate(proportion=(Sepal.Length/Sepal.Width)) %>% head


# Exercise 9
# Compute the average number of Sepal.Length, apply the mean() function to the column Sepal.Length, and call the summary value "avg_slength". HINT: Use summarize().

df%>% summarise(avg_slength=mean(Sepal.Length)) 


# Exercise 10
# Split the iris data frame by the Sepal.Length, then ask for the same summary statistics as above. HINT: Use group_by().

df%>% group_by(Sepal.Length) %>% summarise(avg_slength=mean(Sepal.Length))

