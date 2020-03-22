%% ��ȡͼƬ
source = im2double( imread('test.jpg') );
guide_img = source;

%% ����˹�����˲�
[m ,n, div] = size(source);
r = 5; %���ڰ뾶
dr = 0.5; %�������
for k = 1 : div
    for i = 1 : m
        for j = 1 : n
            if i <= r || i >= m - r || j <= r || j >= n - r %ͼƬ�߽紦��(ԭ����)
                continue;
            else
                guide_img(i,j,k) = GS(source, r, dr, i, j, k); %�ռ����˲�
            end
        end
    end
end

%% ���WGGF
target = guide_img;
r = 5; %���ڰ뾶
dzeta = 0.1; %Ƶ�����
lambda = 0.12; % ��Ϊһѡ������ֵ 
for k = 1 : div
    for i = 1 : m
        for j = 1 : n
            if i <= r || i >= m - r || j <= r || j >= n - r%ͼƬ�߽紦��(��������)
                continue;
            else
                target(i, j, k) = WGGF(guide_img, source, r, dzeta, i, j, k, lambda); 
            end
        end
    end
end

%% ��ʾͼ��
figure;
subplot(1,2,1), imshow(source), title('Source image');
subplot(1,2,2), imshow(target), title('WGGF image');