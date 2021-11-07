% Calculates Direct kinematics for the SMA continuum module given SMA
% length, d which is the attachment distance of the SMA wires from the 
% neutral fibre and l_nf which is the neutral fibre length per section. 
% Output is the transformation matrix from the base to the tip of the SMA
% continuum module
function T = FKineSMA(sma_length, d, l_nf)
alpha = (l_nf - sma_length)/d;
T = CCSegment(alpha, l_nf);
end