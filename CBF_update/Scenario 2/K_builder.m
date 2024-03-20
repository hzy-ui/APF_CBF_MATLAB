function [K] = K_builder(x1, x2,x1_goal, x2_goal,x1_p,x2_p,t_remain)
%% K_builder(x1_0, x2_0,x1_goal, x2_goal,R, t_star)
% (x1, x2) current position;
% (x1_goal, x2_goal) goal position;
% (x1_p, x2_p) potential field vector
%  t_remain  time remain 
%%
goal = [x1_goal,x2_goal];
position = [x1,x2];
potential_vec = [x1_p, x2_p] ;
direction_vec = [x1_goal-x1, x2_goal - x2];
product_v = dot (potential_vec, direction_vec);
norm_dir = norm( direction_vec);
cos_theta = product_v / (norm_dir * norm(potential_vec));
potential_cos_theta = product_v / norm_dir;
if potential_cos_theta< 0
    potential_cos_theta = -potential_cos_theta;
end
K = norm(direction_vec)/ (t_remain * potential_cos_theta);
if K>100
    K = 100;
end
if K<50
    K = 50;
end