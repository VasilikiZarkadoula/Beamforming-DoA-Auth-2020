function th = createThetaArray(theta,delta)
% This function is used for Null-Steering Beamformer (NSB)

% Inputs:
% theta(è),delta(ä) -> angles in deg
% Output:
% th -> 5X5 array consisting of angle values (è,è+ä,è+2ä,è+3ä,è+4ä) in deg
% and in different order

th(1,:) = [theta,theta+delta,theta+2*delta,theta+3*delta,theta+4*delta];
th(2,:) = [theta+delta,theta,theta+2*delta,theta+3*delta,theta+4*delta];
th(3,:) = [theta+2*delta,theta,theta+delta,theta+3*delta,theta+4*delta];
th(4,:) = [theta+3*delta,theta,theta+delta,theta+2*delta,theta+4*delta];
th(5,:) = [theta+4*delta,theta,theta+delta,theta+2*delta,theta+3*delta];
