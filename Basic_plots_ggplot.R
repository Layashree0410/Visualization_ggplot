#1. Installing and Loading the ggplot2 package
#------------------------------------------
# (Skip install.packages if already installed)
install.packages("ggplot2")
library(ggplot2)

# We'll use the built-in 'mtcars' and 'iris' datasets
head(mtcars)
head(iris)

#------------------------------------------
# 2. Basics of ggplot syntax
#------------------------------------------
# Syntax: ggplot(data, aes(x, y)) + geom_type()

# Example 1: Scatter plot
ggplot(data = mtcars, aes(x = wt, y = mpg)) + 
  geom_point()

# Example 2: Line plot
ggplot(data = mtcars, aes(x = wt, y = mpg)) + 
  geom_line()

# Example 3: Bar chart (categorical variable)
ggplot(data = iris, aes(x = Species)) + 
  geom_bar()

# Example 4: Histogram (distribution of a variable)
ggplot(data = mtcars, aes(x = mpg)) + 
  geom_histogram(binwidth = 2)

#------------------------------------------
# 3. Understanding Aesthetics (aes)
#------------------------------------------

# Example 1: Add color by category
ggplot(data = iris, aes(x = Sepal.Length, 
                        y = Sepal.Width, color = Species)) +
  geom_point()

# Example 2: Change size by a variable
ggplot(data = mtcars, aes(x = wt, y = mpg)) +
  geom_point(size = 10, shape =2)+
  geom_line(size = 1)


# Example 3: Use shape aesthetic
ggplot(data = iris, aes(x = Sepal.Length, 
                        y = Sepal.Width, shape = Species)) +
  geom_point()

# Example 4: Combine multiple aesthetics
ggplot(data = iris, aes(x = Sepal.Length, 
                        y = Sepal.Width, color = Species, shape = Species)) +
  geom_point(size = 3)

#------------------------------------------
# 4. Geoms (types of plots)
#------------------------------------------

# Scatter plot
ggplot(data = mtcars, aes(x = wt, y = mpg)) + 
  geom_point()

# Line chart
ggplot(data = mtcars, aes(x = wt, y = mpg)) + 
  geom_line()

# Bar plot (pre-counted values)
count_data <- as.data.frame(table(iris$Species))
colnames(count_data) <- c("Species", "Count")
ggplot(data = count_data, aes(x = Species, y = Count)) +
  geom_bar(stat = "identity")

# Box plot
ggplot(data = iris, aes(x = Species, y = Sepal.Length)) + 
  geom_boxplot()

#------------------------------------------
# 5. Adding titles, labels, and themes
#------------------------------------------

# Example 1: Titles and axis labels
ggplot(data = mtcars, aes(x = wt, y = mpg)) + 
  geom_point() +
  labs(title = "Mileage vs Weight", x = "Weight", y = "Miles per Gallon")

# Example 2: Adding subtitle and caption
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +
  labs(title = "Sepal Dimensions", subtitle = "Grouped by Species",
       caption = "Source: iris dataset")

# Example 3: Use a theme
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point() +
  theme_minimal()

# Example 4: Another theme example
ggplot(data = mtcars, aes(x = factor(cyl), y = mpg)) +
  geom_boxplot(fill = "purple") +
  theme_classic()

#------------------------------------------
# 6. Faceting (small multiples)
#------------------------------------------

# Example 1: Facet by Species
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +
  facet_wrap(~Species)

# Example 2: Facet by cylinders
ggplot(data = mtcars, aes(x = hp, y = mpg)) +
  geom_point() +
  facet_wrap(~cyl)

# Example 3: Facet grid with 2 variables
mtcars$gear <- as.factor(mtcars$gear)
mtcars$cyl <- as.factor(mtcars$cyl)
ggplot(mtcars, aes(x = hp, y = mpg)) +
  geom_point() +
  facet_grid(cyl ~ gear)

# Example 4: Facet with free scales
ggplot(iris, aes(x = Sepal.Length)) + 
  geom_histogram(binwidth = 0.3, fill = "steelblue") +
  facet_wrap(~Species, scales = "free")

#------------------------------------------
# 7. Colors, Fill and Legends
#------------------------------------------

# Example 1: Manual color change
ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot() +
  scale_fill_manual(values = c("setosa" = "red", "versicolor" = "blue", "virginica" = "green"))

# Example 2: Gradient color based on value
ggplot(mtcars, aes(x = wt, y = mpg, color = hp)) +
  geom_point() +
  scale_color_gradient(low = "yellow", high = "red")

# Example 3: Remove legend
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point() +
  theme(legend.position = "none")

# Example 4: Change legend position
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point() +
  theme(legend.position = "bottom")

#------------------------------------------
# 8. Customize axes, limits and breaks
#------------------------------------------

# Example 1: Set axis limits
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  xlim(2, 5) + ylim(10, 35)

# Example 2: Set custom breaks
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  scale_x_continuous(breaks = seq(2, 5, by = 0.5))

#------------------------------------------
# 9. Combining layers
#------------------------------------------

# Example 1: Add a line over points
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

# Example 2: Add text labels
ggplot(mtcars, aes(x = wt, y = mpg, label = rownames(mtcars))) +
  geom_point() +
  geom_text(nudge_y = 1, size = 3)
