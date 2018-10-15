% Javier Pellejero Ortega

function [sol] = SistemasTridiagonales(A, d)
    n = size(A, 1);
    m = 1:n;
    g = 1:n;
    if (A(1,1) == 0)
        error('No se puede solucionar como sistema tridiagonal');
    end
    m(1) = A(1,1);
    g(1) = d(1) / m(1);
    for i = 2:n
       m(i) = A(i,i) - ((A(i-1,i) / m(i-1)) * A(i,i-1));
       if (m(i) == 0)
           error('No se puede solucionar como sistema tridiagonal');
       end
       g(i) = (d(i) - (g(i-1)*A(i,i-1))) / m(i);
    end
    sol(n) = g(n);
    for i = n - 1:-1:1
        sol(i) = g(i) - ((A(i, i + 1)/m(i)) * sol(i + 1));
    end