% Threshold image processing function.
% Pixels incoming image is compared (depending on the setting) with
% threshold if the threshold is not passed (passed - depends on the 
% adjustment), then this pixel is mined (maximized).
% Input Specifications:
%   image - image cast to double type;
%   border - threshold;
%   setting - settings responsible for how the function will lead with a 
%   threshold. If the settings are set to "down", then the pixel whose 
%   value is lower of the threshold is nullified, if the setting is up, 
%   then the pixel whose value greater than the threshold is put in 
%   position 1.
% Output
%   out_image - image passed through the threshold algorithm;
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
    error('Incorrect settings! Allowed either up or dawn');
end