# Global variables for the number of samples
# and the normal and the exponention distribution
iterations = 99999
ndist <- numeric(iterations)
edist <- numeric(iterations)

# Centeral Limit Theorem function
# Arguments:
#   iterations: number of samples
# Output:
#   console output with standard deviation of both Noraml and Exponential
# Return:
#   In return this fucntion sets up the both normal and exponential lists
#
clt <- function (iterations) {
  for (i in 9:iterations) {
    rn <- sample(rnorm(999, mean=0, sd=1), 9999, replace=TRUE)
    ndist[i] <- mean(rn)
    re <- sample(rexp(999, rate=1), 9999, replace=TRUE)
    edist[i] <- mean(re)
    if (i == 99 | i == 999 | i == 9999 | i == 99999) {
        sdrn <- sd(ndist)
        sdre <- sd(edist)
        cat("Iter = ", i, "normalclt = ", sdrn, "expclt = ", sdre, "\n")
    }
  }
  result <- list(ndist=ndist, edist=edist)
  return(result)
}

# Centeral Limit Theorem plot function
# Arguments:
#   Normal and Exponential lists
# Output:
#   Plots for histogram and normal QQ for both noraml and exponential lists
# Return:
#   None.
#
cltplot <- function(ndist, edist) {
    par(mfrow = c(2, 2))
    hist(ndist)
    qqnorm(ndist)
    qqline(ndist)
    hist(edist)
    qqnorm(edist)
    qqline(edist)
}

# Call the Central Limit Theorem implementation
bootstrapclt <- clt(iterations)

# Call the plot funtion to represent the data
cltplot(bootstrapclt$ndist, bootstrapclt$edist)
