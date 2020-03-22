function output = WGGF(guide_img, source, r, dzeta, px, py, div, lambda)
% ���ڸ�֪�ĸ�˹�����˲�
%���WGGF��ÿ�����ص�p�����������
    Upsilon = 0;%�ӣ���һ��ϵ��
    output = 0;
    flag = 0;
    for i = -r : r
        for j = -r : r
            temp = abs( guide_img(px + i, py + 1, div) - guide_img(px, py, div) );
            if temp <= lambda 
                flag = flag + 1;
                Upsilon = Upsilon + gzeta(guide_img, div, px, py, px+i, py+j, dzeta);
                output = output + guide_img(px + i,py + j,div) * gzeta(guide_img, div, px, py, px+i, py+j, dzeta);
            end
        end
    end

    if flag == 1 %�����㴰�ڸ�֪��Ҫ�󣬷���3*3�����е����ص���ֵ
        output = medfilt2( source( (px - 1):(px + 1), (py - 1):(py + 1), j), [3,3] );
    else %��������
        output = output / Upsilon ;
    end
end