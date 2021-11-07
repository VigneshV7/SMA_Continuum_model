% Inverse kinematics for constant curvature assumption and assuming
% constant distance between spacers
% TODO have to check failure conditions
function sma_lengths = IKineSMA(alpha, l_nf, d, num_spacers)
if alpha == 0
    l_1_prime = l_nf;
    l_2_prime = l_nf;
else
    l_1_prime = ((l_nf-(alpha*d))*2*num_spacers*sin(alpha/(2*num_spacers)))/alpha;
    l_2_prime = ((l_nf+(alpha*d))*2*num_spacers*sin(alpha/(2*num_spacers)))/alpha;
end
sma_lengths = [l_1_prime, l_2_prime];
end