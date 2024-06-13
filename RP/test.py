import numpy as np
import scipy.signal as signal
import matplotlib.pyplot as plt
from sklearn.decomposition import NMF
from sklearn.metrics import mean_squared_error


np.random.seed(0)

# Load the test signal
x_sig = np.loadtxt('test_tren_fil.txt')
x_sig = x_sig.reshape(-1, 1)  # Reshape to a column vector

# Signal parameters
fs = 10
cf = fs / 2.5

# Create colored noise
order = 5
b, a = signal.butter(order, 2 * cf / fs)
x_colored = signal.lfilter(b, a, x_sig[:, 0])

# Combine signals
noisy_signal = np.vstack((x_sig[:, 0], x_colored))

# Apply NMF
num_sources = 2
num_iterations = 1000
model = NMF(n_components=num_sources, init='random', random_state=0, max_iter=num_iterations)
W = model.fit_transform(noisy_signal.T)
H = model.components_

# Reconstruct the original noise signal
reconstructed_original = np.dot(W[:, 0], H[0, :])

# Reconstruct the colored noise signal
reconstructed_colored = np.dot(W[:, 1], H[1, :])

# Create plots
plt.figure()

plt.subplot(3, 1, 1)
plt.plot(x_sig)
plt.title('Original Signal')

plt.subplot(3, 1, 2)
plt.plot(x_colored)
plt.title('Colored Noise Signal')

plt.subplot(3, 1, 3)
plt.plot(reconstructed_original)
plt.plot(reconstructed_colored)
plt.title('Reconstructed Signals')

# Calculate reconstruction errors
reconstruction_error_original = np.linalg.norm(x_sig - reconstructed_original) / np.linalg.norm(x_sig)
reconstruction_error_colored = np.linalg.norm(x_colored - reconstructed_colored) / np.linalg.norm(x_colored)
print('Reconstruction Error for Noise Signal: {:.4f}'.format(reconstruction_error_original))
print('Reconstruction Error for Colored Noise Signal: {:.4f}'.format(reconstruction_error_colored))

plt.tight_layout()
plt.show()
