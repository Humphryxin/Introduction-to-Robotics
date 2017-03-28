function [xc1, yc1] = plot_circle(x,y,d)
xc1=[];
yc1=[];
ang = 0:0.01:2*pi;
    for r = 0:0.1:d/2.0
        xc1 = [xc1, x+r*cos(ang)];
        yc1 = [yc1, y+r*sin(ang)];
    end
end


