function result = gzeta(guide_img, div, px, py, qx, qy, dzeta)
% ��˹Ƶ��˺���
    result = exp( - ( ( guide_img(px, py, div) - guide_img(qx, qy, div) )^2 )  / (2 * dzeta^2) );
end

