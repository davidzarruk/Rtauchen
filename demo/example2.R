library(Rtauchen)

# This example computes the grid of points of the finite-state Markov chain approximation of an AR(1) process with:
# n = 5 points in the Markov chain
# ssigma = 0.02
# lambda = 0.95
# m = 3
results = Tgrid(5, 0.02, 0.98, 3)

results
# [1] -0.3015113 -0.1507557  0.0000000  0.1507557  0.3015113