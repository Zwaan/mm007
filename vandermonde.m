function [P,A]=vandermonde(X,Y)
% X=rowvector of X-values e.g. [3 4 5 6]
% Y=rowvector of Y-values e.g. [66 77 88 123]
A=vander(X)\Y';%solves system
P=poly2sym(A);%exports poly coefficients to pretty equiation.
end
