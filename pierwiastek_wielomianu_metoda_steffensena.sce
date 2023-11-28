a = -2
b = -0.8
r = 10
n = 100
h = 0.001

function y = f(x)
    y = x * exp(sin(x)) + cos(x) 
endfunction

function y = fp(x, h)
    y = (f(x + h) - f(x)) / h
endfunction

function y = fpp(x, h)
    y = (fp(x + h, h) - fp(x, h)) / h
endfunction

function y = g(x)
    y = (f(x + f(x)) - f(x)) / f(x)
endfunction

function y = errorf(X, n)
    y = abs(X(n) - X(n - 1)) * abs(f(X(n))) / (abs(f(X(n)) - f(X(n - 1))))
endfunction


if f(a) * f(b) < 0 && fp(a, h) * fp(b, h) > 0 && fpp(a, h) * fpp(b, h) > 0 then
    
    x = []
    wi = 1
    excd = 0

    if f(a) * fpp(a, h) > 0 then
        x(1) = a
    else
        x(1) = b
    end
    
    excd = -2
    while (wi < n)
                
        wi = wi + 1
        xl = x(wi - 1)
        x(wi) = x(wi - 1) - (f(xl) / g(xl))

        if errorf(x, wi) < 10^(-r)
            excd = 0
            break
        end
    end    
else
    excd = -1
end

select excd
    case -2 then
        disp("Osiagnieto maksymalna liczbe iteracji: " + string(n))
    case 0 then
        disp("Osiagnieto dokladnosc rzedu: " + string(10^(-r)))
        disp("x("+string(wi)+")="+string(x(wi)))
    case -1 then
        disp("Niespelnione zalozenia metody Steffensena")

end
