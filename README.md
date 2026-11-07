# Noise Removal with Butterworth and FFT Filtering (MATLAB)

Individual project for the Signal Processing module 

## Overview
Three signals at 5 kHz (a sine, a cosine and a complex exponential) are generated with a
sampling frequency of 50 kHz, corrupted with random Gaussian noise, and then recovered
using two methods:

1. **Butterworth filters** (4th order), designed with MATLAB's `butter` function:
   - Low-pass for the sine signal
   - High-pass for the cosine signal
   - Band-pass for the complex exponential
   
   Cutoff frequencies were chosen by inspecting the FFT of the noisy signals, where the
   signal energy is concentrated at 5 kHz.

2. **FFT masking**: compute the FFT of the noisy signal, keep only the 5 kHz component,
   and reconstruct the signal with the inverse FFT.

## Results
- Both methods recover the 5 kHz component from the noisy signals.
- The Butterworth filters introduce a short transient (settling) at the start of the
  signal and leave small residual noise, but they can run in real time and in hardware.
- The FFT method gives an ideal "brick-wall" response with no transient and no phase
  distortion, but it needs the whole signal in advance, so it is limited to offline use.

## Files
- MATLAB script(s) for signal generation, noise addition, filtering and comparison
- Screenshots of the output plots (time-domain and frequency-domain)

## How to run
Open the MATLAB script and run it. Requires the Signal Processing Toolbox
(for `butter` and `filter`).

## Author
Salma Yusuf, Computer Engineering student, BUE
