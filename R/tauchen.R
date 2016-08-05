
# Corro un archivo con los parametros

Tgrid=function(ne, ssigma_eps, llambda_eps, m){

  grid = array(0, dim = ne)
  ssigma_y = sqrt(ssigma_eps^2/(1-llambda_eps^2))
  
  estep = 2*ssigma_y*m / (ne-1)
  for(ii in 1:1:ne){
    grid[ii] = -m*sqrt((ssigma_eps^2)/(1-llambda_eps^2)) + (ii-1)*estep
  }
  return(grid)
}

Rtauchen=function(ne, ssigma_eps, llambda_eps, m){
  
  grid = Tgrid(ne, ssigma_eps, llambda_eps, m)
  
  if(ne > 1){
    w = grid[2] - grid[1]
    P = array(0, dim = c(ne,ne))
    
    for(jj in 1:ne){
      for(kk in 1:ne){
        if(kk == 1){
          P[jj,kk] = pnorm((grid[kk] - llambda_eps*grid[jj]+(w/2))/ssigma_eps)
        }
        else if(kk == ne){
          P[jj,kk] = 1- pnorm((grid[kk] - llambda_eps*grid[jj]-(w/2))/ssigma_eps)
        }
        else{
          P[jj,kk] = pnorm((grid[kk] - llambda_eps*grid[jj]+(w/2))/ssigma_eps)-pnorm((grid[kk] - llambda_eps*grid[jj]-(w/2))/ssigma_eps)
        }
      }
    }
  } else{
    P = 1
  }
  return(P)
}