clc
clear
clf

m = 2
function y = f(x)
    y = exp(sin(x) + cos(x))
endfunction

a_r = -2
b_r = 3

lp = 1000
r = linspace(a_r, b_r, lp)

g = []
for j = 0:2*m
    g(j + 1) = inttrap(r, (r)^j)
end

function Y = fx_xj(x, j)
    for i = 1:lp
        Y(i) = f(x(i)) * x(i)^j
    end
endfunction

p = []
for j = 0:m
    p(j + 1) = inttrap(r, fx_xj(r, j))
end

select m
    case 0 then
    a(1) = p(1) / g(1)
    
    case 1 then
    licznik1 = -1 * g(3) * p(1) + g(2) * p(2)
    licznik2 = g(2) * p(1) - g(1) * p(2)
    mianownik = g(2)^2 - g(1) * g(3)
    a(1) = licznik1 / mianownik
    a(2) = licznik2 / mianownik
    
    case 2 then
    
    mianownik = g(3)^3 + g(1)*g(4)^2 + g(2)^2 * g(5) - g(3) * (2 * g(2) * g(4) + g(1) * g(5))
    
    licznik1 = g(4)^2 * p(1) - g(3) * g(5) * p(1) + g(2) * g(5) * p(2) + g(3)^2 * p(3) - g(4) * (g(3) * p(2) + g(2) * p(3))
    
    licznik2 = g(2) * g(5) * p(1)+ g(3)^2 * p(2) - g(3) * (g(4) * p(1) + g(2)*p(3)) + g(1) * (-1 * g(5) * p(2) + g(4) * g(3))
    
    licznik3 = g(3)^2 * p(1) - g(2) * g(4) * p(1) + g(1) * g(4) * p(2) + g(2)^2 * p(3) - g(3) * (g(2) * p(2) + g(1) * p(3))
    
    a(1) = licznik1 / mianownik
    a(2) = licznik2 / mianownik
    a(3) = licznik3 / mianownik
    
    else
    disp("Nieprawidlowa wartosc m")
end

function y = F(x)
    y = a(1)
    for i = 1:m
        y = y + a(i + 1) * x^i
    end
endfunction

x_plot = linspace(a_r - 0.1, b_r + 0.1, 100)

for i = 1:100
    y_plot(i) = F(x_plot(i))
    y_f_plot(i) = f(x_plot(i))
end

plot(x_plot, y_plot)

plot(x_plot, y_f_plot, "k")

disp(a)
disp(F(2))
