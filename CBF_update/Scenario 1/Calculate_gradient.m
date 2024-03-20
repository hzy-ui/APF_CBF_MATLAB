function [gradient_x, gradient_y]=Calculate_gradient(x,y,A,F,obs1,obs2,C)
%note:change F to change the goal 
%x, y ������ĵ�����
%A,FΪU1�Ĳ���
%obs1,obs2 ��ܿ���λ��,C���ϰ��뾶
Gradient_U1=0.001*(2*A*[x;y]+F'); %0.001
q=sqrt((x-obs1)^2+(y-obs2)^2);
D_q=(1/2)*((x-obs1)^2+(y-obs2)^2)^(-1/2)*[2*(x-obs1);2*(y-obs2)];
if q>C
    Gradient_U2=0;
else
    Gradient_U2=-2*2000*((1/C)-(1/q))*(1/(q^2))*D_q;
end
U_all=Gradient_U1+Gradient_U2;
gradient_x=U_all(1,1);
gradient_y=U_all(2,1);
%[gradient_x, gradient_y]=Calculate_gradient(50-sqrt(113),50-sqrt(113),A,F,50,50,20)