Rtauchen
=======
[![Build Status](https://travis-ci.org/davidzarruk/Rtauchen.png)](https://travis-ci.org/rodazuero/Rtauchen) 
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/Rtauchen)](https://cran.r-project.org/package=Rtauchen)

RTauchen uses [Tauchen's (1986)](http://apps.eui.eu/Personal/Researchers/georgd/tauchen.pdf) method for discretizing AR(1) processes by choosing a finite set of points and transition probabilities, so the resulting finite-state Markov Chain mimics the original process. This method is computationally faster and numerically more stable than other methods (for example, Gaussian quadrature). This method is very popular in computational macroeconomics (See for example [Deaton (1989)](http://www.nber.org/papers/w3196), [Sargent and Ljungqvist (2012)](https://books.google.com/books?hl=es&lr=&id=H-PxCwAAQBAJ&oi=fnd&pg=PR5&ots=T-BOYPfzA7&sig=BMqWTp_3mAsSiyqQKRGm6xGClNU#v=onepage&q&f=false) and [Aiyagari (1994)](http://www.jstor.org/stable/2118417?seq=1#page_scan_tab_contents)).



## Installation

```{r}
# CRAN install
install.packages("Rtauchen")

# Github installation
# install.packages("devtools")
devtools::install_github("davidzarruk/Rtauchen")
```


## Example 1
This example computes the transition probability matrix of the finite-state Markov chain approximation of an AR(1) process with:
n = 5 (points in the Markov chain), ssigma = 0.02, lambda = 0.95, m = 3
``` r
results = Rtauchen(5, 0.02, 0.98, 3)

results
#               [,1]         [,2]         [,3]         [,4]         [,5]
# [1,]  9.997372e-01 2.627787e-04 0.000000e+00 0.000000e+00 0.000000e+00
# [2,]  4.433929e-05 9.998073e-01 1.483662e-04 0.000000e+00 0.000000e+00
# [3,]  6.080528e-30 8.198697e-05 9.998360e-01 8.198697e-05 0.000000e+00
# [4,]  2.785418e-78 3.349819e-29 1.483662e-04 9.998073e-01 4.433929e-05
# [5,] 3.015878e-150 4.649139e-77 1.804292e-28 2.627787e-04 9.997372e-01

```
## Example 2
This example computes the grid of points of the finite-state Markov chain approximation of an AR(1) process with:
n = 5 (points in the Markov chain), ssigma = 0.02, lambda = 0.95, m = 3
``` r
results = Tgrid(5, 0.02, 0.98, 3)

results
# [1] -0.3015113 -0.1507557  0.0000000  0.1507557  0.3015113

```

