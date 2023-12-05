clc
clear
clf

m = 2
n = 8
function y = f(x)
    y = exp(sin(x))
endfunction

x = [-1.1; -0.83; -0.57; -0.28; -0.02; 0.16; 0.47; 0.95; 1.23]
y = []

for i = 0:n
    y(i + 1) = f(x(i + 1))
end

g = []
for j = 0:2*m
    suma = 0
    for i = 0:n
        suma = suma + x(i + 1)^j
    end
    g(j + 1) = suma
end

p = []
for j = 0:m
    suma = 0
    for i = 0:n
        suma = suma + (y(i + 1) * x(i + 1)^j)
    end
    p(j + 1) = suma
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

x_plot = linspace(x(1) - 0.1, x(n + 1), 100)

for i = 0:99
    y_plot(i + 1) = F(x_plot(i + 1))
end

plot(x_plot, y_plot)

for i = 0:n
    y_plot(i + 1) = F(x(i + 1))
end

plot(x, y, 'r+')

disp(a)
disp(F(2))
