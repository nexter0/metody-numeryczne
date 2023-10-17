clear;
clc;

//Dane wejściowe
n = 2
a = -0.5
b = 2*%pi
xv = [0; %pi/4; %pi/2; 3*%pi/2]
xb = 9*%pi/10
r = 2
function y = f(x)
    y = sin(x)
endfunction
//***

for i = 0:(n + 1)
    yv(i + 1) = f(xv(i + 1))
end

