% Null-Steering Beamformer (NSB)
% Vasiliki Zarkadoula
clc;
clear;
close all;

%data

M = 16;     % number of elements of antenna
N = 5;      % number of arrival signals

theta = 30; % (è)

% choose from different delta(ä) and snr 
delta = 2;
%delta = 4;
%delta = 6;
%delta = 8;
%delta = 10;

snr = 0; 
%snr = 5;
%snr = 10;
%snr = 15;
%snr = 20;

%--------------------------------------------------------------------------

%1

%i,ii)

% 5X5 array consisting of angle values (30,30+ä,30+2ä,30+3ä,30+4ä) in deg 
thetaArray = createThetaArray(theta,delta);
thetaArrayFirst = thetaArray(1,:);

%iii,iv)

% 5X5 array consisting of angle values (31,31+ä,31+2ä,31+3ä,31+4ä) in deg 
thetaArray2 = createThetaArray(theta+1,delta);
thetaArray2First = thetaArray2(1,:);

%v)

% 3d array consisting of angle values (è,è+ä,è+2ä,è+3ä,è+4ä) from è=30 
% to è+4*ä=150
thetaArrayTotal = createThetaArrayTotal(theta,delta);
% deg to rad
thetaArrayTotal = deg2rad(thetaArrayTotal);
%3d array to 2d array 
C = permute(thetaArrayTotal,[1 3 2]);
C = reshape(C,[],size(thetaArrayTotal,2),1);
n = length(C);

%--------------------------------------------------------------------------

%2

%i,ii,iii)

Wnsb = zeros(M,1,n);
SINR = zeros(1,n);
dth0 = zeros(1,n);
dth1 = zeros(1,n);
dth2 = zeros(1,n);
dth3 = zeros(1,n);
dth4 = zeros(1,n);

% for every vector (è,è+ä,è+2ä,è+3ä,è+4ä) return NSB weights, SINR, main 
% lobe divergences (dth0) and null divergences (dth1,dth2,dth3,dth4)
for i=1:n
    [Wnsb(:,:,i),SINR(i),dth0(i),dth1(i),dth2(i),dth3(i),dth4(i)] = NSB_beamforming(C(i,:),snr,M,N);
end


%--------------------------------------------------------------------------

%3

C = rad2deg(C);
dth = [dth0',dth1',dth2',dth3',dth4'];
SINR = SINR';

% array of angles (è0,è1,è2,è3,è4), their corresponding divergences
% (dth0,dth1,dth2,dth3,dth4) and SINR
ARRAY = [abs(C),abs(dth),SINR];

%save array in txt file
fid = fopen('AoAdev_SINR.txt','wt');
%write the array
if fid > 0
     fprintf(fid,'%g\t%g\t%g\t%g\t%g\t%g\t%g\t%g\t%g\t%g\t%g\t\n',ARRAY');
     fclose(fid);
end

