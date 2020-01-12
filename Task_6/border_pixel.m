% ������� ��������� ��������� �����������.
% ������� �������� ����������� ������������ (� ����������� �� ���������) �
% ������� � ������ ���� ����� �� ������� (������� - ������� �� ����������),
% �� ������ ������� ������������ (���������������).
% ������� ��������������:
%     image - ����������� ����������� � ���� double;
%     border - �����;
%     setting - ��������� ���������� �� ��, ��� ������� ������� � �������.
%       ���� ���������� ��������� "down", �� �������, ��� �������� ����
%       ������ ����������, ���� ��������� "up", �� ������� ��� ��������
%       ������ ������ �������� � ��������� 1.
% �������� ������
%     out_image - ����������� ����������� ����� ��������� ��������;
function [out_image] = border_pixel (image, border, setting)
size_image = size(image);
out_image = image;
if strcmp(setting, 'up') == true
    for count = 1:size_image(1, 3)
        for y = 1:size_image(1, 1)
            for x = 1:size_image(1, 2)
                if out_image(y, x, count) > border
                    out_image(y, x, count) = 1;
                end
            end
        end
    end     
elseif strcmp(setting, 'down') == true
    for count = 1:size_image(1, 3)
        for y = 1:size_image(1, 1)
            for x = 1:size_image(1, 2)
                if out_image(y, x, count) < border
                    out_image(y, x, count) = 0;
                end
            end
        end
    end  
else
    error('�� ������ ���������! ��������� ���� up, ���� dawn');
end