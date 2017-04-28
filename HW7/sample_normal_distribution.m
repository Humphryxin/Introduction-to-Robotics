function result = sample_normal_distribution(b)
    result = 0;
    for i = 1:12
        result =result -b + (b+b)*rand(1);
    end
    result = result / 2;
end