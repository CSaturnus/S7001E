input_output = importdata("input_output.mat");

x = input_output.x;
y = input_output.y;

lag = 50;

Rxx = xcorr(x, lag);
Ryy = xcorr(y, lag);
Rxy = xcorr(x, y, lag);

fftRxx = fft(Rxx);
fftRyy = fft(Ryy);
fftRxy = fft(Rxy);

x_plot = 1:length(fftRxx);

figure(1)
plot(x_plot,fftRxx)
figure(2)
plot(x_plot,fftRyy)
figure(3)
plot(x_plot,fftRxy)
