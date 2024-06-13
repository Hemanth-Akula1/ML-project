clc
clear all
load test_tren_fil
x_sig = test_tren_fil';   % True signal
fs = 10;    % Sampling frequency
cf = fs / 2.5;  % Cutoff frequency

% Apply colored noise
[B, A] = butter(5, 2 * 2.5 / 6.25);
x_colored = filter(B, A, x_sig);   % Signal corrupted with colored noise

% Apply Sparse PCA
addpath('path_to_sparsepca_folder');  % Replace with the path to the SparsePCA folder
num_components = 1;  % Number of components to extract

opts = struct('numComp', num_components, 'verbose', false);
[spca_components, spca_scores] = spca(x_colored, opts);

% Extract clear signal from Sparse PCA scores
clear_signal = spca_scores * spca_components';

% Reconstruct the clear signal (optional: apply further denoising)
[B_reconstruct, A_reconstruct] = butter(5, 2 * cf / fs);
reconstructed_signal = filter(B_reconstruct, A_reconstruct, clear_signal);

% Save the reconstructed signal to a file
save('reconstructed_signal_sparsepca.mat', 'reconstructed_signal');