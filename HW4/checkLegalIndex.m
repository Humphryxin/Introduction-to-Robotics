function check = checkLegalIndex(queues,  max_num)
%% check upper bound <= max_num
dimension = size(queues,2)-1;
if any(queues(1:dimension)>max_num)
    check = false;
else
    check = true;
end