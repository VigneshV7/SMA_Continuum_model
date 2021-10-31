% Calculates Direct kinematics for the SMA continuum module given SMA
% lengths in the format [[l11, l12]; [l21, l22]; ...], d which is the
% attachment distance of the SMA wires from the neutral fibre and segment
% lengths which are the neutral fibre lengths per section. 
% Output is the transformation matrix from the base to the tip of the SMA
% continuum module
function T = FKineSMA(sma_length, d, l_nf)
beta = (l_nf - sma_length)/d;
T = CCSegment(beta, l_nf);
end