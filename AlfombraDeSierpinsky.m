hold off
x = 0;
y = 0;
k1 = 2/3;
k2 = 1/3;

for i=1:7000;

    d = randi([0,7]);

    if (d==0)
        x = x/3;
        y = y/3;

    elseif (d==1)
        x = x/3 + k1;
        y = y/3;

    elseif (d==2)
        x = x/3 + k1;
        y = y/3 + k2;

    elseif (d==3)
        x = x/3;
        y = y/3 + k2;

    elseif (d==4)
        x = x/3 + k2;
        y = y/3;

    elseif (d==5)
        x = x/3;
        y = y/3 + k1;

    elseif (d==6)
        x = x/3 + k2;
        y = y/3 + k1;

    elseif (d==7)
        x = x/3 + k1;
        y = y/3 + k1;

    endif

 hold on;
 plot(x,y,'.','color','r');
 pause(0.00000001)
endfor
