% Функция изменения размеров изображения.
% Размеры входного изображения изменяются согласно масштабному
% коэффициенту. 
% Входные характеристики:
%     image - изображение приведенное к типу double;
%     scale - масштабирующий коэффицент;
% Выходные данные
%     out_image - масштабированное изображение;
function [out_image] = change_size (image, scale)
[height, width, plane] = size(image);
new_height = floor(height*scale);
new_width = floor(width*scale);
out_image = zeros(new_height, new_width, plane);
for z = 1:plane
    for y = 1:height
        for x = 1:width
            y_new = y*scale;
            x_new = x*scale;
            if (y_new > new_height)
                y_new = new_height;
            end
            if (y_new < 1)
                y_new = 1;
            end
            if (x_new > new_width)
                x_new = new_width;
            end
            if (x_new < 1)
                x_new = 1;
            end
            y_minus = floor(y_new);
            y_plus = y_minus + 1;
            x_minus = floor(x_new);
            x_plus = x_minus + 1;
            if ((y_plus - y_new) >= (y_new - y_minus))
                y_new = y_minus;
            else
                y_new = y_plus;
            end
            if ((x_plus - x_new) >= (x_new - x_minus))
                x_new = x_minus;
            else
                x_new = x_plus;
            end
            out_image(y_new,x_new,z) = image(y,x,z);
        end
    end
end

% Для случая увеличения изображения (и не только для случая увеличения в 
% приниципе)неоходимо использовать интерполяцию, для заполнения новых пик-
% селей. Поскольку по заднию требуется только уменьшить, то эта часть кода 
% дополнительная и действует для случая с переменной scope больше 1
[Xq,Yq] = meshgrid(1:new_width, 1:new_height);
if (scale > 1)
    time_matrix_1 = interp2(out_image(:,:,1), Xq, Yq, 'linear');
    time_matrix_2 = interp2(out_image(:,:,2), Xq, Yq, 'linear');
    time_matrix_3 = interp2(out_image(:,:,3), Xq, Yq, 'linear');
    out_image(:,:,1) = time_matrix_1;
    out_image(:,:,2) = time_matrix_2;
    out_image(:,:,3) = time_matrix_3;
end