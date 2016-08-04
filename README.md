gmapsdistance
=======
[![Build Status](https://travis-ci.org/rodazuero/Rtauchen.png)](https://travis-ci.org/rodazuero/Rtauchen) 
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/Rtauchen)](https://cran.r-project.org/package=Rtauchen)

Rtauchen discretizes an AR process. References: ...

## Installation

```{r}
# CRAN install
install.packages("Rtauchen")

# Github installation
# install.packages("devtools")
devtools::install_github("rodazuero/Rtauchen")
```


## Example 1
This is the first example 
``` r
results = TMatrix(2, 1.0e-5, 0.1,0.4)
results

#>           [,1]      [,2]
#> [1,] 0.5160338 0.4839662
#> [2,] 0.4839662 0.5160338


```
