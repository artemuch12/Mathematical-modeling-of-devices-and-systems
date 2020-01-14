% Функция ограничения амплитуды.
% Фукнция ограничивает амплитуду гармонического сигнала на коэффициент
% задаваемый пользователем. 
% Входные данные:
%   input_data - входящий массив отсчетов гармонического сигнала
%   border - коэффициент огарничения амплитуды, задается в процентах от 0
%   до 100
% Выходные данные:
%   out_data - ограниченные по амлитуде отсчеты гармонического сигнала
function [out_data] = limiter(input_data, border)
out_data = input_data;
border = border/100;
max_value = max(abs(input_data));
for step = 1:length(input_data)
    if abs(input_data(step)) >= border*max_value
        if input_data(step) > 0
            out_data(step) = border*max_value;
        else
            out_data(step) = -border*max_value;
        end
    end
end
