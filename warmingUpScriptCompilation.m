n = length(day);
M = [ones(n,1),day];
f = [0 0 1 1]';
LB = [-inf -inf 0 0];
UB = [];
A = [[M, -ones(n,1), zeros(n,1)]; [-M, zeros(n,1), -ones(n,1)]];
b = [tempC; -tempC];

params = linprog(f, A, b, [], [], LB, UB);
coefSetOne = params(1:2);

n = length(day);
M = [ones(n,1),day];
f = [0  0 0 0 0 0 1 1]';
LB = [-inf -inf 0 0];
UB = [];
A = [[M,cos(2*pi*day/365.25),sin(2*pi*day/365.25),cos(2*pi*day/(365.25*10.7)),sin(2*pi*day/(365.25*10.7)),-ones(n,1),zeros(n,1)];[-M,cos(2*pi*day/365.25),sin(2*pi*day/365.25),cos(2*pi*day/(365.25*10.7)),sin(2*pi*day/(365.25*10.7)),zeros(n,1),-ones(n,1)]];
b = [tempC; -tempC];

params = linprog(f, A, b, [], [], LB, UB);
coefSetTwo = params(1:2:3:4:5:6);

p = plot(day, tempC, '.', day, -coefSetOne(1) + coefSetTwo(1) + coefSetTwo(2) * day + coefSetTwo(3) * (cos(2 * pi * day / 365.25)) + coefSetTwo(4) * (sin(2 * pi * day / 365.25)) + coefSetTwo(5) * (cos(2 * pi * day / (365.25 * 10.7))) + coefSetTwo(6) * (sin(2 * pi * day / (365.25 * 10.7))), day, -coefSetOne(1) + coefSetOne(2) * day)
p(2).LineWidth = 1.25;
p(3).LineWidth = 1.25;
title 'Average Temperature Trend from May 1st, 1952 to Oct. 17th, 2013'
xlabel 'Days since May 1st, 1952'
ylabel 'Average Temperature (C)'
