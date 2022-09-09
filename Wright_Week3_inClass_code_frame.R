
##### week 3 in-class exercise #####

# load library that we will use
library(ggplot2)

# read data set
salary <- read.table("data_salary.csv", header = T, sep = ",", stringsAsFactors = T)

# look at first few rows of data
head(salary)

# look at the summary of data
summary(salary)

# check if there is NA in the data for age
sum(is.na(salary))

### work with plots

# bar plot for salaries by education
p_salary <- ggplot(data = salary) + geom_bar(mapping = aes(x = education))
p_salary

# check unique values of education
unique(salary$education)

# flip the coordinates for better reading the plot
p_salary + coord_flip()

# add another variable "sex"
p_salary_sex <- ggplot(data = salary, aes(x = education, fill = sex)) + geom_bar() + coord_flip()
p_salary_sex
# plot a histogram
p_hist <- ggplot(data = salary, aes(x = fnlwgt, fill = education)) + 
  geom_histogram()
p_hist

# scatter plot of capital gain by age
p_cg_age <- ggplot(data = salary, aes(x = age, y = capital.gain, 
                                      color = salary.class)) + 
  geom_point()
p_cg_age

# scatter plot of capital gain by age and sex
p_cg_age_sex <- ggplot(data = salary, aes(x = age, 
                                          y = capital.gain,
                                          color = sex)) + 
  geom_point()
p_cg_age_sex

# boxplot of hours per week by sex
p_box_h_s <- ggplot(data = salary, aes(x = hours.per.week, 
                                       color = sex)) + 
  geom_boxplot()
p_box_h_s


# facets: split the plot into subplots by sex
p_box_h_s + facet_wrap(~sex, nrow = 2, ncol = 1)


# add title to the plot
p_box_h_s + ggtitle("Box plots of hours worked per week by sex")

# add themes to the plot
p_box_h_s + theme_classic()

# save plot
ggsave("HoursSexBox.png", units = "in", width = 6, height = 3)

