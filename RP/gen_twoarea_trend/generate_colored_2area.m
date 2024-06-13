% Load the signals
load domi_trend_fil;
load colored_signal_2area.mat;

% Create a figure for comparison
figure;

% Plot the original signal (x_sig) in blue
plot(domi_trend_fil, 'b', 'LineWidth', 2);
hold on;

% Plot the colored signal (colored_signal_2area) in red with transparency
plot(colored_signal_2area, 'r', 'LineWidth', 2, 'LineStyle', '--', 'Marker', 'o', 'MarkerSize', 5, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r', 'Color', [1, 0, 0, 0.5]);

% Add labels and title
xlabel('Sample Index');
ylabel('Amplitude');
title('Comparison of Signals');

% Add legend
legend('Original Signal (x\_sig)', 'Colored Signal (colored\_signal\_2area)');

% Display the grid for better visualization
grid on;

% Hold off to stop adding elements to the current plot
hold off;
