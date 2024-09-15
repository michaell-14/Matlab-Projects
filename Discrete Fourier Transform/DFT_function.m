function [] = DFT_function(threshold)
close all
% Define the frequencies and time vector
threshold = 250 %45, 150, 250
f1 = 1;
f2 = 10;
f3 = 20;
t = [0:255] / 256;

% Clean signal
x0 = 3*sin(2*pi*f1*t) + cos(2*pi*f2*t) + 2*sin(2*pi*f3*t);

% Gaussian noise signal
noise = randn(1, 256);

% Add the noise to clean signal
xx = x0 + noise;

%plotting
% ... (previous code)

% Plotting
figure;
fig1 = tiledlayout(3,1);

nexttile;
plot(x0)
title('Original Signal');

nexttile;
plot(xx)
title('Noisy Signal');

fft_signal = fft(xx);
magfft = abs(fft_signal);


figure;
fig2 = tiledlayout(2, 1);

nexttile;
plot(t,magfft)
title('Magnitude of Noisy Signal');

nexttile;
magfft(magfft < threshold) = 0;
plot(t,magfft)
title('Magnitude after Thresholding');

fft_signal(abs(fft_signal) < threshold) = 0;
x0new = ifft(fft_signal);
mse = mean((x0 - x0new).^2)
disp(mse)

nexttile(fig1);
plot(t, x0new)
title('Recovered Signal');

end