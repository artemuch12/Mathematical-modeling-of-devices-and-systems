% Gradient function from image
% Using the Sobel operator it is possible approximately exactly (fairly 
% accurately for practical use).
function [gradients] = image_gradient(image)
[height, width, ~] = size(image);
gradient_x = zeros(height, width);
gradient_y = zeros(height, width);
% The input image should be converted to black and white
double_image = im2double(image);
time_image = create_time_image(double_image);
fragm = zeros(3);
for y = 2:height+1
    for x = 2:width+1
        fragm = time_image(y-1:y+1, x-1:x+1);
        gradient_x(y-1, x-1) = (-1)*(fragm(1,1)+2.*fragm(2,1)+...
            fragm(3,1))+(fragm(1, 3)+2.*fragm(2,3)+fragm(3,3));
        gradient_y(y-1, x-1) = (-1)*(fragm(3,1)+2.*fragm(3,2)+...
            fragm(3,3))+(fragm(3,1)+2.*fragm(3,2)+fragm(3,3));
    end
end
gradients = sqrt(gradient_y.^2 + gradient_x.^2);      


% Internal function to create a time matrix with dimensions of 1 unit
% on each side is larger than the original image. This function
% is needed to "eliminate" the edge effect.
function [time_image] = create_time_image(double_image)
[height, width, ~] = size(double_image);
time_image = zeros(height+2, width+2);
% Filling the central part with the original image
time_image(2:height+1, 2:width+1) = double_image(:,:);
% Fill Edges
time_image(2:height+1, 1) = double_image(:, 1);
time_image(2:height+1, width+2) = double_image(:, width);
time_image(1, 2:width+1) = double_image(1, :);
time_image(height, 2:width+1) = double_image(height, :);

% Filling 4 border points
time_image(1,1) = time_image(1,2) + time_image(2,1);
if time_image(1,1) > 1
    time_image(1,1) = 1;
end
time_image(height+2,1) = time_image(height+2,2) + time_image(height+1,1);
if time_image(height+2,1) > 1
    time_image(height+2,1) = 1;
end
time_image(height+2,width+2) = time_image(height+2,width+1) + time_image...
    (height+1,width+2);
if time_image(height+2,width+2) > 1
    time_image(height+2,width+2) = 1;
end
time_image(1,width+2) = time_image(1,width+1) + time_image(2,width+2);
if time_image(1,width+2) > 1
    time_image(1,width+2) = 1;
end