clear
clc
%% Parameters
l_nf = 0.1;    % 0.1m
d = 0.005;

%% Unguided(circular arc) vs guided(piecewise linear segments) sma wires
beta = deg2rad(90);    % target angle
l_1 = l_nf - d*beta;
angle_arr = [];
lin_sma_arr = [];
num_spacers = [];
l_1_arr = [];
percent_err = l_1 - (1*l_1/100);
percent_err_line = [];
point_per_err = l_1 - (0.2*l_1/100);
point_per_line = [];
target_beta = [];
ang_percent_err = rad2deg(beta) + (1*rad2deg(beta)/100);
ang_percent_err_line = [];
ang_point_per_err = rad2deg(beta) + (0.2*rad2deg(beta)/100);
ang_point_per_line = [];

for n = 1:1:30
    l_1_prime = (l_1*2*n*sin(beta/(2*n)))/beta;
    beta_actual = (l_nf - l_1_prime)/d;
    lin_sma_arr = [lin_sma_arr l_1_prime];
    angle_arr = [angle_arr rad2deg(beta_actual)];
    num_spacers = [num_spacers n];
    l_1_arr = [l_1_arr l_1];
    percent_err_line = [percent_err_line percent_err];
    point_per_line = [point_per_line point_per_err];
    target_beta = [target_beta rad2deg(beta)];
    ang_percent_err_line = [ang_percent_err_line ang_percent_err];
    ang_point_per_line = [ang_point_per_line ang_point_per_err];
end

figure(3); hold on
plot(num_spacers, lin_sma_arr, num_spacers, l_1_arr,...
    num_spacers, percent_err_line, '--', ...
    num_spacers, point_per_line, '--')
grid on
xlabel("Number of spacers (1 indicates only one section)")
ylabel("Length of sma [m]")
title("Relation between l_1^l and l_1(Circular arc) with regards to num of spacers")
legend('sma line', 'sma arc', '1% error', '0.2% error')
hold off 

figure(4); hold on
plot(num_spacers, angle_arr, num_spacers, target_beta, ...
    num_spacers, ang_percent_err_line, '--', ...
    num_spacers, ang_point_per_line, '--')
grid on
xlabel("Number of spacers (1 indicates only one section)")
ylabel("Angle of section [deg]")
title("Relation between target angle and actual angle with regards to num of spacers")
legend('sma line', 'sma arc', '1% error', '0.2% error')
hold off 