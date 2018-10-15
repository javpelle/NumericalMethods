% Javier Pellejero Ortega

function [gauss, permuta] = EliminacionGaussiana(A)
    n = size(A,1);
    permuta = 1:n;
    gauss = A;
    for i = 1:n - 1
        [maxi,pos] = max(abs(gauss(permuta(i:n), i)));
        pos = pos + i - 1;
        if (maxi == 0)
            error('No se puede aplicar eliminacion gaussiana');
        end
        aux = permuta(i);
        permuta (i) = pos;
        permuta(pos) = aux;
        for j = i + 1: n
            gauss(permuta(j), i) = gauss(permuta(j), i) / gauss(permuta(i), i);
            gauss(permuta(j), i + 1:n) = gauss(permuta(j), i + 1:n) - gauss(permuta(i), i + 1:n)*gauss(permuta(j), i);
        end
    end