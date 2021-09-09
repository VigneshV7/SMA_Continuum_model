% Homogeneous transformation matrix at each point on a constant curvature
% s denotes points on the curvature. s ranges from 0 - 1
% alpha is the desired angle of the tip in radians

function T = homogeneousTransformMatrix(s, alpha, length)

theta = s * alpha;

T = [ cos(theta), -sin(theta),   0,   length * ((1 - cos(theta))/alpha); ...
      sin(theta),  cos(theta),   0,   length * (sin(theta)/alpha)      ;...
      0,           0,            1,   0                                ;...
      0,           0,            0,   1                                ];

end