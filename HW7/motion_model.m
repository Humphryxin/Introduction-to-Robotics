%% xt is pose, ut is odometry reading, alpha are the noise parameters
function  xt_n = motin_model(xt, ut, alpha)
    sigma_r1_hat = ut(1) + sample_normal_distribution(alpha(1)*abs(ut(1)) + alpha(2)*ut(2));
    sigma_t_hat = ut(3) + sample_normal_distribution(alpha(3)*ut(3)+alpha(4)*(abs(ut(1))+abs(ut(2))));
    sigma_r2_hat = ut(2) + sample_normal_distribution(alpha(1)*abs(ut(2))+alpha(2)*ut(3));
    xt_n(1) = xt(1) + sigma_t_hat*cos(xt(3)+sigma_r1_hat);
    xt_n(2) = xt(2) + sigma_t_hat*sin(xt(3)+sigma_r1_hat);
    xt_n(3) = xt(3) + sigma_r1_hat + sigma_r2_hat;
end