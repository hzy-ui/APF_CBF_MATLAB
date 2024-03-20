function [gamma_0,gamma_inf,l] = gamma_builder_1(x1_0, x2_0,x1_goal, x2_goal,R, t_star)
%% gamma_builder(x1_0, x2_0,x1_goal, x2_goal,R, t_star)
% (x1_0, x2_0) initial condition;
% (x1_goal, x2_goal) goal position;
%  R goal radius 
%  t_star important time
%%
delta = 1; % the inital is inside the forward invariant set (robustness)
r = 0.2; % the robustness of the formulas  
l_max = 5; %bounded l
gamma_inf = 9.9;
h_0 = R - sqrt( (x1_0-x1_goal)^(2) + (x2_0-x2_goal)^(2) );
gamma_0 = h_0 - delta;
if gamma_inf > R
    gamma_inf = R;
else
    gamma_inf = gamma_inf;
end
if t_star >= 0
l = ( - log( (r - gamma_inf )/ (gamma_0 - gamma_inf ) ) ) / t_star;
    if l> l_max
        l = l_max;
    end
else
    l = l_max;
end

    