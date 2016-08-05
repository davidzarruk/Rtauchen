library(Rtauchen)

# This example computes the transition probability matrix of the finite-state Markov chain approximation of an AR(1) process with:
# n = 5 points in the Markov chain
# ssigma = 0.02
# lambda = 0.95
# m = 3
results = Rtauchen(5, 0.02, 0.98, 3)

results
#               [,1]         [,2]         [,3]         [,4]         [,5]
# [1,]  9.997372e-01 2.627787e-04 0.000000e+00 0.000000e+00 0.000000e+00
# [2,]  4.433929e-05 9.998073e-01 1.483662e-04 0.000000e+00 0.000000e+00
# [3,]  6.080528e-30 8.198697e-05 9.998360e-01 8.198697e-05 0.000000e+00
# [4,]  2.785418e-78 3.349819e-29 1.483662e-04 9.998073e-01 4.433929e-05
# [5,] 3.015878e-150 4.649139e-77 1.804292e-28 2.627787e-04 9.997372e-01