# Example taken from stats documentation for Uniform Distribution on the web\
# feed the vector values, from 0 to 30 at a very close increment
x <- seq(0, 30, by=0.005)
# define the distribution to be with density between between 5 to 15
ud <- dunif(x, min = 5, max = 15)
# now plot
plot(x, ud, type = 'h', ylab='y', xlab = 'x', main = 'Uniform Distribution', col='black')
# define the max horizontal line
abline(h=0.1)
