clc; clear; close all;

% Load the .mat file
data = load('E:\1 Paper MCT\Cutting Tool Paper\Dataset\cutting tool data\mat files data\AE_ALL.mat');

% Extract AE_ALL structure
AE_ALL = data.AE_ALL;

% Class names (modify if your class keys are different)
classNames = {'BF', 'BFI', 'GF', 'GFI', 'N', 'NI', 'TF'};

% Sampling Rate (in Hz) – update if known, or use 1 MHz as default
Fs = 1e6;  
t_duration = 0.001; % Duration to show in seconds (optional for clarity)
num_points = round(t_duration * Fs); % Show only the first few points if needed

% Set up plot
figure('Color','w', 'Position', [100, 100, 1200, 600]);
tiledlayout(2, 4, 'Padding', 'compact', 'TileSpacing', 'compact');

for i = 1:length(classNames)
    class = classNames{i};

    % Extract one sample (assumed shape [1, 4] or similar; adjust if needed)
    raw_signal = AE_ALL.(class){1,1};  % Cell to double, adjust if format differs
    signal = raw_signal(:,1);  % Take channel 1 only

    % Optional: Trim to first N points
    if length(signal) > num_points
        signal = signal(1:num_points);
    end

    % Create time vector
    t = (0:length(signal)-1)/Fs;

    % Plot
    nexttile;
    plot(t, signal, 'LineWidth', 1.5);
    grid on;
    xlabel('Time (s)', 'FontWeight', 'bold');
    ylabel('Amplitude', 'FontWeight', 'bold');
    title(class, 'FontSize', 12, 'FontWeight', 'bold');
    set(gca, 'FontSize', 10, 'LineWidth', 1.2);
end

%sgtitle('Time-Domain AE Signals from Each Class', 'FontSize', 14, 'FontWeight', 'bold');
