% Функция получения градиента от изображения
% С помощью оператора Собеля можно приблизительно точно (достаточно точно 
% для практического применения). 
function [gradients] = image_gradient(image)
[height, width, ~] = size(image);
gradient_x = zeros(height, width);
gradient_y = zeros(height, width);
% Входное изображение должно быть проиведено к черно-белому формату
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


% Внутренная функция для создания временной матрицы размерами на 1 единице
% с каждой стороны больше, чем исходное изображение. Данная функция
% необходима, для "устранения" краевого эффекта.
function [time_image] = create_time_image(double_image)
[height, width, ~] = size(double_image);
time_image = zeros(height+2, width+2);
% Заполнение цетральной части исходным изображением
time_image(2:height+1, 2:width+1) = double_image(:,:);
% Заполение краев
time_image(2:height+1, 1) = double_image(:, 1);
time_image(2:height+1, width+2) = double_image(:, width);
time_image(1, 2:width+1) = double_image(1, :);
time_image(height, 2:width+1) = double_image(height, :);

% Заполнение 4 окраиных точек
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