function X_smote = mySMOTE(X, N, k)
% mySMOTE  Synthetic Minority Oversampling Technique. A technique to
% generate synthetic samples as given in: https://www.jair.org/media/953/live-953-2037-jair.pdf
%   Usage:
%   X_smote = mySMOTE(X, N, k) 
%   
%   Inputs:
%   X: Original dataset
%   N: Percentage of data-augmentation intended, Typically, N > 100, if N < 100, then N is set to 100.
%   k: number of nearest neighbors to consider while performing
%   augmentation
% 
%   Outputs:
%   X_smote: augmented dataset containing original data as well.
%   
%   See also datasample, randsample

T = size(X, 1);

if N < 100
    N = 100;
end

N = ceil(N / 100);

X_smote = X;
for i = 1:T
    y = X(i,:);
    % find k-nearest samples
    [idx, ~] = knnsearch(X,y,'k',k);
    % retain only N out of k nearest samples
    idx = datasample(idx, N);
    
    x_nearest = X(idx,:);
    x_syn = bsxfun(@plus, bsxfun(@times, bsxfun(@minus,x_nearest,y), rand(N,1)), y);
    X_smote = cat(1, X_smote, x_syn);
end

end