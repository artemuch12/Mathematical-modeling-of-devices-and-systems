% Function of quantization of a signal.
% The incoming sinal function quantizes in level with a uniform step.
% Input Specifications:
%   input_data - signal reports;
%   bit - quantizer bit depth;
% Output
%   out_data - quantized reports;
function [out_data] = signal_quantization (input_data, bit)
if(bit <= 0)
    error("Bit depth cannot be less than 0");
end
out_data = input_data;
[~, size_in_data] = size(input_data);
voltage_min = min(input_data);
voltage_max = max(input_data);
scope_voltage = voltage_max - voltage_min;
bit_rate = 2^bit;
step_voltage = scope_voltage / bit_rate;
for item_number = 1:size_in_data
    step = voltage_min;
    flag = 0;
    while flag ~= 1
        if step < input_data(item_number)
            step = step + step_voltage;
        elseif step > input_data(item_number)
            flag = 1;
            difference_plus = abs(step - input_data(item_number)); 
            difference_minus = abs(step - input_data(item_number) - ...
                step_voltage);
            if(difference_plus <= difference_minus)
                out_data(item_number) = step;
            else
                out_data(item_number) = step - step_voltage;
            end
        elseif step == input_data(item_number)
            flag = 1;
            out_data(item_number) = input_data(item_number);
        end
    end
end