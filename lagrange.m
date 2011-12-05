function F = lagrange( X,Y )
%LAGRANGE 
%determs function via lagrange
%  X=rowvector of X-values e.g. [3 4 5 6]
%   Y=rowvector of Y-values e.g. [66 77 88 123]
syms x;
k=length(X);
Z(1,1:k)=x;%fills a vector with symbolic x's
T=Z-X;%retracts every symbolic x' with an x value
F=0;
for l=1:k
    NX(1,1:k)=X(l);%inserts loopvallue in number.
    N=NX-X;%retracts the 'loop X' with every X
    F=F+Y(l)*prod(T([1:l-1 l+1:k]))/prod(N([1:l-1 l+1:k]));
    %first argument of concatenate is the way of concatenate horizontally
    %or vertically.
    F=expand(F);
end
end