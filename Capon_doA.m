function Pcapon = Capon_doA(d,Psignal,snr,M,N,theta)
% This function is used for DoA Capon

thetaArray = zeros(1,N);
for i=0:N-1
    thetaArray(i+1) = 50+i*d;
end
thetaArray = deg2rad(thetaArray);

Pnoise = Psignal/(10^(snr/10));

%--------------------------------------------------------------------------

%a)

%compute column vector j*b*r (MX1)
bxr = zeros(M,1);
for m=0:M-1
    bxr(m+1) = (1i*m*pi); 
end

%--------------------------------------------------------------------------

%compute row vector v (1XN)
vn = cos(thetaArray);

%--------------------------------------------------------------------------

%create array A (MXN)
A = exp(bxr.*vn);
AHerm = A';

%--------------------------------------------------------------------------

Rgg = Psignal*eye(N);
Rnn = Pnoise*eye(M);
Rxx = A*Rgg*AHerm + Rnn;
RxxInv = Rxx\eye(M);

%--------------------------------------------------------------------------

Pcapon = zeros(1,length(theta));
for i=1:length(theta) 
    
    ad = exp(1i*(0:M-1)'*pi*cos(deg2rad(theta(i))));
    Pcapon(i)=1./abs((ad)'*RxxInv*ad); 
    
end 
