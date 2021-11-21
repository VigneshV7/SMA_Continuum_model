% Homogeneous transformation matrix at each point on a constant curvature
% s denotes points on the curvature. s ranges from 0 - 1
% alpha is the desired angle of the tip in radians

function T = homogeneousTransformMatrix(s, alpha, length)

theta = s * alpha;

if alpha == 0
    transform_mat = [1, 0, 0, 0; ...
                     0, 1, 0, 0; ...
                     0, 0, 1, s * length; ...
                     0, 0, 0, 1];
else
    transform_mat = [  cos(theta),  0,   -sin(theta),   length * ((1 - cos(theta))/alpha); ...
                       0,           1,    0,            0                                ; ...
                       sin(theta),  0,    cos(theta),   length * sin(theta)/alpha        ; ...
                       0,           0,    0,            1                                ];
end

p_x = transform_mat(1, 4);
p_z = transform_mat(3, 4);

% Create a struct array
field1 = 'point_coord'; value1 = [p_x p_z];
field2 = 'alpha'; value2 = theta;
field3 = 'transform_mat'; value3 = transform_mat;
T = struct(field1, value1, field2, value2, field3, value3);
end