% Task 6. Basics of digital image processing.
close all
clc
clear
key_figure = 'no';
% Image reading
image_1 = imread('1.png');
if(strcmp(key_figure, 'yes') == true)
    figure;
    imshow(image_1)
    title('Original image')
end
double_image_1 = im2double(image_1);
double_image_2 = im2double(image_2);
red = double_image_1(:, :, 1);
gren = double_image_1(:, :, 2);
blue = double_image_1(:, :, 3);
gray = rgb2gray(double_image_1);
if(strcmp(key_figure, 'yes') == true)
    figure;
    subplot(2,2,1)
    imshow(gray)
    title('Black and white image')
    subplot(2,2,2)
    imshow(red)
    title('"Red" channel')
    subplot(2,2,3)
    imshow(gren)
    title('"Gren" channel')
    subplot(2,2,4)
    imshow(blue)
    title('"Blue" channel')
end

% Threshold image processing
border_image_down = border_pixel (double_image_1, 0.2, 'down');
border_image_up = border_pixel (double_image_1, 0.8, 'up');
if(strcmp(key_figure, 'yes') == true)
figure;
    imshow(border_image_down)
    title('Image after threshold processing with the setting "down"')
    figure;
    imshow(border_image_up)
    title('Image after threshold processing with the setting "up"')
end
% Framing
frame_height = 150;
frame_width = 200;
image_frame = image_1(1:frame_height,1:frame_width,:);
if(strcmp(key_figure, 'yes') == true)
    figure;
    imshow(image_frame)
    title('Image after cropping')
end

% Resize the images
image_size1 = change_size (double_image_1, 0.5);
image_size2 = change_size (double_image_1, 0.667);
% image_size3 = change_size (double_image_1, 2);
if(strcmp(key_figure, 'yes') == true)
    figure;
    imshow(image_size1)
    title('Image reduced 2 times')
    figure;
    imshow(image_size2)
    title('Image reduced 1.5 times')
%     figure;
%     imshow(image_size3)
%     title('Image magnified 2 times')
end

% Median filtering
% image_median = median_filter(double_image_1, 3, 3);
if(strcmp(key_figure, 'yes') == true)
    figure;
    imshow(image_median)
    title('Image after median filtering')
end

% Image posterization
image_posterization = postarization(image_1, 2);
if(strcmp(key_figure, 'yes') == true)
    figure;
    imshow(image_posterization)
    title('Posteurized image')
end

% Histogram
if(strcmp(key_figure, 'yes') == true)
    figure;
    subplot(2, 2, 1)
    imhist(red)
    title('"Red" channel')
    subplot(2, 2, 2)
    imhist(gren)
    title('"Gren" channel')
    subplot(2, 2, 3)
    imhist(blue)
    title('"Blue" channel')
    subplot(2, 2, 4)
    imhist(image_1)
    title('Image brightness')
end

% Gamma correction
image_gamma = gamma_correction(double_image_1, 1, 2);
if(strcmp(key_figure, 'yes') == true)
    figure; 
    imshow(image_gamma)
    title('The original image after gamma correction')
end

% Gradient
 gradients = image_gradient(gray);
 if(strcmp(key_figure, 'yes') == true)
    figure; 
    imshow(gradients)
    title('Image gradient')
 end
 
