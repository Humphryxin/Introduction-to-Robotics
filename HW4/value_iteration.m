% value iteration:
function [V, pi] = value_iteration(mdp, precision)

%IN: mdp, precision
%OUT: V, pi

% Recall: to obtain an estimate of the value function within accuracy of
% "precision" it suffices that one of the following conditions is met:
%   (i)  max(abs(V_new-V)) <= precision / (2*gamma/(1-gamma))
%   (ii) gamma^i * Rmax / (1-gamma) <= precision  -- with i the value
%   iteration count, and Rmax = max_{s,a,s'} | R(s,a,s') |
    gamma = mdp.gamma;
    
%%% initialization
%%% iteration count
    count = 1;
    size_state = size(mdp.T{1},1);
    size_action = size(mdp.T,2);
    V = zeros([1, size_state]);
    pi = zeros([1, size_state]);
    Rmax = -100;
   
%%% compute Rmax
    for a =1:size_action
        if Rmax < max(max(mdp.R{a}))
            Rmax = max(max(mdp.R{a}));
        end
    end
%%% compute R
    for i = 1:size_state
        R(i) = sum(mdp.R{max_a}(i,:).*mdp.T{max_a}(i,:));
    end
    
    
    while 1
        %%% value iteration
        V_copy = V;
        for i = 1:size_state
            max_temp = -1000;
            max_a=1;
            %% loop over choices of actions
            for a = 1:size_action
                sum_temp = 0;
                %% loop over all potential next states
                for j = 1:size_state
                    sum_temp = sum_temp + mdp.T{a}(i,j)*V(j);
                end
                %% track the best action
                if sum_temp>max_temp
                   max_temp = sum_temp;
                   max_a = a;
                end
            end
            
            R = sum(mdp.R{max_a}(i,:).*mdp.T{max_a}(i,:));
            V_copy(i) = R + gamma*max_temp;
        end
        
        %%% termination condition
        %   (i)  max(abs(V_new-V)) <= precision / (2*gamma/(1-gamma))
        %   (ii) gamma^i * Rmax / (1-gamma) <= precision  -- with i the value
        %   iteration count, and Rmax = max_{s,a,s'} | R(s,a,s') |
        cond1 = max(abs(V_copy - V)) <= precision/ (2*gamma/(1-gamma));
        cond2 = gamma^count * Rmax / (1-gamma) <= precision;
        if mod(count,10) == 1
            max(abs(V_copy - V))
            count
        end
        if cond1 || cond2
            break
        end
        V = V_copy;
        count = count+1;
        
    end
    for i=1:size_state
        best_action = 0;
        best_utility = -100;
        for a=1:size_action
            utility_temp = 0;
            for j=1:size_state
                utility_temp = utility_temp + mdp.T{a}(i,j)*V(j);
            end
            if utility_temp>best_utility
                best_utility = utility_temp;
                best_action = a;
            end
        end
        pi(i) = best_action;
    end
end
    
    
