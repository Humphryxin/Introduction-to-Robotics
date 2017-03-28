function pos = goToAvoid(x0, xg, xo)
%%% for Attractive force
epsilon = 0.0001; % epsilon need to be extremely small compared to nu
%%% for Repulsive force
nu = 5;
%%% effective field
rho_0 = 20;
%% time step
delta = 0.1;


% LOOP CONTROL 
MAX_RES = 0.1;
MAX_ITERATION = 3000;
N = 1;

% initialization
pos = [x0];
cur_pos = x0;

FLAG_GOAL = false;
while FLAG_GOAL == false && N < MAX_ITERATION
    %%%
    N = N+1;
    %%% Attractive force
    F_attr = -epsilon*(cur_pos - xg);
    
    % Repulsive force, may have multiple obstacles
    F_rep = [0;0];
    for i = 1:1:size(xo,2)
        rho_x0 = sqrt((cur_pos(1)-xo(1,i))*(cur_pos(1)-xo(1,i))+(cur_pos(2)-xo(2,i))*(cur_pos(2)-xo(2,i)));
        F_rep =F_rep + nu * (1/rho_x0 - 1/rho_0)*1/(rho_x0*rho_x0)*(cur_pos-xo(:,i))/rho_x0;
    end
    F = F_attr + F_rep;
    %% update cur_pos based on potential field control
    cur_pos = cur_pos+delta * F / sqrt(F(1)*F(1) + F(2)*F(2));
    pos = [pos,cur_pos];
    dis = sqrt((cur_pos(1)-xg(1))*(cur_pos(1)-xg(1))+(cur_pos(2)-xg(2))*(cur_pos(2)-xg(2)));
    if (dis <= MAX_RES)
        FLAG_GOAL = true;
    end
end


end