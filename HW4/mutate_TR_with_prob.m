function [new_T, new_R] = mutate_TR_with_prob(T,R, raw_index,index, a, p, max_num, reward)
%%% build the transition and reward model based on pa, pb, pc
i = index(1);
j = index(2);
k = index(3);
pa = p(1);
pb = p(2);
pc = p(3);

T{a+1}(queues2index(raw_index, max_num), queues2index([i,j,k,a],max_num)) = (1-pa)*(1-pb)*(1-pc);
index = [i+1,j,k,a];
if checkLegalIndex(index, max_num)
    T{a+1}(queues2index(raw_index, max_num), queues2index(index, max_num)) = pa*(1-pb)*(1-pc);
    R{a+1}(queues2index(raw_index, max_num), queues2index(index, max_num)) = reward;
end
index = [i+1,j+1,k,a];
if checkLegalIndex(index, max_num)
    T{a+1}(queues2index(raw_index, max_num), queues2index(index, max_num)) = pa*pb*(1-pc);
    R{a+1}(queues2index(raw_index, max_num), queues2index(index, max_num)) = reward;
end
index = [i+1,j,k+1,a];
if checkLegalIndex(index, max_num)
    T{a+1}(queues2index(raw_index, max_num), queues2index(index, max_num)) = pa*(1-pb)*pc;
    R{a+1}(queues2index(raw_index, max_num), queues2index(index, max_num)) = reward;
end
index = [i+1,j+1,k+1,a];
if checkLegalIndex(index, max_num)
    T{a+1}(queues2index(raw_index, max_num), queues2index(index, max_num)) = pa*pb*pc;
    R{a+1}(queues2index(raw_index, max_num), queues2index(index, max_num)) = reward;
end
index = [i,j+1,k,a];
if checkLegalIndex(index, max_num)
    T{a+1}(queues2index(raw_index, max_num), queues2index(index, max_num)) = (1-pa)*pb*(1-pc);
    R{a+1}(queues2index(raw_index, max_num), queues2index(index, max_num)) = reward;
end
index = [i,j+1,k+1,a];
if checkLegalIndex(index, max_num)
    T{a+1}(queues2index(raw_index, max_num), queues2index(index, max_num)) = (1-pa)*pb*pc;
    R{a+1}(queues2index(raw_index, max_num), queues2index(index, max_num)) = reward;
end
index = [i,j,k+1,a];
if checkLegalIndex(index, max_num)
    T{a+1}(queues2index(raw_index, max_num), queues2index(index, max_num)) = pa*pb*(1-pc);
    R{a+1}(queues2index(raw_index, max_num), queues2index(index, max_num)) = reward;
end
new_T = T;
new_R = R;