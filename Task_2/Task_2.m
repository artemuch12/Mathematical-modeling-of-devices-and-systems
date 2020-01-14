% Task 2. Quantization of the signal.
close all
clc
clear
addpath('.\function')
% We form a polyharmonic signal
signal_duration = 0:0.01:1;
[~, size_simple] = size(signal_duration);
amp = [5 6 9];
phase = [0 pi/4 -pi/2];
frequence = [10 5 7];
signal_1 = amp(1).*sin(2.*pi.*frequence(1)*signal_duration + phase(1));
signal_2 = amp(2).*sin(2.*pi.*frequence(2)*signal_duration + phase(2));
signal_3 = amp(3).*sin(2.*pi.*frequence(3)*signal_duration + phase(3));
poli_signal = signal_1 + signal_2 + signal_3;

% Output polyharmonic signal and quantized signal
figure;
stem(signal_duration, poli_signal ,'x')
grid on;
poli_signal_quant = signal_quantization(poli_signal, 3);
hold on;
stem(signal_duration, poli_signal_quant ,'+', 'r')
hold off;
title('Discrete and polyharmonic')

% Quantization Noise
noise_quantization = poli_signal - poli_signal_quant;
figure;
grid on;
plot(signal_duration, noise_quantization)
title('Temporal implementation of quantization error')
% Grade SPM (Spectral density)
SPM = fft(noise_quantization);
math_expect_spm = sum(SPM)/size_simple;
SPM = (SPM - math_expect_spm).^2;
freq = 0:size_simple - 1;
figure;
grid on;
plot(freq, abs(SPM))
title('Grade spectral density')


% Power
power_discrit_signal = sum(poli_signal.^2)/size_simple;
power_digit_signal = sum(poli_signal_quant.^2)/size_simple;
power_noise = sum(noise_quantization.^2)/size_simple;
SNR_discrit = 10*log10(power_discrit_signal/power_noise);
SNR_digit = 10*log10(power_digit_signal/power_noise);

fprintf('Discrete signal power: %f\n', power_discrit_signal);
fprintf('Digital signal power: %f\n', power_digit_signal);
fprintf('Quantization noise power: %f\n\n', power_noise);
fprintf('Ratio (discrete signal) / (quantization noise): %f\n', SNR_discrit);
fprintf('Ratio (Digital signal) / (quantization noise): %f\n\n', SNR_digit);

% Dependence of SNR on ADC capacity
for step_adc = 2:16
    poli_signal_quant_adc = signal_quantization(poli_signal, step_adc);
    noise_quantization_adc = poli_signal - poli_signal_quant_adc;
    power_digit_signal_adc = sum(poli_signal_quant.^2)/size_simple;
    power_noise_adc = sum(noise_quantization_adc.^2)/size_simple;
    SNR(step_adc) = 10*log10(power_digit_signal_adc/power_noise_adc);
end
figure;
grid on;
step_adc = 1:16;
plot(step_adc, SNR)
title('Dependence of SNR on ADC capacity')

rmpath('.\function')