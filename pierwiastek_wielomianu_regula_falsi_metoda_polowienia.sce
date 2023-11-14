clc;
clear;

a = 0.5 
b = 2
r = 4
n = 50
h = 0.001

function y = f(x)
    y = (x^2 - 3) * sin(x) 
endfunction

function y = fp(x, h)
    y = (f(x + h) - f(x)) / h
endfunction

function y = fpp(x, h)
    y = (fp(x + h, h) - fp(x, h)) / h
endfunction

excd = 0
wi = 1
x(wi) = a

if f(a) * f(b) < 0 then
    while ~(fp(a, h) * fp(b, h) > 0 && fpp(a, h) * fpp(b, h))
        if ~(wi < n) then
            excd = 1
            break
        end
        wi = wi + 1
        x(wi) = (a + b) / 2
        if abs(x(wi) - x(wi - 1))<10^(-r) then
            excd = 2
            break
        end
        if f(a)*f(x(wi)) < 0 then
            b = x(wi)
        else
            a = x(wi)
        end
    end
    
    if excd == 0 then
        wi = wi + 1
        if fp(a, h) * fpp(a, h) < 0 then
            c = a
            x(wi) = b
        else
            c = b
            x(wi) = a
        end
    
        while wi < n
            x(wi) = x(wi - 1) - f(x(wi - 1)) * (c - x(wi-1)) / (f(c) - f(x(wi - 1)))
            if abs(x(wi) - x(wi - 1))<10^(-r) then
                excd = 2
                break
            end
        end
    end
end

disp(x)
