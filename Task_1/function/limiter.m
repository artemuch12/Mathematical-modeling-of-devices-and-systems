% ������� ����������� ���������.
% ������� ������������ ��������� �������������� ������� �� �����������
% ���������� �������������. 
% ������� ������:
%   input_data - �������� ������ �������� �������������� �������
%   border - ����������� ����������� ���������, �������� � ��������� �� 0
%   �� 100
% �������� ������:
%   out_data - ������������ �� �������� ������� �������������� �������
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
