clc; clear;

% Load the MAT file
data = load('E:\1 Paper MCT\Cutting Tool Paper\Dataset\cutting tool data\mat files data\AE_ALL.mat');

% Choose the class and cell index
class_name = 'TF';    % Options: 'BF', 'BFI', 'GF', 'GFI', 'TF', 'N', 'NI'
cell_idx = 4;         % Index from 1 to 4
signal_idx = 22;       % Signal number from 1 to 40

% Extract the signal
selected_class = data.AE_ALL.(class_name);       % Access field dynamically
signal_matrix = selected_class{cell_idx};        % 40x1000000 matrix
signal = signal_matrix(signal_idx, :);           % 1x1,000,000 row vector

% Sampling frequency (adjust if needed)
fs = 1e6;  % 1 MHz

% Generate Continuous Wavelet Transform
[cfs, freqs] = cwt(signal, 'amor', fs);

% Time vector (in milliseconds)
t = (0:length(signal)-1) / fs;

% Plot high-quality scalogram
figure('Color', 'w');  % White background
imagesc(t*1e3, freqs/1e3, abs(cfs))  % Time in ms, Frequency in kHz
axis xy
xlabel('Time (ms)', 'FontSize', 26, 'FontWeight', 'bold')
ylabel('Frequency (kHz)', 'FontSize', 26, 'FontWeight', 'bold')
set(gca, 'FontSize', 20, 'FontWeight', 'bold')  % Axis font

% Colorbar
cb = colorbar;
cb.Label.String = 'Magnitude';
cb.Label.FontSize = 20;
cb.Label.FontWeight = 'bold';

% Optional: Save the figure
%saveas(gcf, sprintf('CWT_%s_Cell%d_Signal%d.png', class_name, cell_idx, signal_idx))
