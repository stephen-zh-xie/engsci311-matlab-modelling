% UPI: sxie727
% ID: 641748774
% This code takes the results of Q3.3 and Q3.4 (ie analytical and numerical
% solutions) and compares them
% outputting the root mean square error

time = 0:0.1:10;
[Ia1, Ia2] = equation(time);

initial = [0, 0];
[t, I] = ode45(@difEq, time, initial);
In1 = I(:, 1);
In2 = I(:, 2);

n = length(time);
diff = [0, 0];
for point = 1:n
    diff(1) = diff(1) + ( Ia1(point) - In1(point) )^2;
    diff(2) = diff(2) + ( Ia2(point) - In2(point) )^2;
end

rmseI1 = sqrt(diff(1)/n);
rmseI2 = sqrt(diff(2)/n);

rmse = [rmseI1, rmseI2];

function [i1, i2] = equation(t)
    C1 = 0.1809;
    C2 = 0.0691;
    lambda1 = 0.5 + (sqrt(5) / 2);
    lambda2 = 0.5 - (sqrt(5) / 2);
    V1 = [1, (lambda1 - 2)];
    V2 = [1, (lambda2 - 2)];
    
    i1 = C1 * V1(1) * exp(lambda1 * t) + C2 * V2(1) * exp(lambda2 * t) - 0.25 * cos(t);
    i2 = C1 * V1(2) * exp(lambda1 * t) + C2 * V2(1) * exp(lambda2 * t) + 0.25 * sin(t) + 0.25 * cos(t);
end

function Id = difEq(t, I)
    Id = zeros(2, 1);
    Id(1) = - I(1) - I(2) + 0.5 * sin(t);
    Id(2) = I(1) + 2 * I(2) - 0.5 * sin(t);
end