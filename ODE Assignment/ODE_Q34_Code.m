% UPI: sxie727
% ID: 641748774
% This system plots against time the currents I1 and I2
% between times t=0s and t=10s in 0.1s intervals
% utilizing numerical solver ODE45
time = 0:0.1:10;
initial = [0, 0];
[t, I] = ode45(@difEq, time, initial);
I1 = I(:, 1);
I2 = I(:, 2);
plot(t, I1, "r-o", t, I2, "b-*")
title("Currents I1 (circuit 1) and I2 (circuit 2) against time t, approximated by ode45")
xlabel("t (seconds)")
ylabel("I (amperes)")
legend("I1", "I2")


function Id = difEq(t, I)
    Id = zeros(2, 1);
    Id(1) = - I(1) - I(2) + 0.5 * sin(t);
    Id(2) = I(1) + 2 * I(2) - 0.5 * sin(t);
end