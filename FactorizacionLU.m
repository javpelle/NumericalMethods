% Javier Pellejero Ortega

function [sol, LU] = FactorizacionLU(A, b)
    n = size(A, 1);
    sol = 1:n;
    if (nargout == 2)
        if (A(1,1) == 0)
            error('No admite factorizacion LU');
        end
        A(2:n,1) = A(2:n,1) / A(1:1);
        for i = 2 : n
            A(i,i) = A(i,i) - A(i,1:i - 1) * A(1:i - 1,i);
            if (A(i,i) == 0)
                error('No admite factorizacion LU');
            end
			for j = i + 1 : n
				A(i,j) = A(i,j) - A(i,1:i - 1) * A(1:i - 1,j);
                A(j,i) = A(j,i) - A(j,1:i - 1) * A(1:i - 1,i);
				A(j,i) = A(j,i) / A (i,i);
			end
        end
    end
    w = 1:n;
    w(1) = b(1);
    for i = 2 : n
        w(i) = b(i) - A(i,1 : i-1)*w(1 : i-1)';
    end
    for i = n:-1:1
    sol(i) = w(i) - A(i,i + 1: n)*sol(i + 1: n)';
    sol(i) = sol(i) / A(i,i);
    end
    LU = A;