% Javier Pellejero Ortega

function [sol] = MetodoRelajacion(A, b, w, it, prec)
n = size(A, 1);
r = 1:n;
sol = 1:n;
d = 1:n;
for k = 1:it
    for i = 1:n
        r(i) = b(i) - A(i,1:n) * sol';
        d(i) = w * (r(i) / A(i,i));
        sol(i) = sol(i) + d(i);
    end
    if (norm(r) < prec * norm(b))
       break;
    end
end