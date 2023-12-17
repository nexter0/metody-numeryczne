clear
clc

r = 4
a = -1
b = 1
h = 0.001

function y = f(x)
    y = sin(x) + (x + 1) * (x + 1)
endfunction

function y = fp(x, h)
    y = (f(x + h) - f(x)) / h
endfunction

function y = fpp(x, h)
    y = (fp(x + h, h) - fp(x, h)) / h
endfunction

disp("r:", r, "a:", a, "b:", b)

function y = xn_dist(X, n)
    y = abs(X(n) - X(n - 1)) * abs(f(X(n))) / (abs(f(X(n)) - f(X(n - 1))))
endfunction

function y = new_sol(X, n)
    // n jest numerem nowego przybliżenia
    y = X(n - 1) - f(X(n - 1)) * (X(n - 1) - X(n - 2)) / (f(X(n - 1)) - f(X(n - 2)))
endfunction

if f(a) * f(b) < 0 && fp(a, h) * fp(b, h) > 0 && fpp(a, h) * fpp(b, h) > 0 then
    // wybór punku początkowego
    if fp(a, h) * fpp(a, h) < 0 then
            x(1) = b
            x(2) = a
        else
            x(1) = a
            x(2) = b
        end
        n = 2

        disp("x_-1 = " + string(x(1)))
        disp("x_0 = " + string(x(2)))
        
    while xn_dist(x, n) > 10^(-r)
        x(n + 1) = new_sol(x, n + 1)
        n = n + 1

        disp("x_" + string(n - 2) + " = " + string(x(n)))
    end
    
    disp("Osiagnieto dokladnosc rzedu: " + string(10^(-r)))
else
    disp("Założenia nie spełnione w podanym przedziale.")
end
