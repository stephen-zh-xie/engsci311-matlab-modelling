% UPI: sxie727
% ID: 641748774
% This system plots against time the currents I1 and I2
% between times t=0s and t=10s in 0.1s intervals
time = 0:0.1:10;
[I1, I2] = equation(time);
plot(time, I1, "r-o", time, I2, "b-*")
title("Currents I1 (circuit 1) and I2 (circuit 2) against time t")
xlabel("t (seconds)")
ylabel("I (amperes)")
legend("I1", "I2")


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