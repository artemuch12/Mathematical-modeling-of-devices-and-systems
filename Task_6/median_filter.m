% ������� ��������� �������� �����������.
% �������� ����������� �������� ����� ��������� ������, ������� ��������
% �������� � ����� �� ��������� �������������� �������� �� ��������
% �������� � ����. ������� ���� ���������, �� ������ ���� �� ��������������
% ������� � ���������. �������� ����������� ������ ���� ��������� � 
% ������� ��������������:
%     image - ����������� ����������� � ���� double, �������;
%     size_x - ������ ����������� ���� �� x, �������� �����;
%     size_y - ������ ����������� ���� �� y, �������� �����;
% �������� ������
%     out_image - ��������������� �����������;
function [out_image] = median_filter (image, scale_y, scale_x)
out_image = image;
[height, width, ~] = size(image);
step_y = (scale_y - 1)/2;
step_x = (scale_x - 1)/2;
for y = 1+step_y:height-step_y
    for x = 1+step_x:width-step_x
        fragm_1 = image(y-step_y:y+step_y, x-step_x:x+step_x, 1);
        fragm_2 = image(y-step_y:y+step_y, x-step_x:x+step_x, 2);
        fragm_3 = image(y-step_y:y+step_y, x-step_x:x+step_x, 3);
        out_image(y, x, 1) = sum(sum(fragm_1))/(scale_y*scale_x);
        out_image(y, x, 2) = sum(sum(fragm_2))/(scale_y*scale_x);
        out_image(y, x, 3) = sum(sum(fragm_3))/(scale_y*scale_x);
    end
end 