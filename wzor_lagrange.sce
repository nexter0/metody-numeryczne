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
ls = 100
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
        // zamiast warunku mozna dac:
        // v(j + 1) = 1
    end
    
        for i = 0:n
            if i <> j then
                v2(i + 1) = xv(j + 1) - xv(i + 1)
            end
            // zamiast warunku mozna dac:
            // v(j + 1) = 1
    end
    
    y = prod(v) / prod(v2)
endfunction

supr_xv = linspace(a, b, ls)'
for i = 1:ls
    supr_yv(i) = abs(fp(supr_xv(i)))
end
// supr_yv = abs(fp(supr_xv))
// M = sup
M = max(supr_yv)

err = M * abs(omega(xb, xv, n)) / factorial(n+1)

for i = 0:n
    yv(i + 1) = f(xv(i + 1))
end

if err < 10^(-r) then
    // Wzor interpolacyjny Lagranża
 for i=0:n;
        t(i+1) = yv(i+1) * fi(xb, i, n)
    end;
    Wn =sum(t);
    disp(Wn)
else
    disp("Blad zbyt duzy", err)
end
