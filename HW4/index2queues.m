function queues = index2queues(index, dimension, max_num)
%% max_num=5:  0,1,2,3,4,5
index = index - 1;
queues = zeros(1,dimension);
for i = 1:dimension-1
    queues(i) = floor(index/(dimension-1)/((max_num+1)^(dimension-i-1)));
    index = index - queues(i)*((max_num+1)^(dimension-i-1)*(dimension-1));
end
queues(end) = index;