clear all
close all
a = zeros(200, 200);
imshow(a);
g = 9.81;
b = 0.43; % Fricción del agua minimo
M = 100; %Gramos
r = 0.01; %metros
pi = 3.1415;
deltaT = 0.1;
volumen = 4/3*pi*(r*r*r);
fuerzaGravedad = M*g; %Metros/Segundos
fuerzaFlotabilidad =  M*g*volumen;
v(1) = 5; %Metros/Segundos
posicion = 50;
posicionDeseada = 150;

for i = 1 : 200
  a(posicionDeseada, i) = 255;
endfor

for i = 1 : 150
  v(i+1) = deltaT*(g - (b * v(i))/M - fuerzaFlotabilidad/M) + v(i);
  posicion(i + 1) = posicion(i) + deltaT*v(i+1);

  if(posicion(i+1) <= posicionDeseada)
    r = -10
  endif

  if(posicion(i+1) >= posicionDeseada)
    r = +10
  endif

  if (posicion(i+1) >= 200)
    v(i+1) = -0.7*v(i);
    posicion(i+1) = 200;
  endif

  a(floor(posicion(i+1)), 100) = 255;
  imshow(a);
  a(floor(posicion(i+1)), 100) = 0;
  pause(0.00001);
endfor
