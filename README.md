# Noise Removal with Butterworth and FFT Filtering (MATLAB)

Individual project for the Signal Processing module at The British University in Egypt.

## Overview
Sine, cosine and complex-exponential signals at 5 kHz (sampling frequency 50 kHz) are
corrupted with Gaussian noise, then recovered using:
- 4th-order Butterworth low-pass, high-pass and band-pass filters (cutoffs chosen from FFT spectra)
- Ideal FFT masking, for comparison

The project also analyses the transient response of the filters and the trade-off between
offline accuracy and real-time suitability.

## Files
- `[file_name].m`: main script
- `figures/`: output plots

## How to run
Open the main script in MATLAB and run it. Requires the Signal Processing Toolbox.

## Results
[One or two sentences on what you found, e.g. which method removed noise better.]
