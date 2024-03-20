function [K] = K_builder_G(x1, x2,x1_goal, x2_goal,x1_p,x2_p, v_max, R)
%% K_builder(x1_0, x2_0,x1_goal, x2_goal,R, t_star)
% (x1, x2) current position;
% (x1_goal, x2_goal) goal position;
% (x1_p, x2_p) potential field vector
%  v_max: max velocity of the dynamic 
% R radius of the dynamics 
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
k1 = v_max/R;
K = (k1 * norm_dir)/ (potential_cos_theta);
if K>1000
    K = 1000;
end