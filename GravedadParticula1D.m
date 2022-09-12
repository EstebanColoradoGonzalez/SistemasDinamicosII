clear all
close all
a = zeros(200, 200);
a(100, 100) = 255;
imshow(a);
g = 9.81;
b = 0.1;
v(1) = 0;
posicion = 100;

for i = 1 : 100
  v(i+1) = g - b * v(i) + v(i); %Con fricción
  posicion(i + 1) = posicion(i) + v(i+1);
  if (posicion(i+1) >= 200)
    v(i+1) = -0.7*v(i);
    posicion(i+1) = 200;
  endif
  a(floor(posicion(i+1)), 100) = 255;
  imshow(a);
  a(floor(posicion(i+1)), 100) = 0;
  pause(0.00001);
endfor
%plot(v);
%figure
%plot(posicion);
