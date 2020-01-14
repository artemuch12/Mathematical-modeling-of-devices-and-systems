% Function gamma correction.
% The input image must be cast to double format. Function produces gamma 
% correction of the image.
% Input parameters:
%   image - source image converted to double format
%   coeff - non-negative integer not equal to zero
%   gamma - natural non-negative number
% Output:
%   out_image - adjusted image
function [out_image] = gamma_correction(image, coeff, gamma)
if (coeff <= 0)
    error('Error! Luminance factor must be greater than zero');
end
if (gamma < 0)
    error('Error! Gamma coefficient must be greater than zero');
end
out_image(:,:,1) = coeff.*(image(:,:,1).^gamma);
out_image(:,:,2) = coeff.*(image(:,:,2).^gamma);
out_image(:,:,3) = coeff.*(image(:,:,3).^gamma);