% Javier Pellejero Ortega

function [sol] = MetodoJacobi(A, b, it, prec)
n = size(A, 1);
r = 1:n;
sol = 1:n;
d = 1:n;
for i = 1:n
    if (A(i,i) == 0)
       error('No se puede aplicar el metodo de Jacobi'); 
    end
end
for k = 1:it
    for i = 1:n
        r(i) = b(i) - A(i,1:n) * sol';
        d(i) = (r(i) / A(i,i));
    end
    sol = sol + d;
    if (norm(r) < prec * norm(b))
       break;
    end
end