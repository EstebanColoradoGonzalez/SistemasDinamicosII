clear all
close all
a = zeros(200, 200);
imshow(a);
g = 9.81;
b = 0.43; % Fricción del agua minimo
M = 2000; %Gramos
deltaT = 0.08; % segundos
volumen = 1; % Metros Cubicos
fuerzaGravedad = M*g; %Metros/Segundos
v(1) = 5; %Metros/Segundos
posicion = 50; % Posicion Inicial
posicionDeseada = 150;

for i = 1 : 200
  a(posicionDeseada, i) = 255;
endfor

for i = 1 : 500
  fuerzaFlotabilidad =  M*g*volumen;

  v(i+1) = deltaT*(g - (b * v(i))/M - fuerzaFlotabilidad/M) + v(i);

  posicion(i + 1) = posicion(i) + deltaT*v(i+1);

  volumenEnEquilibrio = 1 - (b * v(i))/(M * g) + v(i)/(deltaT * g)

  e = posicion(i) - posicionDeseada;

  volumen = 0.07 * e + volumenEnEquilibrio;

  if (volumen<=0.1)
    volumen = 0.11;
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
