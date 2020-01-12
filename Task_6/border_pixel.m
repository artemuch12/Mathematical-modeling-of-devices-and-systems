% Функция пороговой обработки изображения.
% Пиксели входящие изображение сравнивается (в зависимости от настройки) с
% порогом в случае если порог не пройден (пройден - зависит от найстройки),
% то данный пиксель минизируется (максимизируется).
% Входные характеристики:
%     image - изображение приведенное к типу double;
%     border - порог;
%     setting - настройки отвечающие за то, как поведет функция с порогом.
%       Если выставлены настройки "down", то пиксель, чье значение ниже
%       порога зануляется, если настройка "up", то пиксель чьё значение
%       больше порога ставится в положение 1.
% Выходные данные
%     out_image - изображение прошедшешее через пороговый алгоритм;
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
    error('Не верные настройки! Разрешены либо up, либо dawn');
end