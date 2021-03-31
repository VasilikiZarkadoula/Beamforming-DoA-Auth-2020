function th = createThetaArray(theta,delta)
% This function is used for Null-Steering Beamformer (NSB)

% Inputs:
% theta(θ),delta(δ) -> angles in deg
% Output:
% th -> 5X5 array consisting of angle values (θ,θ+δ,θ+2δ,θ+3δ,θ+4δ) in deg
% and in different order

th(1,:) = [theta,theta+delta,theta+2*delta,theta+3*delta,theta+4*delta];
th(2,:) = [theta+delta,theta,theta+2*delta,theta+3*delta,theta+4*delta];
th(3,:) = [theta+2*delta,theta,theta+delta,theta+3*delta,theta+4*delta];
th(4,:) = [theta+3*delta,theta,theta+delta,theta+2*delta,theta+4*delta];
th(5,:) = [theta+4*delta,theta,theta+delta,theta+2*delta,theta+3*delta];
