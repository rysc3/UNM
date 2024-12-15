function [x,y] = generate_ls_data(N)

% Set the random seed to get reproducible results
rng('default');

% Generate x-data uniformly distributed over [0,1]
x = rand(N,1);

% Generate y = x*sin(2\pi x) + noise
y = x.*sin(2*pi*x) + 0.1*randn(N,1);