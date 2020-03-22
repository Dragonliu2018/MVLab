%% 读取图片
source = im2double( imread('test.jpg') );
guide_img = source;

%% 求解高斯引导滤波
[m ,n, div] = size(source);
r = 5; %窗口半径
dr = 0.5; %空域带宽
for k = 1 : div
    for i = 1 : m
        for j = 1 : n
            if i <= r || i >= m - r || j <= r || j >= n - r %图片边界处理(原像素)
                continue;
            else
                guide_img(i,j,k) = GS(source, r, dr, i, j, k); %空间域滤波
            end
        end
    end
end

%% 求解WGGF
target = guide_img;
r = 5; %窗口半径
dzeta = 0.1; %频域带宽
lambda = 0.12; % λ为一选定的阈值 
for k = 1 : div
    for i = 1 : m
        for j = 1 : n
            if i <= r || i >= m - r || j <= r || j >= n - r%图片边界处理(引导像素)
                continue;
            else
                target(i, j, k) = WGGF(guide_img, source, r, dzeta, i, j, k, lambda); 
            end
        end
    end
end

%% 显示图形
figure;
subplot(1,2,1), imshow(source), title('Source image');
subplot(1,2,2), imshow(target), title('WGGF image');