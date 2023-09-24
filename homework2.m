x0 = [1, 1];

options = optimoptions('fmincon', 'Display', 'iter');

A = [1, 1]; 
b = 5;   

lb = [0, 0]; 
ub = [];    

[x_optimal, fval] = fmincon(@objective, x0, A, b, [], [], lb, ub, [], options);

fval = -fval;

disp('Optimal solution:')
disp(x_optimal)
disp('Objective function value at optimal solution:')
disp(fval)


function f = objective(x)
    f = -(20*x(1) + 16*x(2) - 2*x(1)^2 - x(2)^2 - (x(1) + x(2))^2);
end
