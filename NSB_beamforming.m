function [Wnsb,SINR,dth0,dth1,dth2,dth3,dth4] = NSB_beamforming(theta_array,snr,M,N)
% This function is used for Null-Steering Beamformer (NSB)

% INPUTS:
% theta_array -> (1XN) vector consisting of angles in rad [è0,è1,è2,è3,è4]
% snr -> value in dB
% M -> number of elements of antenna
% N -> number of arrival signals

% OUTPUTS:
% Wnsb -> vector of weigths computed by NSB algorithm
% SINR -> value of Signal-to-Interference-plus-Noise Ratio 
% dth0,dth1,dth2,dth3,dth4 -> main lobe and null divergences

%--------------------------------------------------------------------------

Psignal = 1;    % signal power
s = Psignal/(10^(snr/10));

%--------------------------------------------------------------------------

% compute column vector j*b*r (MX1)
bxr = zeros(M,1);
for m = 0:M-1
    bxr(m+1) = (1i*m*pi); 
end

%--------------------------------------------------------------------------

% compute row vector v (1XN)
vn = cos(theta_array);

%--------------------------------------------------------------------------

% create array A (MXN)
A = exp(bxr.*vn);

%--------------------------------------------------------------------------

% compute weights
e = [1;0;0;0;0]; %(NX1)
Wnsb = find_NSB_Weight(A,s,e);

%--------------------------------------------------------------------------

% compute hermitian vector of w
WnsbHerm = Wnsb';

%--------------------------------------------------------------------------

% compute SINR
SINR = find_NSB_SINR(Wnsb,WnsbHerm,A,M,N,s,Psignal);

% radiation pattern
theta = (0:0.1:180);
theta = deg2rad(theta);

x = cos(theta);
aTheta = exp(bxr.*x);
AF = WnsbHerm*aTheta;
normalizedAF = abs(AF)./norm(AF);
plot(rad2deg(theta),normalizedAF);

% main lobe divergence
% find theta value of max peak in 2d radiation pattern and compare with è0
[peaks,locsPeaks] = findpeaks(normalizedAF,rad2deg(theta));
max_peak = max(peaks);
position = find(peaks == max_peak);
max_lobe = locsPeaks(position);
dth0 = abs(max_lobe-rad2deg(theta_array(1)));

% null divergences
% find theta values of min peaks in 2d radiation pattern and compare with
% è1,è2,è3,è4
[~,loc_min] = findpeaks(-normalizedAF,rad2deg(theta));
dist1 = abs(loc_min - rad2deg(theta_array(2)));
dist2 = abs(loc_min - rad2deg(theta_array(3)));
dist3 = abs(loc_min - rad2deg(theta_array(4)));
dist4 = abs(loc_min - rad2deg(theta_array(5)));
dth1 = min(dist1);
dth2 = min(dist2);
dth3 = min(dist3);
dth4 = min(dist4);






