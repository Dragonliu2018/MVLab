function result = gr(px, py, qx, qy, dr)
% ��˹�ռ�˺���
    result = exp( - ( (qx - px)^2 + (qy - py)^2 ) / (2 * dr^2) );
end

