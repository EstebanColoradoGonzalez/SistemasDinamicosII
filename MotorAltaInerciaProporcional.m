pkg load control
clear all
close all
hold off;

num=[1.287e-07  3.984e-07   7.441e-08]
den=-[-2.273  1.606   -0.3329]

%Definición del sistema analógico
s=tf('s');
%sistema=1/s
sistema=1/(s*(s+10)*(s+100))
%Definición del sistema discreto
Ts=0.01;
sistemaDiscreto=c2d(sistema,Ts)
##bode(sistemaDiscreto);
##figure
##step(sistemaDiscreto)

%Experimento usando ecuaciones en diferencias


%Condiciones iniciales del programa y de la ecuación en diferencias

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

AmplitudRele=50000;

while (i<5000)
  Referencia(i)=1;

  u(i) = 30000 * error(i);

  SalidaSis(i)=num*[u(i-1) u(i-2) u(i-3)]' + den*[SalidaSis(i-1) SalidaSis(i-2) SalidaSis(i-3)]';

  error(i+1)= Referencia(i) - SalidaSis(i);

  i=i+1;

end

SalidaSis(i)=0;
u(i)=0;
%Graficar la salida

t=1:length(SalidaSis);
plot(t*Ts , SalidaSis)
%hold on;
%plot(t*Ts , u*0.002)
