function [Wsmi,bxr] = find_SMI_Weigth(M,N,K,thArray,Pnoise)
% This function is used for Sample Matrix Inversion Beamformer (SMI)
% This function cumputes weigths using SMI algorithm

G = randn(N,K);

%--------------------------------------------------------------------------

v = cos(thArray);

bxr = zeros(M,1);
for m=0:M-1
    bxr(m+1) = (1i*m*pi); 
end
Y = bxr.*v;
A = (exp(Y));

%--------------------------------------------------------------------------

NN = sqrt(Pnoise)*randn(M,K);
    
%--------------------------------------------------------------------------

p = G(1,:);
pHerm = p';

%--------------------------------------------------------------------------

X = A*G + NN;
XHerm = X';

%--------------------------------------------------------------------------

Y = X*XHerm;
Wsmi = inv(Y)*X*pHerm;
