clc; clear all; close all;

x0 = [1, 1, 1, 1];

options = optimoptions('fmincon', 'Display', 'iter');

A = [];
b = [];
Aeq = [];
beq = [];

lb = [];
ub = [];

[x_optimal, fval] = fmincon(@objective, x0, A, b, Aeq, beq, lb, ub, @nonlcon, options);

disp('Optimal solution:')
disp(x_optimal)
disp('Objective function value at optimal solution:')
disp(fval)



function f = objective(x)
    f = x(1)^2 + x(2)^2 + 2*x(3)^2 + x(4)^2 + 5*x(1) - 5*x(2) - 21*x(3) + 7*x(4);
end

function [c, ceq] = nonlcon(x)
    c(1) = x(1)^2 + x(2)^2 + x(3)^2 + x(4)^2 + x(1) - x(2) + x(3) - x(4) - 8;
    c(2) = x(1)^2 + 2*x(2)^2 + x(3)^2 + 2*x(4)^2 - x(1) - x(4) - 10;
    c(3) = 2*x(1)^2 + x(2)^2 + x(3)^2 + 2*x(1) - x(2) - x(4) - 5;
    
    ceq = [];
end

