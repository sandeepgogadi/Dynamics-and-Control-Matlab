clear all;
clc;

load('inertial_matrix_kinetic_energy.mat')

C = sym(zeros(n, n, n));

for i=1:n
    for j=1:n
        for k=1:n
            diff_i = diff(D(k,  j), q(i));
            diff_j = diff(D(k,  i), q(j));
            diff_k = diff(D(i,  j), q(k));
            C(i, j, k) = 0.5 * (diff_i + diff_j - diff_k) * qd(i);
        end
    end
end

Cor = sym(zeros(n, n));

for k=1:7
    for j=1:7
        for i=1:7
            Cor(k, j) = Cor(k, j) + C(i, k, j);
        end
    end
end

Pg = sym(zeros(n, 1));

for i=1:n
    Pg(i) = diff(PE, q(i));
end

qdd = sym('qdd', [n 1], 'real');

eom_lhs = D*qdd + Cor*qd + Pg;
