% Sample Matrix Inversion Beamformer (SMI)
% Vasiliki Zarkadoula
clc;
clear;
close all;

%--------------------------------------------------------------------------

% data

M = 16;             % number of elements of antenna
N = 6;              % number of arrival signals

% desirable angle
th0 = deg2rad(50);  
% interference angles
th1 = deg2rad(70);
th2 = deg2rad(90);
th3 = deg2rad(110);
th4 = deg2rad(130);
th5 = deg2rad(150);

thArray = [th0 th1 th2 th3 th4 th5];

Psignal = 1;        % power of incoming signals
Pnoise = 0.1;       % power of noise signals

K = 50;             % sampling

%--------------------------------------------------------------------------

%1)
[Wsmi,bxr] = find_SMI_Weigth(M,N,K,thArray,Pnoise);

%--------------------------------------------------------------------------

%2)
WsmiHerm = Wsmi';
theta = (0:0.1:180);
theta = deg2rad(theta);
x = cos(theta);
a = exp(bxr.*x);
AF = WsmiHerm*a;
normalizedAF = abs(AF)./norm(AF);
plot(rad2deg(theta),normalizedAF);
xlabel('è/degree'); 
ylabel('normalized AF'); 
title('SMI Beamformer'); 
grid on;


%--------------------------------------------------------------------------

%3)
dth = find_Divergences(normalizedAF,thArray,theta);










