function SINR = find_SINR(w,w_herm,A,M,N,s,Psignal)
% This function is used for Null-Steering Beamformer (NSB)

% Inputs:
% w -> vector of weights computed by NSB algorithm
% w -> hermitian vector of w
% A -> array MXN
% s -> noise power 
% Psignal -> signal power
% Output:
% SINR -> value of Signal-to-Interference-plus-Noise Ratio 

ad = A(:,1);         %first column of array A, (MX1)
ad_herm = ad';       %(1XM)
Ai = A(:,2:N);       %columns 2 to 5 of array A, (MX(N-1))
Ai_herm = Ai';       %((N-1)XM)

Rnn = s * eye(M);    %(MXM)
Rgigi = eye(N-1);    %((N-1)X(N-1))

SINR = 10*log10((Psignal*w_herm*ad*ad_herm*w)/(w_herm*Ai*Rgigi*Ai_herm*w+w_herm*Rnn*w));   %NUM



