% Code to generate representative plot for CC model
clear
clc

%% Calculate transforms along the curvature and plot
length = 1; % 1m
figure; hold on

for alpha = 0:pi/10:pi
    temp_points = [];
    for s = 0:0.002:1
        T_1 = homogeneousTransformMatrix(s, alpha, length);
        px = T_1(1, 4);
        py = T_1(2, 4);
        temp_points = [temp_points; [px, py]]; 
    end
    plot(temp_points(:, 1), temp_points(:, 2), '.');
end

% Plot parameters
grid on
% xmax = 1.2; xmin = -0.2; ymax = 1.2; ymin = -0.2;
% xlim([xmin xmax])
% ylim([ymin ymax])
% set(gca, 'xtick', xmin:0.2:xmax)
% set(gca, 'ytick', ymin:0.2:ymax)
axis equal
xlabel("x [m]")
ylabel("y [m]")
title("Soft continuum arm with constant curvature. L = 1m, alpha = 0:pi/10:pi")
hold off

% Save plot
saveas(gcf, '../Images/CCplots.png')

%% Code to generate gif
length = 1; % 1m

h = figure;
filename = '../Images/CCmodel.gif';
axis tight manual
grid on

for alpha = 0:pi/10:pi
    temp_points = [];
    for s = 0:0.002:1
        T_1 = homogeneousTransformMatrix(s, alpha, length);
        px = T_1(1, 4);
        py = T_1(2, 4);
        temp_points = [temp_points; [px, py]]; 
    end
    
    % Plot the current curve
    plot(temp_points(:, 1), temp_points(:, 2), '.');
    xlabel("x [m]")
    ylabel("y [m]")
    title("Soft continuum arm with constant curvature. L = 1m, alpha = 0:pi/10:pi")
%     xmax = 1.2; xmin = -0.2; ymax = 1.2; ymin = -0.2;
%     xlim([xmin xmax])
%     ylim([ymin ymax])
%     set(gca, 'xtick', xmin:0.2:xmax)
%     set(gca, 'ytick', ymin:0.2:ymax)
    axis equal
    grid on
    drawnow
    
    % Capture the plot as an image
    frame = getframe(h);
    im = frame2im(frame);
    [imind, cm] = rgb2ind(im, 256);
    
    % Write to the GIF file
    if alpha == pi/10
        imwrite(imind, cm, filename, 'gif', 'Loopcount', inf);
    else
        imwrite(imind, cm, filename, 'gif', 'WriteMode', 'append');
    end
end

%% Plot tip values using CCSegment
length = 1; % 1m
figure; hold on

for alpha = 0:pi/10:pi
    T_3 = CCSegment(alpha, length);
    px = T_3(1, 4);
    py = T_3(2, 4);
    plot(px, py, '*');
end

% Plot parameters
grid on
% xmax = 1.2; xmin = -0.2; ymax = 1.2; ymin = -0.2;
% xlim([xmin xmax])
% ylim([ymin ymax])
% set(gca, 'xtick', xmin:0.2:xmax)
% set(gca, 'ytick', ymin:0.2:ymax)
axis equal
xlabel("x [m]")
ylabel("y [m]")
title("Soft continuum arm tip values with CCSegment. L = 1m, alpha = 0:pi/10:pi")
hold off

% Save plot
saveas(gcf, '../Images/CCSegmentTest.png')

%% Plot tip values using PCCSection
length = 1; % 1m
num_segments = 4;
figure; hold on

for alpha = 0:pi/10:pi
    T_4 = PCCSection(alpha, length, num_segments);
    px = T_4(1, 4);
    py = T_4(2, 4);
    plot(px, py, '*');
end

% Plot parameters
grid on
% xmax = 1.2; xmin = -0.2; ymax = 1.2; ymin = -0.2;
% xlim([xmin xmax])
% ylim([ymin ymax])
% set(gca, 'xtick', xmin:0.2:xmax)
% set(gca, 'ytick', ymin:0.2:ymax)
axis equal
xlabel("x [m]")
ylabel("y [m]")
title("Soft continuum arm tip values with PCCSection. L = 1m, alpha = 0:pi/10:pi")
hold off

% Save plot
saveas(gcf, '../Images/PCCSectionTest.png')