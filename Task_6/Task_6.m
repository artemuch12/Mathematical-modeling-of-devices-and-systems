% Задание 6. Основы цифровой обработки изображений.
close all
clc
clear
key_figure = 'no';
% Считывание изображений
image_1 = imread('1.png');
if(strcmp(key_figure, 'yes') == true)
    figure;
    imshow(image_1)
    title('Исходное изображение')
end
% Дополнительное изображение для пункта 11
image_2 = imread('2.png');
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
    title('Черно-белое изображение')
    subplot(2,2,2)
    imshow(red)
    title('"Красная" компонента')
    subplot(2,2,3)
    imshow(gren)
    title('"Зеленая" компонента')
    subplot(2,2,4)
    imshow(blue)
    title('"Синия" компонента')
end

% Пороговая обработка изображений
border_image_down = border_pixel (double_image_1, 0.2, 'down');
border_image_up = border_pixel (double_image_1, 0.8, 'up');
if(strcmp(key_figure, 'yes') == true)
figure;
    imshow(border_image_down)
    title('Изображение после пороговой обработки с настройкой down')
    figure;
    imshow(border_image_up)
    title('Изображение после пороговой обработки с настройкой up')
end
% Кадрирование
frame_height = 150;
frame_width = 200;
image_frame = image_1(1:frame_height,1:frame_width,:);
if(strcmp(key_figure, 'yes') == true)
    figure;
    imshow(image_frame)
    title('Изображение после кадрирования')
end

% Изменение размеров изображений
image_size1 = change_size (double_image_1, 0.5);
image_size2 = change_size (double_image_1, 0.667);
image_size3 = change_size (double_image_1, 2);
if(strcmp(key_figure, 'yes') == true)
    figure;
    imshow(image_size1)
    title('Изображение уменьшеное в 2 раза')
    figure;
    imshow(image_size2)
    title('Изображение уменьшеное в 1.5 раза')
%     figure;
%     imshow(image_size3)
%     title('Изображение увеличенное в 2 раза')
end

% Медианная фильтрация
% image_median = median_filter(double_image_1, 3, 3);
if(strcmp(key_figure, 'yes') == true)
    figure;
    imshow(image_median)
    title('Изображение после медианной фильтрации')
end

% Постеризация изображения
image_posterization = postarization(image_1, 2);
if(strcmp(key_figure, 'yes') == true)
    figure;
    imshow(image_posterization)
    title('Постеризированное изображение')
end

% Гистограмма
if(strcmp(key_figure, 'yes') == true)
    figure;
    subplot(2, 2, 1)
    imhist(red)
    title('"Красная" компонента')
    subplot(2, 2, 2)
    imhist(blue)
    title('"Синия" компонента')
    subplot(2, 2, 3)
    imhist(gren)
    title('"Зеленая" компонента')
    subplot(2, 2, 4)
    imhist(image_1)
    title('Яркость изображения')
end

% Гамма-коррекция
image_gamma = gamma_correction(double_image_1, 1, 2);
if(strcmp(key_figure, 'yes') == true)
    figure; 
    imshow(image_gamma)
    title('Исходное изображение после гамма-коррекции')
end

% Градиент
 gradients = image_gradient(gray);
 if(strcmp(key_figure, 'yes') == true)
    figure; 
    imshow(gradients)
    title('Градиент изображения')
 end
 
