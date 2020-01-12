% ������� ������������ �����������
% ������� ���������� ������������ �������� ����������� �������� ����������� 
% ������.
% ������� ������:
%   image - ����������� � ������� uint8
%   bit - ������
% �������� ������:
%   out_image - ����������� � ������� double
function [out_image] = postarization(image, bit)
if bit <= 0
    error('������! ���������� ������� ������ ���� ������ 0');
end
image = uint32(image);
bite_rate = 2^bit;
time_image(:,:,1) = ceil(image(:,:,1)*((bite_rate-1)/255));
time_image(:,:,2) = ceil(image(:,:,2)*((bite_rate-1)/255));
time_image(:,:,3) = ceil(image(:,:,3)*((bite_rate-1)/255));

out_image = (double(time_image)/double(bite_rate-1));