function [U] = PVF_optimizer(H,b,A,F,distance,gradient_x,gradient_y)

U=quadprog(H,F,-A,b);
if distance>1 && gradient_x<=0.1 && gradient_y<=0.1
    U=quadprog(H,F,-A,b)+[15*rand;15*rand;15*rand];
end
