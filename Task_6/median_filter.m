% ‘ункци€ изменени€ размеров изображени€.
% »сходное изображение проходит через медианный фильтр, который замен€ет
% значение в точке на двумерное математическое ожидание от пикселей
% вход€щих в окно. –азмеры окно измен€емы, но должны быть не отрицательными
% числами и нечетными. »сходное изображение должно быть приведено в 
% ¬ходные характеристики:
%     image - изображение приведенное к типу double, цветное;
%     size_x - размер скольз€щего окна по x, нечетные числа;
%     size_y - размер скольз€щего окна по y, нечетные числа;
% ¬ыходные данные
%     out_image - отфильтрованное изображение;
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