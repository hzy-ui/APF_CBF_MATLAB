function [gradient_x, gradient_y]=Calculate_gradient_V1_yita(x,y,A,F,obs1,obs2,C,yita)
%note:change F we can change the goal point
%for dynamical obstacle avoidence
%x, y 想输入的的坐标
%A,F为U1的参数
%obs1,obs2 想避开的位置,C是障碍半径
Gradient_U1=0.001*(2*A*[x;y]+F');
q=sqrt((x-obs1)^2+(y-obs2)^2);
D_q=(1/2)*((x-obs1)^2+(y-obs2)^2)^(-1/2)*[2*(x-obs1);2*(y-obs2)];
if q>C
    Gradient_U2=[0;0];
else
    Gradient_U2=-yita*((1/C)-(1/q))*(1/(q^2))*D_q; %this part to make it adjust more slowly.
end
% U_all=Gradient_U1+Gradient_U2;
U_all=Gradient_U2;
gradient_x=U_all(1,1);
gradient_y=U_all(2,1);

%[gradient_x, gradient_y]=Calculate_gradient(50-sqrt(113),50-sqrt(113),A,F,50,50,20)