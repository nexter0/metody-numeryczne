clear;
clc;

//Dane wejściowe
n = 3
a = -0.5
b = 2*%pi
xv = [0; %pi/4; %pi/2; 3*%pi/2]
xb = 9*%pi/10
r = 2
function y = f(x)
    y = sin(x)
endfunction
//***

// wartosc n+1 (czwartej) pochodnej
function y = fp(x)
    y = sin(x)
endfunction

function y = omega(x, xv, n)
    for i = 0:n
        v(i + 1) = x - xv(i + 1)
    end
    y = prod(v)
endfunction

function y = fi(x, j, n)
    for i = 0:n
        if i <> j then
            v(i + 1) = x - xv(i + 1)
        end
    end
    
        for i = 0:n
            if i <> j then
                v2(i + 1) = xv(j) - xv(i + 1)
            end
    end
  
    licznik = prod(v)
    mianownik = prod(v2)
    
    y = licznik / mianownik
endfunction

for i = 0:n
    yv(i + 1) = f(xv(i + 1))
end
