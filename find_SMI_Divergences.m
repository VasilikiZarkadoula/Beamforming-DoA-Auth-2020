function dth = find_SMI_Divergences(normalizedAF,thArray,theta)
% This function is used for Sample Matrix Inversion Beamformer (SMI)

[peaks,locs_pk] = findpeaks(normalizedAF,rad2deg(theta));
max_peak = max(peaks);
position = find(peaks == max_peak);
max_lobe = locs_pk(position);
dth0 = abs(max_lobe-rad2deg(thArray(1)));

[min_values,loc_min] = findpeaks(-normalizedAF,rad2deg(theta));
dist1 = abs(loc_min - rad2deg(thArray(2)));
dist2 = abs(loc_min - rad2deg(thArray(3)));
dist3 = abs(loc_min - rad2deg(thArray(4)));
dist4 = abs(loc_min - rad2deg(thArray(5)));
dist5 = abs(loc_min - rad2deg(thArray(6)));
dth1 = min(dist1);
dth2 = min(dist2);
dth3 = min(dist3);
dth4 = min(dist4);
dth5 = min(dist5);

dth = [dth0 dth1 dth2 dth3 dth4 dth5];