% Results of NSB
clc;
clear;
close all;

%4

%--------------------------------------------------------------------------

%import data from txt file and save them in an array
data = importdata('AoAdev_SINR.txt');
array = data;

%--------------------------------------------------------------------------

%i)

% min,max,mean,std of dth0
minDth0 = min(array(:,6));
maxDth0 = max(array(:,6));
meanDth0 = mean(array(:,6));
stdDth0 = std(array(:,6));

%--------------------------------------------------------------------------

%ii)

% min,max,mean,std of total dth1,dth2,dth3,dth4
minArray = zeros(4,1);
maxArray = zeros(4,1);
meanArray = zeros(4,1);
stdArray = zeros(4,1);
for i=1:4
    minArray(i) = min(array(:,6+i));
    maxArray(i) = max(array(:,6+i));
    meanArray(i) = mean(array(:,6+i));
    stdArray(i) = std(array(:,6+i));
end
minDth = min(minArray);
maxDth = max(maxArray);
meanDth = mean(meanArray);
stdDth = std(stdArray);

%--------------------------------------------------------------------------

%iii)

% min,max,mean,sth of SINR
minSINR = min(array(:,11));
maxSINR = max(array(:,11));
meanSINR = mean(array(:,11));
stdSINR = std(array(:,11));

%--------------------------------------------------------------------------

% create a row vector with the above values
result = [minDth0,maxDth0,meanDth0,stdDth0,minDth,maxDth,meanDth,stdDth,minSINR,maxSINR,meanSINR,stdSINR];

