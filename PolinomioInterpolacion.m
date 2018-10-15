function PolinomioInterpolacion(fun, puntos)
    % fun es un string, puntos el vector de puntos a interpolar
    n = size(puntos, 1);
    funVec = vectorize(fun);
    funVec = eval(['@(x) ' funVec]);
    fPuntos = funVec(puntos);
    pol = 1:n;
    polinomio = fPuntos(1);
    for i = 1:n
        pol(i) = fPuntos(i);
    end
    for i = 2:n
        for j = 1:n - i + 1
            pol(j) = (pol(j + 1) - pol (j)) / (puntos(i + j - 1) - puntos(j));
        end
        newton = [newton 0] - [0 newton .* puntos(i - 1)];
        polinomio = polinomio + pol(i) * newton;
    end
    
    r = linspace(min(puntos), max(puntos), 100);
    plot(r, polyval(polinomio, r));
    fplot(funVec, -1, 2);