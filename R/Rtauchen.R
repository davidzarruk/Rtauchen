
Tgrid = function(n, ssigma, llambda, m){

  grid = array(0, dim = n)
  ssigma_y = sqrt(ssigma^2/(1-llambda^2))
  
  estep = 2*ssigma_y*m / (n-1)
  for(ii in 1:1:n){
    grid[ii] = -m*sqrt((ssigma^2)/(1-llambda^2)) + (ii-1)*estep
  }
	return(grid)
}

Tmatrix = function(n, ssigma, llambda, m){
  
  grid = Tgrid(n, ssigma, llambda, m)
  
  if(n > 1){
    w = grid[2] - grid[1]
    P = array(0, dim = c(n,n))
    
    for(jj in 1:n){
      for(kk in 1:n){
        if(kk == 1){
          P[jj,kk] = pnorm((grid[kk] - llambda*grid[jj]+(w/2))/ssigma)
        }
        else if(kk == n){
          P[jj,kk] = 1- pnorm((grid[kk] - llambda*grid[jj]-(w/2))/ssigma)
        }
        else{
          P[jj,kk] = pnorm((grid[kk] - llambda*grid[jj]+(w/2))/ssigma)-pnorm((grid[kk] - llambda*grid[jj]-(w/2))/ssigma)
        }
      }
    }
  } else{
    P = 1
  }
  return(P)
}
