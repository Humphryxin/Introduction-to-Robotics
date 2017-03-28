% mdp:
%% T{action}(current_state, next_state) : transition model
%% R(current_state, action, next_state) : reward
%% gamma: discount factor

function queues3_mdp = make_mdp_3queues(p, rewards, max_num, gamma)

%% state (i,j,k,a)
max_index = (max_num+1)*(max_num+1)*(max_num+1)*3;
for n = 1:max_num
    R{n} = zeros(max_index,max_index);
    T{n} = zeros(max_index,max_index);
end


%% action a,b,c, denoted by 1,2,3
for i = 0:max_num
    for j = 0:max_num
        for k = 0:max_num
            for cur = 0:2
                for a = 0:2
                    if a ~= cur || (a==cur && (a==0) && (i==0)) || (a==cur && (a==1) && (j==0)) || (a==cur && (a==2) && (k==0))
                        index = [i,j,k,cur];
                        [T,R] = mutate_TR_with_prob(T,R, index, index, a, p, max_num, 0);
                        %R{a}(queues2index([i,j,k,cur]), queues2index([i,j,k,a])) = 0;
                    else
                        if a == 0
                            if i > 0
                                index = [i-1,j,k,cur];
                                [T, R] = mutate_TR_with_prob(T, R, [i,j,k,cur], index, a, p, max_num, rewards(1));
                            end
                        end
                        if a == 1
                            if j > 0
                                index = [i,j-1,k,cur];
                                [T, R] = mutate_TR_with_prob(T, R, [i,j,k,cur], index, a, p, max_num, rewards(2));
                            end
                        end
                        if a == 2
                            if k > 0
                                index = [i,j,k-1,cur];
                                [T, R] = mutate_TR_with_prob(T, R, [i,j,k,cur], index, a, p, max_num, rewards(3));
                            end
                        end
                    end
                end
            end
        end
    end
end
%% function prototype
%% function index = queues2index(queues, size)
%% function queues = index2queues(index, dimension, size)


queues3_mdp.T = T;
queues3_mdp.R = R;
queues3_mdp.gamma = gamma;