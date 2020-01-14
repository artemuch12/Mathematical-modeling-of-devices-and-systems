% Task 1. Basics of the formation and analysis of signals
close all
clc
clear
key_figure = 'yes';
addpath('.\function');
% Harmonic Signal Generation
frequency = 10;
phase = 0;
amplitude = 5;
freq_descret = 20*frequency;

time = 0:0.001:1;
reference = 0:(1/freq_descret):1;
signal = amplitude.*sin(2*pi*frequency*time+phase);
signal_descr = amplitude.*sin(2*pi*frequency*reference+phase);
if strcmp(key_figure, 'yes') == true
    figure;
    plot(time, signal, 'blue')
    hold on
    stem(reference, signal_descr, 'red')
    hold off
    title('Harmonic signal');
end

% Hamming Window
leng = length(reference);
window_hamm = hamming(leng);
convolution = conv(signal_descr, window_hamm);
spectrum_freq = 0:1:frequency*2;
spectrum = abs(fft(convolution));
if strcmp(key_figure, 'yes') == true
    figure;
    plot(reference, window_hamm)
    title('Hamming Window');
    figure;
    plot(spectrum)
    title('Signal spectrum');
end


% Limiter
max_ampl = max(signal_descr);
signal_75 = limiter(signal_descr, 75);
signal_50 = limiter(signal_descr, 50);
signal_25 = limiter(signal_descr, 25);
spectrum_50 = fft(signal_50);
if strcmp(key_figure, 'yes') == true
    figure;
    subplot(2,2,1)
    plot(reference, signal_descr)
    title('Source signal');
    ylim([-max_ampl max_ampl])
    subplot(2,2,2)
    plot(reference, signal_75)
    title('Signal with 75% limit');
    ylim([-max_ampl max_ampl])
    subplot(2,2,3)
    plot(reference, signal_50)
    title('Signal with 75% limit');
    ylim([-max_ampl max_ampl])
    subplot(2,2,4)
    plot(reference, signal_25)
    title('Signal with 25% limit');
    ylim([-max_ampl max_ampl])
    figure;
    plot(abs(spectrum_50))
    title('Amplitude spectrum, 50% limiter');
end

% Cutoff angle

rmpath('.\function');
