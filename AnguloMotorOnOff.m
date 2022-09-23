pkg load control
clear all
close all
hold off;

Ts=0.01;

Entrada(1)=0;
Entrada(2)=1;
Entrada(3)=1;
Entrada(4)=1;

SalidaSis(1)=0;
SalidaSis(2)=0;
SalidaSis(3)=0;
SalidaSis(4)=0;

i=4;

Referencia(i)=1;

error=Referencia(i);

u(1)=0;
u(2)=0;
u(3)=0;
u(4)=0;

error(1)=0;
error(2)=0;
error(3)=0;
error(4)=0;
error(5)=0;

K=1;

AmplitudRele=50000;

while (i<500)
  Referencia(i)=1;

  if(error(i) > 0)
    u(i) = K
  endif

  if(error(i) < 0)
    u(i) = -K
  endif

  SalidaSis(i)= Ts*u(i)+SalidaSis(i-1);

  error(i+1)= Referencia(i) - SalidaSis(i);

  i=i+1;
end

SalidaSis(i)=0;
u(i)=0;
t=1:length(SalidaSis);
plot(t*Ts , SalidaSis)
