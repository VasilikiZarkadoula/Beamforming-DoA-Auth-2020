function Wnsb = find_NSB_Weight(array,s,e)
% This function is used for Null-Steering Beamformer (NSB)

% This function cumputes weigths using NSB algorithm
% Inputs:
% array -> 2d array MXN
% s -> noise power 
% e -> vector NX1
% Output:
% Wnsb -> vector MX1

hermitian = array';     %(NXM)
Y = hermitian*array;    %(NXN)

% diagonal loading
I = eye(size(Y));
Y2 = Y + I*s;           %(NXN)

Y_inv = inv(Y2);        %(NXN)
Wnsb = array*Y_inv*e;   %(MX1)
