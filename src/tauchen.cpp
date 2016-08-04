
#include <math.h>
#include <vector>
using namespace std;

//======================================
//         Auxiliary
//======================================

double normCDF(double value){
  return 0.5 * erfc(-value * M_SQRT1_2);
}

//======================================
//         Grids
//======================================

// [[Rcpp::export]]
vector<double> grid(int ne, double ssigma_eps, double llambda_eps, double m){
  
  // This grid is made with Tauchen (1986)
  vector<double> gridee;
  gridee.resize(ne);
  
  double size = ne;
  double ssigma_y = sqrt(pow(ssigma_eps, 2) / (1 - pow(llambda_eps, 2)));
  double estep = 2*ssigma_y*m / (size-1);
  
  double it = 0;
  
  for(int i = 0; i < ne; i++){
    gridee[i] = -m*sqrt(pow(ssigma_eps, 2) / (1 - pow(llambda_eps, 2))) + it*estep;
    it++;
  }
  
  return(gridee);
}


//======================================
//         Transition matrix
//======================================

// [[Rcpp::export]]
vector<vector<double> > transition(int ne, double ssigma_eps, double llambda_eps, double m){
  
  // This grid is made with Tauchen (1986)
  vector<double> gridee;
  gridee.resize(ne);
  
  gridee = grid(ne, ssigma_eps, llambda_eps, m);
  
  double w = gridee[1] - gridee[0];
  
  vector<vector<double> > P;
  P.resize(ne);
  for(int i=0; i<ne; i++){
    P[i].resize(ne);
  }
  
  for(int j = 0; j < ne; j++){
    for(int k = 0; k < ne; k++){
      if(k == 0){
        P[j][k] = normCDF((gridee[k] - llambda_eps*gridee[j] + (w/2))/ssigma_eps);
      } else if(k == ne-1){
        P[j][k] = 1 - normCDF((gridee[k] - llambda_eps*gridee[j] - (w/2))/ssigma_eps);
      } else{
        P[j][k] = normCDF((gridee[k] - llambda_eps*gridee[j] + (w/2))/ssigma_eps) - normCDF((gridee[k] - llambda_eps*gridee[j] - (w/2))/ssigma_eps);
      }
    }
  }
  
  return(P);
}