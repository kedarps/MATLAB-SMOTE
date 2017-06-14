# MATLAB-SMOTE
Matlab implementation of Synthetic Minority Oversampling Technique (SMOTE)

A technique to generate synthetic samples as given in: https://www.jair.org/media/953/live-953-2037-jair.pdf

##   Usage:
`X_smote = mySMOTE(X, N, k)` 
   
### Inputs:
- `X`: Original dataset `(n x d)` matrix
- `N`: Percentage of data-augmentation intended, Typically, N > 100, if N < 100, then N is set to 100. `(scalar)`
- `k`: number of nearest neighbors to consider while performing augmentation `(scalar)`
 
### Outputs:
- `X_smote`: augmented dataset containing original data as well. `(m x d)` matrix, where `m > n`
