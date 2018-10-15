% Javier Pellejero Ortega

function [sol, B] = FactorizacionCholesky(A, b)
    n = size(A, 1);
    sol = 1:n;
	B = zeros(n);
    if (nargout == 2)
        if (A(1,1) <= 0)
            error('No se puede aplicar factorización Cholesky');
        end
        B(1,1) = sqrt(A(1,1));
        B(2:n,1) = A (2:n,1) / B(1,1);
        for i = 2:n
			B(i,i) = A(i,i) - sum(B(i,1: i - 1) .^ 2);
            if (B(i,i) <= 0)
                error('No se puede aplicar factorización Cholesky');
            end
			B(i,i) = sqrt(B(i,i));
			for j = i + 1:n
				B(j,i) = (A (j,i) - B(i,1: i - 1) * B(j,1: i - 1)') / B(i,i);
			end
        end
    end
    w = 1:n;
    for i = 1:n
        w(i) = (b(i) - B(i,1 : i-1) * w(1 : i-1)') / B(i,i);
    end
    for i = n:-1:1
        sol(i) = (w(i) - B(i + 1: n, i)' * sol(i + 1: n)') / B(i,i);
    end