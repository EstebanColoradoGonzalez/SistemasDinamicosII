hold off
x=1;
y=1;
t=0;

for i=1:100000;
d=rand(1,1)*100;



      if(d > 14)
      t= (0.85*x +0.04*y);
      y= -0.04*x+0.85*y+1.6;
      x=t;

      elseif (d > 8)



      t= (0.2*x -0.26*y);
      y= 0.23*x+0.22*y+1.6;
      x=t;

   elseif (d > 1)
      t= (-0.15*x +0.28*y);
      y= 0.26*x+0.24*y+0.44;
      x=t;



elseif( d == 0)
      x=0;
      y=y*0.16;
  end

hold on;

plot(x,y,'*','color','g'); %%Este es el Helecho

%plot(i,x,'Linestyle',"-"); %%Aprender a dibujar la línea sólida
pause(0.00000001)
endfor
