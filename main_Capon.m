% Direction of Arrival estimation using Capon method
% Vasiliki Zarkadoula
clc
clear
close all

%--------------------------------------------------------------------------

% data

M = 16;             % number of elements of antenna
N = 8;              % number of arrival signals
Psignal = 1;
snr = 10;
theta = 1:0.01:180;
d = 10;

%--------------------------------------------------------------------------

%a)

Pcapon = Capon_doA(d,Psignal,snr,M,N,theta);
normalizedP = 10*log10(Pcapon/max(Pcapon));
figure;
plot(theta,normalizedP);
xlabel('è/degree'); 
ylabel('10log(Py/Py_m_a_x) (dB)'); 
title('Capon - ä=10'); 
grid on;

%b)

dmin = 7;   

Pcapon1 = Capon_doA(dmin,Psignal,snr,M,N,theta);
normalizedP1 = 10*log10(Pcapon1/max(Pcapon1));
figure;
plot(theta,normalizedP1);
xlabel('è/degree'); 
ylabel('10log(Py/Py_m_a_x) (dB)'); 
title('Capon - ämin'); 
grid on;




