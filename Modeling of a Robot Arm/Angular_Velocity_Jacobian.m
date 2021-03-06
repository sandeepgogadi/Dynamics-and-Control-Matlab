clear all;
clc;

n = 7; % degrees of freedom of Sawyer

% initial conditions for the configuration of Sawyer shown in Figure 1.
% you can use these values to sense check your work
% HINT: vpa(subs(expr, vars, vals)) evaluates a symbolic expression 'expr' by
% substituting each element of 'vals' with its corresponding symbolic variable in 'vars'
q0 = [0 3*pi/2 0 pi 0 pi 3*pi/2];
d0 = [317 192.5 400 168.5 400 136.3 133.75];
a10 = 81;

% symbolic variables
q = sym('q', [n 1], 'real'); % generalized coordinates (joint angles)
d = sym('d', [n 1], 'real'); % link offsets
syms a1 real

% loads Ti - the homogeneous transformations solved for previously
load('transforms.mat');

% Initialize angular velocity jacobian as an nx1 cell array where each element is
% an 3xn symbolic matrix
Jw = arrayfun(@(x) sym(zeros(3,n)), 1:n, 'UniformOutput', 0)';

% your code might look like this
for i = 1:n
    if i > 1
        Jw{i} = Jw{i-1};
        Jw{i}(1:3, i) = Ti{i-1}(1:3, 3);
    else
        Jw{i}(1:3, i) = [0, 0, 1]';
    end
    % angular velocity jacobian for link i
end

save('angular_velocity_jacobian.mat', 'Jw')
