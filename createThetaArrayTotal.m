function theta_array_total = createThetaArrayTotal(theta,delta)
% This function is used for Null-Steering Beamformer (NSB)

% Inputs:
% theta,delta -> angles in deg
% Output:
% theta_array_total -> 3d 5X5Xi array consisting of angle values 
% (è,è+ä,è+2ä,è+3ä,è+4ä)  in deg

theta_array_total = [];
for i = 0:inf
    if((theta+i)+4*delta <= 150 )
        theta_array_total(:,:,i+1) = createThetaArray((theta+i),delta);
    else
        break;
    end
end