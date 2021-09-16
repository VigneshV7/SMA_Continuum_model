% Calculates Direct kinematics for the SMA continuum module given SMA
% lengths in the format [[l11, l12]; [l21, l22]; ...], d which is the
% attachment distance of the SMA wires from the neutral fibre and segment
% lengths which are the neutral fibre lengths per section. 
% Output is the transformation matrix from the base to the tip of the SMA
% continuum module
function T = FKineSMA(sma_lengths, d, segment_lengths)
num_segments = length(segment_lengths);
T = eye(4);
for i = 1:num_segments
    beta = (sma_lengths(i, 2) - sma_lengths(i, 1))/(2*d);
    T_temp = CCSegment(beta, segment_lengths(i));
    T = T*T_temp;
end
end