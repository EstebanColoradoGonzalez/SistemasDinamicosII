pkg load control
clear all
close all
hold off;

num=1.1*[0.008594  0.008548]
den=-[-1.984  0.9841]

Ts=1;

%Condiciones iniciales del programa y de la ecuación en diferencias

SalidaSis(1)=0;
SalidaSis(2)=0;
SalidaSis(3)=0;
SalidaSis(4)=0;
i=4;
Referencia(i)=200;
error=Referencia(i);

u(1)=1;
u(2)=1;
u(3)=1;
u(4)=1;

error(1)=0;
error(2)=0;
error(3)=0;
error(4)=0;
error(5)=0;

%%Proceso en lazo abierto
SalidaSis(i)=SalidaSis(i-1);

while (i<500)

  Referencia(i)=200;

  if(error(i) > 0)
    u(i) = 10;
  else
    u(i) = 0;
  endif

  SalidaSis(i)=num*[u(i-1) u(i-2)]' + den*[SalidaSis(i-1) SalidaSis(i-2)]';

  error(i+1)= Referencia(i) - SalidaSis(i);

  i=i+1;

end


u(i)=0;
%Graficar la salida
t=1:length(SalidaSis);
plot(t*Ts , SalidaSis ) %%Se suma el offset de donde arrancó el experimento
