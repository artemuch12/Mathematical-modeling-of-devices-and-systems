% Image resizing function.
% The original image passes through a median filter that replaces
% value at a point on the two-dimensional expectation from pixels
% included in the window. Window dimensions are resizable, but should not 
% be negative by numbers and odd. The original image should be given in
% Input Specifications:
%   image - image converted to type double, color;
%   size_x - size of the sliding window by x, odd numbers;
%   size_y - size of the sliding window by y, odd numbers;
% Output
%   out_image - filtered image;
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