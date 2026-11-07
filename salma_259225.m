
clear; clc; close all;

%% 1. Parameters from Student ID
A = 2;                      % Amplitude
f = 5000;                   % Signal frequency (Hz)
Fs = 50000;                 % Sampling frequency (Hz) > 2*f (Nyquist)
t = 0:1/Fs:0.01;            % Time vector: 0 to 10 ms
N = length(t);              % Number of samples
freq = (0:N-1)*(Fs/N);      % Frequency axis for FFT (Hz)

%% 2. Generate Original Signals
% X1: Sine wave
X1 = A * sin(2*pi*f*t);
% X2: Cosine wave
X2 = A * cos(2*pi*f*t);
% X3: Complex exponential
X3 = A * exp(1j*2*pi*f*t);

%% 3. Generate Random Noise Signals (Gaussian, zero mean)
rng(0);                     % For reproducible results (optional)
n1 = 0.8 * randn(size(t));  % Noise for X1
n2 = 0.8 * randn(size(t));  % Noise for X2
n3 = 0.8 * randn(size(t));  % Noise for X3

%% 4. Add Noise to Signals (Noisy Signals)
x1_noisy = X1 + n1;
x2_noisy = X2 + n2;
x3_noisy = X3 + n3;

%% ==================== PLOT ORIGINAL SIGNALS ====================
% Original X1 (Sine)
figure('Name','Original Signal X1 (Sine)');
subplot(2,1,1);
plot(t*1000, X1); xlabel('Time (ms)'); ylabel('Amplitude');
title('X1(t) = A sin(2πft) - Time Domain'); grid on;
subplot(2,1,2);
plot(freq/1000, abs(fft(X1))/N); xlabel('Frequency (kHz)'); ylabel('|X1(f)|');
title('X1 - Frequency Domain'); xlim([0 Fs/2/1000]); grid on;
sgtitle('Original Signal X1 (Sine)');

% Original X2 (Cosine)
figure('Name','Original Signal X2 (Cosine)');
subplot(2,1,1);
plot(t*1000, X2); xlabel('Time (ms)'); ylabel('Amplitude');
title('X2(t) = A cos(2πft) - Time Domain'); grid on;
subplot(2,1,2);
plot(freq/1000, abs(fft(X2))/N); xlabel('Frequency (kHz)'); ylabel('|X2(f)|');
title('X2 - Frequency Domain'); xlim([0 Fs/2/1000]); grid on;
sgtitle('Original Signal X2 (Cosine)');

% Original X3 (Complex Exponential) - Real, Imag, Magnitude
figure('Name','Original Signal X3 (Complex Exponential)');
subplot(3,1,1);
plot(t*1000, real(X3)); xlabel('Time (ms)'); ylabel('Amplitude');
title('X3 - Real Part (Cosine)'); grid on;
subplot(3,1,2);
plot(t*1000, imag(X3)); xlabel('Time (ms)'); ylabel('Amplitude');
title('X3 - Imaginary Part (Sine)'); grid on;
subplot(3,1,3);
plot(t*1000, abs(X3)); xlabel('Time (ms)'); ylabel('Magnitude');
title('X3 - Magnitude |A e^{j2πft}| = A (constant)'); grid on;
sgtitle('Original Signal X3 (Complex Exponential)');

%% ==================== PLOT NOISE SIGNALS ====================
% Noise n1
figure('Name','Noise n1');
subplot(2,1,1); plot(t*1000, n1); xlabel('Time (ms)'); ylabel('Amplitude');
title('Noise n1 - Time Domain'); grid on;
subplot(2,1,2); plot(freq/1000, abs(fft(n1))/N); xlabel('Frequency (kHz)');
ylabel('|N1(f)|'); title('Noise n1 - Frequency Domain'); xlim([0 Fs/2/1000]); grid on;
sgtitle('Noise Signal n1');

% Noise n2
figure('Name','Noise n2');
subplot(2,1,1); plot(t*1000, n2); xlabel('Time (ms)'); ylabel('Amplitude');
title('Noise n2 - Time Domain'); grid on;
subplot(2,1,2); plot(freq/1000, abs(fft(n2))/N); xlabel('Frequency (kHz)');
ylabel('|N2(f)|'); title('Noise n2 - Frequency Domain'); xlim([0 Fs/2/1000]); grid on;
sgtitle('Noise Signal n2');

% Noise n3
figure('Name','Noise n3');
subplot(2,1,1); plot(t*1000, n3); xlabel('Time (ms)'); ylabel('Amplitude');
title('Noise n3 - Time Domain'); grid on;
subplot(2,1,2); plot(freq/1000, abs(fft(n3))/N); xlabel('Frequency (kHz)');
ylabel('|N3(f)|'); title('Noise n3 - Frequency Domain'); xlim([0 Fs/2/1000]); grid on;
sgtitle('Noise Signal n3');

%% ==================== PLOT NOISY SIGNALS ====================
% Noisy X1
figure('Name','Noisy Signal x1');
subplot(2,1,1); plot(t*1000, x1_noisy); xlabel('Time (ms)'); ylabel('Amplitude');
title('Noisy X1 - Time Domain'); grid on;
subplot(2,1,2); plot(freq/1000, abs(fft(x1_noisy))/N); xlabel('Frequency (kHz)');
ylabel('|X1_{noisy}(f)|'); title('Noisy X1 - Frequency Domain (spike at 5 kHz)');
xlim([0 Fs/2/1000]); grid on; sgtitle('Noisy Signal x1');

% Noisy X2
figure('Name','Noisy Signal x2');
subplot(2,1,1); plot(t*1000, x2_noisy); xlabel('Time (ms)'); ylabel('Amplitude');
title('Noisy X2 - Time Domain'); grid on;
subplot(2,1,2); plot(freq/1000, abs(fft(x2_noisy))/N); xlabel('Frequency (kHz)');
ylabel('|X2_{noisy}(f)|'); title('Noisy X2 - Frequency Domain (spike at 5 kHz)');
xlim([0 Fs/2/1000]); grid on; sgtitle('Noisy Signal x2');

% Noisy X3 (Real, Imag, Magnitude spectrum)
figure('Name','Noisy Signal x3');
subplot(3,1,1); plot(t*1000, real(x3_noisy)); xlabel('Time (ms)'); ylabel('Amplitude');
title('Noisy X3 - Real Part'); grid on;
subplot(3,1,2); plot(t*1000, imag(x3_noisy)); xlabel('Time (ms)'); ylabel('Amplitude');
title('Noisy X3 - Imaginary Part'); grid on;
subplot(3,1,3); plot(freq/1000, abs(fft(x3_noisy))/N); xlabel('Frequency (kHz)');
ylabel('|X3_{noisy}(f)|'); title('Noisy X3 - Frequency Domain (Magnitude Spectrum)');
xlim([0 Fs/2/1000]); grid on; sgtitle('Noisy Signal x3 (Complex Exponential)');

%% ==================== FILTER DESIGN (Butterworth) ====================
% We assign different filter types to each signal:
%   X1 (sine)      -> Lowpass filter  (cutoff = 6.5 kHz)
%   X2 (cosine)    -> Highpass filter (cutoff = 3.5 kHz)
%   X3 (complex)   -> Bandpass filter (passband 4.5 - 5.5 kHz)

% Normalized frequencies (Nyquist = Fs/2 = 25000 Hz)
lp_cutoff = 6500 / (Fs/2);      % Lowpass cutoff at 6.5 kHz (passes 5 kHz)
hp_cutoff = 3500 / (Fs/2);      % Highpass cutoff at 3.5 kHz (passes 5 kHz)
bp_low  = 4500 / (Fs/2);        % Bandpass lower edge 4.5 kHz
bp_high = 5500 / (Fs/2);        % Bandpass upper edge 5.5 kHz

% 4th order Butterworth filters
[b_lp, a_lp] = butter(4, lp_cutoff, 'low');
[b_hp, a_hp] = butter(4, hp_cutoff, 'high');
[b_bp, a_bp] = butter(4, [bp_low, bp_high], 'bandpass');

% Plot frequency responses of the three filters
figure('Name','Filter Frequency Responses');
% Lowpass
subplot(3,1,1);
[H_lp, w] = freqz(b_lp, a_lp, 1024, Fs);
plot(w/1000, 20*log10(abs(H_lp)), 'LineWidth', 1.5);
xlabel('Frequency (kHz)'); ylabel('Magnitude (dB)');
title('Lowpass Filter (cutoff 6.5 kHz)'); grid on; ylim([-60 5]);
xline(6.5, '--r', '6.5 kHz');
% Highpass
subplot(3,1,2);
[H_hp, ~] = freqz(b_hp, a_hp, 1024, Fs);
plot(w/1000, 20*log10(abs(H_hp)), 'LineWidth', 1.5);
xlabel('Frequency (kHz)'); ylabel('Magnitude (dB)');
title('Highpass Filter (cutoff 3.5 kHz)'); grid on; ylim([-60 5]);
xline(3.5, '--r', '3.5 kHz');
% Bandpass
subplot(3,1,3);
[H_bp, ~] = freqz(b_bp, a_bp, 1024, Fs);
plot(w/1000, 20*log10(abs(H_bp)), 'LineWidth', 1.5);
xlabel('Frequency (kHz)'); ylabel('Magnitude (dB)');
title('Bandpass Filter (4.5 - 5.5 kHz)'); grid on; ylim([-60 5]);
xline(4.5, '--r', '4.5 kHz'); xline(5.5, '--r', '5.5 kHz');
sgtitle('Butterworth Filter Frequency Responses');

%% ==================== APPLY BUTTERWORTH FILTERS ====================
% X1 -> Lowpass, X2 -> Highpass, X3 -> Bandpass
y1_lp = filter(b_lp, a_lp, x1_noisy);   % Filtered sine
y2_hp = filter(b_hp, a_hp, x2_noisy);   % Filtered cosine
y3_bp = filter(b_bp, a_bp, x3_noisy);   % Filtered complex exponential

%% ==================== PLOT BUTTERWORTH FILTERED SIGNALS ====================
% Filtered y1 (Lowpass)
figure('Name','Filtered Output y1 (Lowpass)');
subplot(2,1,1); plot(t*1000, y1_lp); xlabel('Time (ms)'); ylabel('Amplitude');
title('Filtered y1 (Lowpass) - Time Domain (Sine recovered)'); grid on;
subplot(2,1,2); plot(freq/1000, abs(fft(y1_lp))/N); xlabel('Frequency (kHz)');
ylabel('|Y1(f)|'); title('Filtered y1 - Frequency Domain'); xlim([0 Fs/2/1000]); grid on;
sgtitle('Filtered Output y1 (Butterworth Lowpass)');

% Filtered y2 (Highpass)
figure('Name','Filtered Output y2 (Highpass)');
subplot(2,1,1); plot(t*1000, y2_hp); xlabel('Time (ms)'); ylabel('Amplitude');
title('Filtered y2 (Highpass) - Time Domain (Cosine recovered)'); grid on;
subplot(2,1,2); plot(freq/1000, abs(fft(y2_hp))/N); xlabel('Frequency (kHz)');
ylabel('|Y2(f)|'); title('Filtered y2 - Frequency Domain'); xlim([0 Fs/2/1000]); grid on;
sgtitle('Filtered Output y2 (Butterworth Highpass)');

% Filtered y3 (Bandpass) - Real, Imag, Magnitude
figure('Name','Filtered Output y3 (Bandpass)');
subplot(3,1,1); plot(t*1000, real(y3_bp)); xlabel('Time (ms)'); ylabel('Amplitude');
title('Filtered y3 - Real Part (Time Domain)'); grid on;
subplot(3,1,2); plot(t*1000, imag(y3_bp)); xlabel('Time (ms)'); ylabel('Amplitude');
title('Filtered y3 - Imaginary Part (Time Domain)'); grid on;
subplot(3,1,3); plot(freq/1000, abs(fft(y3_bp))/N); xlabel('Frequency (kHz)');
ylabel('|Y3(f)|'); title('Filtered y3 - Frequency Domain (Magnitude Spectrum)');
xlim([0 Fs/2/1000]); grid on;
sgtitle('Filtered Output y3 (Butterworth Bandpass)');

%% ==================== FOURIER (FFT) METHOD ====================
% Ideal bandpass filtering in frequency domain for all three signals.
% Mask passes frequencies from 4.5 kHz to 5.5 kHz (both positive and negative).
mask = zeros(1, N);
pos_idx = find(freq >= 4500 & freq <= 5500);
neg_idx = find(freq >= (Fs-5500) & freq <= (Fs-4500));
mask(pos_idx) = 1;
mask(neg_idx) = 1;

% Apply FFT mask
X1_fft = fft(x1_noisy);
X2_fft = fft(x2_noisy);
X3_fft = fft(x3_noisy);

X1_fft_filt = X1_fft .* mask;
X2_fft_filt = X2_fft .* mask;
X3_fft_filt = X3_fft .* mask;

% Inverse FFT (real for X1, X2; complex for X3)
y1_fft = real(ifft(X1_fft_filt));
y2_fft = real(ifft(X2_fft_filt));
y3_fft = ifft(X3_fft_filt);

%% ==================== PLOT FFT-METHOD FILTERED SIGNALS ====================
% FFT-filtered y1
figure('Name','FFT Method - y1');
subplot(2,1,1); plot(t*1000, y1_fft); xlabel('Time (ms)'); ylabel('Amplitude');
title('FFT Method y1 - Time Domain (Sine recovered)'); grid on;
subplot(2,1,2); plot(freq/1000, abs(fft(y1_fft))/N); xlabel('Frequency (kHz)');
ylabel('|Y1_{FFT}(f)|'); title('FFT Method y1 - Frequency Domain'); xlim([0 Fs/2/1000]); grid on;
sgtitle('FFT-Method Filtered Output y1');

% FFT-filtered y2
figure('Name','FFT Method - y2');
subplot(2,1,1); plot(t*1000, y2_fft); xlabel('Time (ms)'); ylabel('Amplitude');
title('FFT Method y2 - Time Domain (Cosine recovered)'); grid on;
subplot(2,1,2); plot(freq/1000, abs(fft(y2_fft))/N); xlabel('Frequency (kHz)');
ylabel('|Y2_{FFT}(f)|'); title('FFT Method y2 - Frequency Domain'); xlim([0 Fs/2/1000]); grid on;
sgtitle('FFT-Method Filtered Output y2');

% FFT-filtered y3 (Complex Exponential)
figure('Name','FFT Method - y3');
subplot(3,1,1); plot(t*1000, real(y3_fft)); xlabel('Time (ms)'); ylabel('Amplitude');
title('FFT Method y3 - Real Part'); grid on;
subplot(3,1,2); plot(t*1000, imag(y3_fft)); xlabel('Time (ms)'); ylabel('Amplitude');
title('FFT Method y3 - Imaginary Part'); grid on;
subplot(3,1,3); plot(freq/1000, abs(fft(y3_fft))/N); xlabel('Frequency (kHz)');
ylabel('|Y3_{FFT}(f)|'); title('FFT Method y3 - Frequency Domain'); xlim([0 Fs/2/1000]); grid on;
sgtitle('FFT-Method Filtered Output y3');

%% ==================== COMPARISON: Original vs Butterworth vs FFT ====================
% For each signal, overlay a short time segment and the frequency spectrum.

% --- Comparison for X1 (Sine) ---
figure('Name','Comparison - X1 (Sine)');
subplot(2,1,1);
plot(t*1000, X1, 'k', 'LineWidth', 1.2); hold on;
plot(t*1000, y1_lp, 'b', 'LineWidth', 1);
plot(t*1000, y1_fft, 'r--', 'LineWidth', 1);
xlabel('Time (ms)'); ylabel('Amplitude'); title('Time Domain Comparison (Sine)');
legend('Original','Butterworth (Lowpass)','FFT Method','Location','best');
xlim([0 2]); grid on; hold off;
subplot(2,1,2);
plot(freq/1000, abs(fft(X1))/N, 'k', 'LineWidth', 1.2); hold on;
plot(freq/1000, abs(fft(y1_lp))/N, 'b', 'LineWidth', 1);
plot(freq/1000, abs(fft(y1_fft))/N, 'r--', 'LineWidth', 1);
xlabel('Frequency (kHz)'); ylabel('Magnitude'); title('Frequency Domain Comparison');
legend('Original','Butterworth','FFT Method','Location','best');
xlim([0 10]); grid on; hold off;
sgtitle('Comparison for X1 (Sine)');

% --- Comparison for X2 (Cosine) ---
figure('Name','Comparison - X2 (Cosine)');
subplot(2,1,1);
plot(t*1000, X2, 'k', 'LineWidth', 1.2); hold on;
plot(t*1000, y2_hp, 'b', 'LineWidth', 1);
plot(t*1000, y2_fft, 'r--', 'LineWidth', 1);
xlabel('Time (ms)'); ylabel('Amplitude'); title('Time Domain Comparison (Cosine)');
legend('Original','Butterworth (Highpass)','FFT Method','Location','best');
xlim([0 2]); grid on; hold off;
subplot(2,1,2);
plot(freq/1000, abs(fft(X2))/N, 'k', 'LineWidth', 1.2); hold on;
plot(freq/1000, abs(fft(y2_hp))/N, 'b', 'LineWidth', 1);
plot(freq/1000, abs(fft(y2_fft))/N, 'r--', 'LineWidth', 1);
xlabel('Frequency (kHz)'); ylabel('Magnitude'); title('Frequency Domain Comparison');
legend('Original','Butterworth','FFT Method','Location','best');
xlim([0 10]); grid on; hold off;
sgtitle('Comparison for X2 (Cosine)');

% --- Comparison for X3 (Complex Exponential) - Real part and Magnitude ---
figure('Name','Comparison - X3 (Complex Exp)');
subplot(2,2,1);
plot(t*1000, real(X3), 'k', 'LineWidth', 1.2); hold on;
plot(t*1000, real(y3_bp), 'b', 'LineWidth', 1);
plot(t*1000, real(y3_fft), 'r--', 'LineWidth', 1);
xlabel('Time (ms)'); ylabel('Amplitude'); title('Real Part Comparison');
legend('Original','Butterworth (Bandpass)','FFT Method','Location','best');
xlim([0 2]); grid on; hold off;
subplot(2,2,2);
plot(t*1000, imag(X3), 'k', 'LineWidth', 1.2); hold on;
plot(t*1000, imag(y3_bp), 'b', 'LineWidth', 1);
plot(t*1000, imag(y3_fft), 'r--', 'LineWidth', 1);
xlabel('Time (ms)'); ylabel('Amplitude'); title('Imaginary Part Comparison');
legend('Original','Butterworth','FFT Method','Location','best');
xlim([0 2]); grid on; hold off;
subplot(2,2,3);
plot(freq/1000, abs(fft(X3))/N, 'k', 'LineWidth', 1.2); hold on;
plot(freq/1000, abs(fft(y3_bp))/N, 'b', 'LineWidth', 1);
plot(freq/1000, abs(fft(y3_fft))/N, 'r--', 'LineWidth', 1);
xlabel('Frequency (kHz)'); ylabel('Magnitude'); title('Frequency Spectrum Comparison');
legend('Original','Butterworth','FFT Method','Location','best');
xlim([0 10]); grid on; hold off;
subplot(2,2,4);
plot(t*1000, abs(X3), 'k', 'LineWidth', 1.2); hold on;
plot(t*1000, abs(y3_bp), 'b', 'LineWidth', 1);
plot(t*1000, abs(y3_fft), 'r--', 'LineWidth', 1);
xlabel('Time (ms)'); ylabel('Magnitude'); title('Magnitude Comparison (should be constant A=2)');
legend('Original','Butterworth','FFT Method','Location','best');
ylim([0 3]); grid on; hold off;
sgtitle('Comparison for X3 (Complex Exponential)');

%% ==================== COMMENTS ====================
disp('All figures generated successfully.');
disp('Observations:');
disp('- The Butterworth filters (Lowpass, Highpass, Bandpass) recover the 5 kHz signal with slight phase distortion/transient.');
disp('- The FFT method (ideal bandpass mask) removes noise perfectly without transient effects, suitable for offline processing.');
disp('- For the complex exponential, the magnitude is restored to A=2 after filtering.');
