
# Corro un archivo con los parametros

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



nTgrid = function(n, ssigma, llambda, m, dim){

  n = 9
  m = 3
  dimension = dim(ssigma)
  grid = array(0, dim = c(dimension[1], n))
  
  llambda = array(c(0.7, 0.2, 0.3,  0.5), dim = c(2,2))
  ssigma = array(c(0.1, 0, 0, 0.1), dim = c(2,2))
  
  ssigma_y = array(0, dim = c(dimension[1], dimension[1]))
  error = 1
  tol = 10^-5
  while(error > tol){
    ssigma_y_p = llambda%*%ssigma_y%*%t(llambda) + ssigma
    error = norm(ssigma_y_p - ssigma_y)
    ssigma_y = ssigma_y_p
  }
  
  for(jj in 1:1:dimension[1]){
    estep = 2*sqrt(ssigma_y[jj, jj])*m / (n-1)
    for(ii in 1:1:n){
      grid[jj, ii] = -sqrt(ssigma_y[jj, jj])*m + (ii-1)*estep
    }
  }


  return(grid)
}
