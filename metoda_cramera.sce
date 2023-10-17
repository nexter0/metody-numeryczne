clear;
clc;

M = [1 2
     1 1]
        
E = [0 0
     0 0]
     
b = [4.653
     3.428]

function y = wz2(C)
    y = C(1, 1) * C(2, 2) - C(2, 1) * C(1, 2)
endfunction

function Y = msum(C, D)
    Y = C + D
endfunction

function Y = cmk(ME, b, k)
    Y = ME
    Y(:, k) = b 
endfunction

ME = msum(M, E)
detME = wz2(ME)

if detME <> 0 then
    detME1 = wz2(cmk(ME, b, 1))
    detME2 = wz2(cmk(ME, b, 2))
    x1 = detME1 / detME
    x2 = detME2 / detME
    x = [x1; x2]
    disp(x)
else    
    disp("Wyznacznik zerowy")
end
