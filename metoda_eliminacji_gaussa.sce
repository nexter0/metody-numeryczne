clc
clear

/* = [2 1 -1 5
     3 -2 2 -3
     5 5 -1 2
     2 -1 1 -3]
 
y = [1; 2; -1; 4]*/

X = [0 1 1
 1 2 1
 1 1 3]
 
y = [1; 2; -1]
 
sizeA = size(X)
sizeB = size(y)
n = sizeB(1)


if sizeA(1) == sizeA(2) && sizeA(2) == sizeB(1) then
     
     for i = 1:n
         for j = 1:n
             A(i, j, 1) = X(i, j, 1)
         end
     end
     
     for i = 1:n
         b(i, 1, 1) = y(i, 1, 1)
     end
     
     for k = 2:n
         for i = 1:(k-1)
            for j = 1:n
                A(i, j, k) = A(i, j, k-1)
            end
         end
         
         for i = 1:(k-1)
             b(i, 1, k) = b(i, 1, k-1)
         end
         
         for i = k:n
            for j = 1:(k-1)
                A(i, j, k) = 0
            end
         end
         
         for i = k:n
            for j = k:n
                if A(k-1, k-1, k-1) == 0 then
                    disp("Dzielenie przez 0. Etap eliminacji nie powiodl sie.")
                    abort
                end
                A(i, j, k) = A(i, j, k-1) - A(k-1, j, k-1) * A(i, k-1, k-1) / A(k-1, k-1, k-1)
            end
         end
         
         for i = k:n
            if A(k-1, k-1, k-1) == 0 then
                disp("Dzielenie przez 0. Etap eliminacji nie powiodl sie.")
                abort
            end
                b(i, 1, k) = b(i, 1, k-1) - b(k-1, 1, k-1) * A(i, k-1, k-1) / A(k-1, k-1, k-1)
         end         
         
     end
     
     xi(n) = b(n, 1, n) / A(n, n, n)
     
     for i=(n-1):-1:1
         suma = 0
         for j=(i+1):n
             suma = suma + A(i, j, n) * xi(j)
         end
         xi(i) = (b(i, 1, n) - suma) / A(i, i, n)
     end
     
     for i=1:n
         disp("x_" + string(i) + " = " + string(xi(i)))
     end
else
    disp("Nieprawidlowe wymiary macierzy.")
end
