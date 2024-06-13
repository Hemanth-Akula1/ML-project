% Load data
data = load('test_tren_fil.mat');
x_sig = data.test_tren_fil(:);  % Original noise signal
fs = 10;  % Sampling frequency
cf = fs / 2.5;  % Cutoff frequency

% Normalize the cutoff frequency
normalized_cf = cf / (fs / 2);

% Apply colored noise
[B, A] = butter(5, normalized_cf, 'low');  % Use 'low' for low-pass filter
x_colored = filter(B, A, x_sig);  % Signal corrupted with colored noise

time = (0:length(x_colored)-1) / fs;

% Combine the signals for NMF
X_nmf = [x_sig, x_colored];

% Combine the signals for ICA
X_ica = [x_sig, x_colored];

% Add a small positive constant to ensure non-negativity for NMF
X_nmf = X_nmf + abs(min(X_nmf(:))) + 1e-10;

% Perform Non-negative Matrix Factorization (NMF) with multiple iterations
num_sources = 2;
num_iterations_nmf = 10;
ensemble_nmf_results = zeros(length(x_colored), num_iterations_nmf);

for i = 1:num_iterations_nmf
    rng(i);  % Set random seed for reproducibility
    [W, ~] = nnmf(X_nmf, num_sources);
    reconstructed_signal = W(:, 1);
    ensemble_nmf_results(:, i) = reconstructed_signal;
end

% Perform Independent Component Analysis (ICA) with multiple iterations
num_iterations_ica = 10;
ensemble_ica_results = zeros(length(x_colored), num_iterations_ica);

for i = 1:num_iterations_ica
    rng(i);  % Set random seed for reproducibility
    S_ = ica(X_ica, 'algorithm', 'deflation', 'numOfIC', num_sources);
    reconstructed_signal_ica = S_(:, 1);
    ensemble_ica_results(:, i) = reconstructed_signal_ica;
end




% Apply Sparse PCA for noise reduction
num_components = 1;  % Number of components to extract
spca = sparsepca(x_colored, 'NumComponents', num_components, 'Alpha', 0.1);  % Adjust alpha as needed
x_denoised = spca.Components * spca.TransformWeights';

% Combine results from NMF, ICA, and Sparse PCA
ensemble_stacked_results = [ensemble_nmf_results, ensemble_ica_results, x_denoised];

% Use ensemble_stacked_results for training a regression model (e.g., RandomForestRegressor)
regressor = TreeBagger(50, ensemble_stacked_results, x_sig);

% Make predictions using the ensemble model
predictions = predict(regressor, ensemble_stacked_results);

% Calculate reconstruction error between original signal and ensemble predictions
reconstruction_error_ensemble = norm(x_sig - str2double(predictions)) / norm(x_sig);
fprintf('Reconstruction Error for Ensemble Predictions: %.4f\n', reconstruction_error_ensemble);

% Plot the original noise signal and the ensemble predictions
figure;

subplot(3, 1, 1);
plot(time, x_sig);
xlabel('Time (s)');
ylabel('Clean signal');

subplot(3, 1, 2);
plot(time, str2double(predictions));
xlabel('Time (s)');
ylabel('Reconstructed Signal');

subplot(3, 1, 3);
plot(time, x_colored);
title('Colored Signal');
xlabel('Time (s)');
ylabel('Clean signal');

tight_layout();
