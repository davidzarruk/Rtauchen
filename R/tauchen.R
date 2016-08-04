
# Corro un archivo con los parametros

grid=function(ne, ssigma_eps, llambda_eps, m){
  gride<-array(0,dim=ne)
  size=ne
  ssigma_y=sqrt(ssigma_eps^2/(1-llambda_eps^2))
  estep=2*ssigma_y/(size-1)
  for(ii in 1:1:ne){
    gride[ii]=-(m*sqrt(ssigma_eps^2)/(1-llambda_eps^2))+ii*estep
  }
	return(gride)
}

Rtauchen=function(ne,ssigma_eps,llambda_eps,m){
  ggride<-array(0,dim=ne)
  gridee=grid(ne,ssigma_eps,llambda_eps,m)
  w=ggride[2]-ggride[1]
  P<-array(0,dim=c(ne,ne))
  for(jj in 1:ne){
    for(kk in 1:ne){
      if(kk==1){
        P[jj,kk]=pnorm((gridee[kk]-llambda_eps*gridee[jj]+(w/2))/ssigma_eps)
      }
      else if(kk==ne-1){
        P[jj,kk]=pnorm((gridee[kk]-llambda_eps*ggride[jj]-(w/2))/ssigma_eps)
      }
      else{
        P[jj,kk]=pnorm((gridee[kk]-llambda_eps*gridee[jj]+(w/2))/ssigma_eps)-pnorm((gridee[kk]-llambda_eps*gridee[jj]-(w/2)))
      }
    }
  }
  return(P)
}