% Code to generate representative plot for CC model
clear all
clc

%% Calculate transforms along the curvature and plot
length = 1; % 1m
temp_points = [];
figure(1); hold on
for alpha = pi/10:pi/10:pi
    for s = 0:0.002:1
        T_1 = homogeneousTransformMatrix(s, alpha, length);
        px = T_1(1, 4);
        py = T_1(2, 4);
        temp_points = [temp_points; [px, py]]; 
    end
    plot(temp_points(:, 1), temp_points(:, 2), '.');
    temp_points = [];
end
grid on
xlabel("x [m]")
ylabel("y [m]")
title("Soft continuum arm with constant curvature. L = 1m, alpha = pi/10:pi/10:pi")
hold off