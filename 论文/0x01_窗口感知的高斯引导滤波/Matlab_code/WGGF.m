function output = WGGF(guide_img, source, r, dzeta, px, py, div, lambda)
% 窗口感知的高斯引导滤波
%求解WGGF在每个像素点p的输出并返回
    Upsilon = 0;%τ，归一化系数
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

    if flag == 1 %不满足窗口感知的要求，返回3*3窗口中的像素点中值
        output = medfilt2( source( (px - 1):(px + 1), (py - 1):(py + 1), j), [3,3] );
    else %满足条件
        output = output / Upsilon ;
    end
end