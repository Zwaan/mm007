function X = jacobi(A,B,X0,eps,max)
% Dit script is gebasseerd op de Jacobi methode (HB p45)
% Maken van de matrices T en K
    [n,m] = size(A);
    T = -A;
    for i = 1:n
        T(i,i) = 0;
    end
    for i = 1:n
        T(i,:) = T(i,:)/A(i,i);    
    end
    for i = 1:n
        K(i,1) = B(i)/A(i,i)
    end
% Start van iteraties
X_old = X0;
i = 1;
while (i <= max)
    X_new = T * X_old + K;
    if norm(X_new - X_old) <= eps
        X = X_new;
        disp('Convergentie')
        return;
    else
        X_old = X_new;
    end
    disp([i X_new']);
    i = i + 1;
end
disp('Divergentie');
X = X_new;
end