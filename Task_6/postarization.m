% Image Posterization Function
% The function posterizes the input image according to the set level.
% Input data:
%   image - uint8 image
%   bit - levels
% Output:
%   out_image - double image
function [out_image] = postarization(image, bit)
if bit <= 0
    error('Error! The number of levels must be greater than 0');
end
image = uint32(image);
bite_rate = 2^bit;
time_image(:,:,1) = ceil(image(:,:,1)*((bite_rate-1)/255));
time_image(:,:,2) = ceil(image(:,:,2)*((bite_rate-1)/255));
time_image(:,:,3) = ceil(image(:,:,3)*((bite_rate-1)/255));

out_image = (double(time_image)/double(bite_rate-1));