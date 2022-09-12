hold off
x=1;
y=1;

t=0;
for i=1:1000;
d=randi([0,2]);

 if (d == 0)

   t = 0.5*x;

   y = 0.5*y;

   x=t;

 elseif (d == 1)

   t = 0.5*x + 0.25;

   y = 0.5*y + sqrt(3)/4;

   x = t;

 elseif (d == 2)

   t = 0.5*x + 0.5;

   y = 0.5*y;

   x = t;

 end
 hold on;
 plot(x,y,'*','color','g');
 pause(0.00000001)

endfor
