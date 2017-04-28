function [cloest_point ratio]  = SSD_correspondence(query_point, im1, corners2, im2, window_size)
    % although the window_size should be odd, we deal with the case when it
    % is even
    if mod(window_size,2) == 0
        low = -window_size/2+1;
        high = window_size/2;
    else
        low = -floor(window_size/2);
        high = floor(window_size/2);
    end
    %% compute the minimum and second minimum of SSD in im2
    min_ssd = 100000;
    second_min_ssd = 100000;
    for corner2 = corners2'
        x = corner2(1);
        y = corner2(2);
        ssd = 0;
        for j = low:high
            for i = low:high
                y1 = query_point(2)+j;
                x1 = query_point(1)+i;
                y2 = y+j;
                x2 = x+i;
                % image Y*X
                d = im1(y1,x1)-im2(y2,x2);
                ssd = ssd + d*d;

            end
        end
        if ssd < min_ssd
            second_min_ssd = min_ssd;
            min_ssd = ssd;
            cloest_point = [x, y];
        else if ssd < second_min_ssd
                second_min_ssd = ssd;
            end 
        end
    end
    if min_ssd == 0
        ratio = 1000;
    else
        ratio = second_min_ssd / min_ssd;
    end
end