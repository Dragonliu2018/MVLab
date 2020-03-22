function output = GS(image, r, dr, px, py, div)
% 求解高斯空间域滤波，返回指定像素点(p)的输出
    Upsilon = 0;%τ，归一化系数
    output = 0;
    for i = -r : r % 以p为中心的窗口半径为2r+1的区域
        for j = -r : r
            Upsilon = Upsilon + gr(px, py, px + i, py + j, dr);
            output = output + gr(px, py, px + i, py + j, dr) * image(px + i,py + j,div);
        end
    end
    output = output / Upsilon ;
end
