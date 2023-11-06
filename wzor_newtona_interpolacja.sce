clear;
clc;

/*
n = 7
x_ = %pi/2
xv = [1, 2, 3, 4, 5, 6, 7, 8]

function y = f(x)
    y = sin(x)
endfunction
*/


n = 5
x_ = 0
xv = [-3, -2, -1, 1, 2, 3]

function y = f(x)
    y = %e^x
endfunction


for i = 0:n
    yv(i + 1) = f(xv(i + 1))
end

// czy węzły są równoodległe, jeśli nie h = 0
h_temp = xv(2) - (1)
h = h_temp

for i = 1:n-1
    if xv(i + 2) - (i + 1) <> h then
        h = 0
        break
    end
end
// *********************************

function y = omega(x, xv, n)
    for i = 0:n
        v(i + 1) = x - xv(i + 1)
    end
    y = prod(v)
endfunction

ilorazy = zeros(n + 1, n + 1)
for i = 0:n
    ilorazy(i + 1, 1) = yv(i + 1)
end

if h == 0 then
    // ilorazy różnicowe
    for k = 1:n
        for i = 0:(n-k)
            ilorazy(i + 1, k + 1) = (ilorazy(i + 2, k) - ilorazy(i + 1, k)) / (xv(i + k+1) - xv(i+1))
        end
    end
    
    s = yv(1)
    
    Wnw(1) = ilorazy(1, 1)
    for i = 1:n
        Wnw(i + 1) = ilorazy(1 , i+1) * omega(x_, xv, i - 1)
    end 
else
    // różnice progresywne
        for k = 1:n
        for i = 0:(n-k)
            ilorazy(i + 1, k + 1) = (ilorazy(i + 2, k) - ilorazy(i + 1, k))
        end
    end 
    Wnw(1) = ilorazy(1, 1)
    for i = 1:n
        Wnw(i + 1) = (ilorazy(1 , i+1) * omega(x_, xv, i - 1) / (factorial(i) * h ^ i))
    end 
end
Wn = sum(Wnw)
disp("Wn =", Wn)
