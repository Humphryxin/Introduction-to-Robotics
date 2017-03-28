function index = queues2index(queues, max_num)
%% max_num=5:  0,1,2,3,4,5
dimension = size(queues, 2);
index = 0;
for i = 1:dimension-1
    index = index + queues(i) * ((max_num+1)^(dimension - i - 1))*(dimension-1);
end
index = index + queues(end);
index = index + 1;