t = [0:0.01:0.98];
y1 = sin(2*pi*4*t);
y2 = cos(2*pi*4*t);

figure;
plot(t,y1);
hold on;
plot(t,y2, 'r');    %Plotearlo en rojo
xlabel('time');
ylabel('value');
legend('sin','cos');
title('My first plot in octave');
print -dpng 'myPlot.png';               %Guardarlo en png

pause;
close;                                  %Cerrar todas las figuras

figure(1); plot(t,y1);
figure(2); plot(t,y2);

pause;
close;

subplot(1,2,1); %Divide plot a 1x2 grid, and acces the first element
plot(t,y1);
subplot(1,2,2);
plot(t,y2);

axis([0.5 1 -1 1])      %Setea el x entre 0.5 y 1 y el y en -1 y 1
pause;
clf;                %Borra la figura sin cerrarla

A = magic(5)

imagesc(A), colorbar;              %Ploteaa los valores en una matriz con colores
%Separarlo por comas las corre al mismo tiempo
pause;

