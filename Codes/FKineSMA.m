% Calculates Direct kinematics for the SMA continuum module given SMA
% length, d which is the attachment distance of the SMA wires from the 
% neutral fibre and l_nf which is the neutral fibre length per section. 
% Output is the transformation matrix from the base to the tip of the SMA
% continuum module
function T = FKineSMA(sma_length, d, l_nf)
alpha = (l_nf - sma_length)/d;
transform_mat = CCSegment(alpha, l_nf);

p_x = transform_mat(1, 4);
p_z = transform_mat(3, 4);
rotation_mat = transform_mat(1:3, 1:3);
eulZYX = rotm2eul(rotation_mat);
alpha = eulZYX(2);

% Create struct array
field1 = 'tip_position'; value1 = [p_x p_z];
field2 = 'alpha'; value2 = alpha;
field3 = 'transform_mat'; value3 = transform_mat;
T = struct(field1, value1, field2, value2, field3, value3);
end
