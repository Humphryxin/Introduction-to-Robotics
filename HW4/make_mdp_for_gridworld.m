% mdp:
%% T{action}(current_state, next_state) : transition model
%% R(current_state, action, next_state) : reward
%% gamma: discount factor



function gridworld_mdp = make_mdp_for_gridworld(p_noise, gamma)

%  p_noise: probability that action fails

% states:   
%  8  9 10 11  
%  5  x  6  7
%  1  2  3  4
%
%  12 = sink state

% position x is occupied by a wall and can never be visited


% Actions: N 1, E 2, S 3, W 4


T{1}(1,5) = 1 - p_noise;
T{1}(1,2) = p_noise/2;
T{1}(1,1) = p_noise/2;
T{2}(1,2) = 1 - p_noise;
T{2}(1,5) = p_noise/2;
T{2}(1,1) = p_noise/2;
T{3}(1,1) = 1 - p_noise + p_noise/2;
T{3}(1,2) = p_noise/2;
T{4}(1,1) = 1 - p_noise + p_noise/2;
T{4}(1,5) = p_noise/2;

T{1}(2,2) = 1 - p_noise;
T{1}(2,1) = p_noise/2;
T{1}(2,3) = p_noise/2;
T{2}(2,3) = 1 - p_noise;
T{2}(2,2) = p_noise;
T{3}(2,2) = 1 - p_noise;
T{3}(2,1) = p_noise/2;
T{3}(2,3) = p_noise/2;
T{4}(2,1) = 1 - p_noise;
T{4}(2,2) = p_noise;

T{1}(3,3) = 1 - p_noise;
T{1}(3,2) = p_noise/2;
T{1}(3,4) = p_noise/2;
T{2}(3,4) = 1 - p_noise;
T{2}(3,3) = p_noise/2;
T{2}(3,6) = p_noise/2;
T{3}(3,3) = 1 - p_noise;
T{3}(3,2) = p_noise/2;
T{3}(3,4) = p_noise/2;
T{4}(3,2) = 1 - p_noise;
T{4}(3,6) = p_noise/2;
T{4}(3,3) = p_noise/2;

T{1}(4,7) = 1 - p_noise;
T{1}(4,3) = p_noise/2;
T{1}(4,4) = p_noise/2;
T{2}(4,4) = 1 - p_noise + p_noise/2;
T{2}(4,7) = p_noise/2;
T{3}(4,4) = 1 - p_noise + p_noise/2;
T{3}(4,3) = p_noise/2;
T{4}(4,3) = 1 - p_noise;
T{4}(4,4) = p_noise/2;
T{4}(4,7) = p_noise/2;

T{1}(5,8) = 1 - p_noise;
T{1}(5,5) = p_noise;
T{2}(5,5) = 1 - p_noise;
T{2}(5,8) = p_noise/2;
T{2}(5,1) = p_noise/2;
T{3}(5,1) = 1 - p_noise;
T{3}(5,5) = p_noise;
T{4}(5,5) = 1 - p_noise;
T{4}(5,8) = p_noise/2;
T{4}(5,1) = p_noise/2;

T{1}(6,10) = 1 - p_noise;
T{1}(6,6) = p_noise/2;
T{1}(6,7) = p_noise/2;
T{2}(6,7) = 1-p_noise;
T{2}(6,10) = p_noise/2;
T{2}(6,3) = p_noise/2;
T{3}(6,3) = 1 - p_noise;
T{3}(6,6) = p_noise/2;
T{3}(6,7) = p_noise/2;
T{4}(6,6) = 1 - p_noise;
T{4}(6,3) = p_noise/2;
T{4}(6,10) = p_noise/2;


T{1}(7,12) = 1;
T{2}(7,12) = 1;
T{3}(7,12) = 1;
T{4}(7,12) = 1;

T{1}(8,8) = 1 - p_noise + p_noise/2;
T{1}(8,9) = p_noise/2;
T{2}(8,9) = 1 - p_noise;
T{2}(8,8) = p_noise/2;
T{2}(8,5) = p_noise/2;
T{3}(8,5) = 1 - p_noise;
T{3}(8,9) = p_noise/2;
T{3}(8,8) = p_noise/2;
T{4}(8,8) = 1 - p_noise + p_noise/2;
T{4}(8,5) = p_noise/2;

T{1}(9,9) = 1 - p_noise;
T{1}(9,8) = p_noise/2;
T{1}(9,10) = p_noise/2;
T{2}(9,10) = 1 - p_noise;
T{2}(9,9) = p_noise;
T{3}(9,9) = 1 - p_noise;
T{3}(9,10) = p_noise/2;
T{3}(9,8) = p_noise/2;
T{4}(9,8) = 1 - p_noise;
T{4}(9,9) = p_noise;

T{1}(10,10) = 1 - p_noise;  T{1}(10,9) = p_noise/2; T{1}(10,11) = p_noise/2;
T{2}(10,11) = 1 - p_noise; T{2}(10,6) = p_noise/2; T{2}(10,10) = p_noise/2;
T{3}(10,6) = 1 - p_noise; T{3}(10,9) = p_noise/2; T{3}(10,11) = p_noise/2;
T{4}(10,9) = 1 - p_noise; T{4}(10,10) = p_noise/2; T{4}(10,6) = p_noise/2;

T{1}(11,12) = 1;
T{2}(11,12) = 1;
T{3}(11,12) = 1;
T{4}(11,12) = 1;

T{1}(12,12) = 1;
T{2}(12,12) = 1;
T{3}(12,12) = 1;
T{4}(12,12) = 1;


R{1}=zeros(12,12);
R{2}=zeros(12,12);
R{3}=zeros(12,12);
R{4}=zeros(12,12);

R{1}(11,12) = 1;
R{2}(11,12) = 1;
R{3}(11,12) = 1;
R{4}(11,12) = 1;
R{1}(7,12) = -1;
R{2}(7,12) = -1;
R{3}(7,12) = -1;
R{4}(7,12) = -1;


gridworld_mdp.T = T;
gridworld_mdp.R = R;
gridworld_mdp.gamma = gamma;


		
		
		
		
		
		
		
		
		
		
		


