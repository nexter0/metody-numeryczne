clear
clc
clf

N = 9
s = 4
y = [-1.12, -1.57, -0.73, -0.21, 0.11, 0.31, 0.51, -1.73, 1.24]
lp = 500

function y = Fs(x, a, b, s)
    for j = 1:s
        sum_v(j) = a(j+1) * cos(j * x) + b(j) * sin(j * x)
    end
    y = a(1) / 2 + sum(sum_v)
endfunction

if s <= floor((N - 1) / 2) then
    for i = 1:N
        x(i) = 2 * %pi * (i - 1) / N
    end
    
    for j = 1:s+1
        for i = 1:N
            sum_v(i) = y(i) * cos((j-1) * x(i))
        end
        a(j) = sum(sum_v) * 2 / N 
    end
    
    for j = 1:s
        for i = 1:N
            sum_v(i) = y(i) * sin(j * x(i))
        end
        b(j) = sum(sum_v)* 2 / N 
    end
    
    x_plot = linspace(-20, 20, lp)
    for i = 1:lp
        y_plot(i) = Fs(x_plot(i), a, b, s) 
    end
        
    plot(x_plot, y_plot)
    plot(x, y, 'k.')
end
