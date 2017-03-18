n = length(day);
M = [ones(n,1),day]
f = [0 0 1 1]'
LB = [-inf -inf 0 0];
UB = []
A = [
        [M,    
        cos(2*pi*day/365.25),
        sin(2*pi*day/365.25),
        cos(2*pi*day/(365.25*10.7)),
        sin(2*pi*day/(365.25*10.7)),
        -ones(n,1),zeros(n,1)];
        [-M,
        cos(2*pi*day/365.25),
        sin(2*pi*day/365.25),
        cos(2*pi*day/(365.25*10.7)),
        sin(2*pi*day/(365.25*10.7)),
        zeros(n,1),-ones(n,1)]
    ];
b = [tempC; -tempC];