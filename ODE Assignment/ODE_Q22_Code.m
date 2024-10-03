% UPI: sxie727
% ID: 641748774
% This program draws a phase plane for the circuit in terms of I1 and I2
% between the times t=0 and 1=10 seconds in intervals of 0.1s

time = 0:0.1:10;
[I1, I2] = circuit(time);
plot(I1, I2)
title("Phase Plane of currents I1 (circuit 1) and I2 (circuit 2)")
xlabel("I1 (amperes)")
ylabel("I2 (amperes)")



function [i1, i2] = circuit(t)
    C1 = 1;
    C2 = 1;
    lambda1 = 0.5 + (sqrt(5) / 2);
    lambda2 = 0.5 - (sqrt(5) / 2);
    V1 = [1, (lambda1 - 2)];
    V2 = [1, (lambda2 - 2)];
    
    i1 = C1 * V1(1) * exp(lambda1 * t) + C2 * V2(1) * exp(lambda2 * t);
    i2 = C1 * V1(2) * exp(lambda1 * t) + C2 * V2(1) * exp(lambda2 * t);
end