clc
clear
close all

dydt = @(t,y,b)[-b(1)*y(1).*y(2)+b(3)*y(3);
                     b(1)*y(1).*y(2)-b(2)*y(2);
                     b(2)*y(2)-b(3)*y(3);
                ];
                 
b=[0.5 0.05 0.04];%третє значення це гамма,коли гамма=0 маємо довічний імунітет
tspan = [0 150];
y0= [0.9999  0.0001 0 ];
n=tspan(end)+1;
sol = ode45(@(t,y) dydt(t,y,b), tspan, y0);
t=linspace(tspan(1),tspan(end),n)';%часовий інтервал
y=deval(sol,t)';%розвязок на часовому інтервалі
plot(t,y(:,1),t,y(:,2),t,y(:,3),'LineWidth',1.4)%графік розвязку
ylabel('Частка населення відповідної категорії');
xlabel('Дні');
legend('s','i','r')
title('Графік розвязку SIR системи при \gamma = 0.04')
