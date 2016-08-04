
library("Rcpp")

setwd("/home/david/Dropbox/Documents/Doctorado/Packages/")

rm(list=ls())

# Corro un archivo con los parametros
sourceCpp("/Users/rodrigoazuero/Documents/R/Rtauchen/R/tauchen.cpp")

TMatrix = function(ne, ssigma_eps, llambda_eps, m){
  probabs = transition(ne, ssigma_eps, llambda_eps, m);
  
  P = array(0, dim = c(ne, ne));
  
  for (ie in 1:ne){
    for(iep in 1:ne){
      P[ie, iep] = probabs[[ie]][[iep]];
    }
  }
  return(P);
}
