clear all;
clc;

n = 7; % DOF

% DH parameters
q = sym('q', [n 1], 'real'); % generalized coordinates (joint angles)
d = sym('d', [n 1], 'real'); % link offsets
syms a1

% initial conditions for the configuration of Sawyer shown in Figure 1.
% you can use these values to sense check your work
% HINT: vpa(subs(expr, vars, vals)) evaluates a symbolic expression 'expr' by
% substituting each element of 'vals' with its corresponding symbolic variable in 'vars'
q0 = [0 3*pi/2 0 pi 0 pi 3*pi/2];
d0 = [317 192.5 400 168.5 400 136.3 133.75];
a10 = 81;

% cell array of your homogeneous transformations; each Ti{i} is a 4x4 symbolic transform matrix
% provide your answer in terms of the given symbolic variables
% NOTE: for symbolic arrays: q(1) = q1, q(2) = q2, etc.
Ti = cell(n,1);

% a, alpha, d, theta
dh = [a1, -pi/2, d(1), q(1);
      0, -pi/2, d(2), q(2);
      0, -pi/2, d(3), q(3);
      0, -pi/2, d(4), q(4);
      0, -pi/2, d(5), q(5);
      0, -pi/2, d(6), q(6);
      0, 0, d(7), q(7);];

% your code may look something like:
for i = 1:n
    A = [cos(dh(i, 4)), -sin(dh(i, 4))*cos(dh(i, 2)), sin(dh(i, 4))*sin(dh(i, 2)), dh(i, 1)*cos(dh(i, 4));
             sin(dh(i, 4)), cos(dh(i, 4))*cos(dh(i, 2)), -cos(dh(i, 4))*sin(dh(i, 2)), dh(i, 1)*sin(dh(i, 4));
             0, sin(dh(i, 2)), cos(dh(i, 2)), dh(i, 3);
             0, 0, 0, 1;];

    if i>1
        Ti{i} = Ti{i-1}*A;
    else
        Ti{i} = A;
    end
    % input symbolic homogeneous transformation matrix i
end

vpa(subs(Ti{7}, [a1 d' q'], [a10 d0 q0]))

save('transforms.mat', 'Ti')

