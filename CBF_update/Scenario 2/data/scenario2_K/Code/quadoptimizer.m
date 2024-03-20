function [U] = quadoptimizer(H,b,A)
% lb=[-5000;-5000;-5000];
% ub=[5000;5000;5000];
% nonlcon = @nonlinear_constraint;
lb=[];
ub=[];
U=quadprog(H,[],-A,b,[],[],lb,ub);

% function [c,ceq] = nonlinear_constraint(x)