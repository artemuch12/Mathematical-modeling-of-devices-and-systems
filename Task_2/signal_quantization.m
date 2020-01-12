% Функция квантования сигнала.
% Входящий синал функция квантует по уровню с равномерным шагом.
% Входные характеристики:
%     input_data - отчеты сигнала;
%     bit - разрядность квантователя;
% Выходные данные
%     out_data -  квантованные отчеты;
function [out_data] = signal_quantization (input_data, bit)
% Выделение памяти на хранение выходных данных (необходимо, чтобы  интопре-
% татор не ругался лишний раз)
if(bit <= 0)
    error("Разрядность не может быть меньше 0");
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