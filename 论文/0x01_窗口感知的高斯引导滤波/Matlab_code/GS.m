function output = GS(image, r, dr, px, py, div)
% ����˹�ռ����˲�������ָ�����ص�(p)�����
    Upsilon = 0;%�ӣ���һ��ϵ��
    output = 0;
    for i = -r : r % ��pΪ���ĵĴ��ڰ뾶Ϊ2r+1������
        for j = -r : r
            Upsilon = Upsilon + gr(px, py, px + i, py + j, dr);
            output = output + gr(px, py, px + i, py + j, dr) * image(px + i,py + j,div);
        end
    end
    output = output / Upsilon ;
end
