clear all
clear all

a=zeros(200,200);
imshow(a)
g=9.81;
vx(1)=50;
vy(1)=0;
b=0.1;
posicionver=100;
posicionhor=100;

for i = 1:500
  vy(i+1)=g-b*vy(i)+vy(i);
  posicionver(i+1)=posicionver(i)+vy(i+1);

  vx(i+1)=-b*vx(i)+vx(i);
  posicionhor(i+1)=posicionhor(i)+vx(i+1);

  if(posicionver(i+1)>=200)
    posicionver(i+1)=200;
    vy(i+1)=-0.7*vy(i);
  end
  if(posicionhor(i+1)>=200)
    posicionhor(i+1)=200;
    vx(i+1)=-0.7*vx(i);
  end
  a(floor(posicionver(i+1)),floor(posicionhor(i+1)))=255;
  imshow(a);
  a(floor(posicionver(i+1)),floor(posicionhor(i+1)))=0;
  pause(0.00001);
endfor
%plot(v);
%figure
%plot(posicion);
