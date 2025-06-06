function [U] = PVF_optimizer(H,b,A,F,distance,gradient_x,gradient_y)
% lb=[-5000;-5000;-5000];
% ub=[5000;5000;5000];
lb=[];
ub=[];
U=quadprog(H,F,-A,b,[],[],lb,ub);
% if distance>1 && gradient_x<=0.1 && gradient_y<=0.1
if distance>5 && sqrt(gradient_x^(2) + gradient_y^(2) ) < 0.001
    U=quadprog(H,F,-A,b)+[50*rand;50*rand;50*rand];
%      U=quadprog(H,F,-A,b)+[15;10;15];%turn left
%      U=quadprog(H,F,-A,b)+[10;0;0];%turn left
%        U=quadprog(H,F,-A,b)+[0;0;10];
end
