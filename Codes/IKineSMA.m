% Inverse kinematics for constant curvature assumption and assuming
% constant distance between spacers
% TODO have to check failure conditions
function sma_lengths = IKineSMA(px, py, num_segments, L_nf, d)
l_nf = L_nf/num_segments; % length of neutral fibre per section
alpha = 2*atan2(px, py); % total section angle
beta = alpha/num_segments;
l_sma2 = d*beta + l_nf;
l_sma1 = 2*l_nf - l_sma2;
sma_lengths = [];
for i = 1:num_segments
    sma_lengths = [sma_lengths; [l_sma1, l_sma2]];
end
end