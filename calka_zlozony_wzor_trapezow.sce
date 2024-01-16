clear
clc

function y = f(x)
    y = sin(x)
endfunction

a = 0
b = %pi
r = 8
nmax = 1000

S(1) = (b-a)/2 * (f(a)+f(b))

for n = 2:nmax
    h = (b-a)/n
    
    for i=1:(n+1)
        x(i) = a + (i-1) * h
    end
    
    for i=1:(n+1)
        y(i) = f(x(i))
    end
    
    suma = sum(y) - y(1) - y(n+1)
    S(n) = (h/2) * (y(1) + 2 * suma + y(n+1))
    
    if abs(S(n) - S(n-1)) < 10^(-r)
        disp(S(n))
        abort
    end
end
disp("Przekroczona liczba iteracji:", n)
