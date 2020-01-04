
ny = read.csv('new_york_city.csv')
wash = read.csv('washington.csv')
chi = read.csv('chicago.csv')

head(ny)

head(wash)

head(chi)


Question 1
What is the distribution of trip duration times in New York?

ny = read.csv('new_york_city.csv')
head(ny)

library(ggplot2)

qplot(x=Trip.Duration, data = ny, binwidth = 60,
      color=I('black'), fill=I('blue'),
      main='Distribution of Trip Duration in New York',
      xlab='Trip Duration - Seconds', ylab='Count of Trips') +
   scale_x_continuous(limits=c(0,3000), breaks=seq(0,3000,300))

summary(ny)

minute.conversion=function(num) {
    x=num/60
    return(x)
}

minute.conversion(903.6)

minute.conversion(610)

Question 2
How does trip duration compare between males and females in Chicago?

#I am unsure why running the code this way is still producing the N/A  boxplot
#I followed the same structure as the lesson - hopefully it is not a big issue for the analysis!

chi = read.csv('chicago.csv')
head(chi)

library(ggplot2)

summary(chi)

qplot(x = Gender, y = Trip.Duration, data = subset(chi, !is.na(Gender)), geom = 'boxplot',
     main='Trip Duration by Gender in Chicago',
     xlab='Gender', ylab='Trip Duration in Seconds') +
  coord_cartesian(ylim = c(0,2000))

minute.conversion=function(num) {
    x=num/60
    return(x)
}

minute.conversion(500)

minute.conversion(330)

minute.conversion(420)

minute.conversion(830)

minute.conversion(1000)

Question 3
How do customer trip duration times compare to those of subscribers in DC?

##wasn't sure how to remove the N/A from the results without getting an error message
##using !is.na(Customer.Type) in the first line did not work for me for whatever reason

wash = read.csv('washington.csv')
head(wash)

library(ggplot2)

summary(wash)

by(wash$Trip.Duration, wash$User.Type, summary)

qplot(x=Trip.Duration, data=subset(wash, !is.na(User.Type)), binwidth=60,
      color=I('black'), fill=I('orange'),
      main='Distribution of Trip Duration by Customer Type in Washington',
      xlab='Trip Duration - Seconds', ylab='Count of Trips') +
scale_x_continuous(limits=c(0,2700), breaks=seq(0,2700,600)) +
facet_wrap(~User.Type)

minute.conversion=function(num) {
    x=num/60
    return(x)
}

minute.conversion(2634)

minute.conversion(733)

minute.conversion(1505)

minute.conversion(570)

system('python -m nbconvert Explore_bikeshare_data.ipynb')
