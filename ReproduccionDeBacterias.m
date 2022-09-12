clear all
close all

y(1)=0.7;
r=2.4;%Población estable y controlada
%r=0.4;%Población se extingue
%r=3.89; %Población caótica
 k=1;
for i=1:1000

y(i+1)=r*y(i)*(k-y(i));
plot(y);
pause(0.00001)
end
