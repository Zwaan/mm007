function [P,S]=vandermonde(X,Y)
%Solves set of equiations using matlab's builtin vander function. It uses
%sligthly other conventions then discribed in the course. Notes in the
%course are not compatible with matlabs handling for polynomals.
%X: rowvector of X-values e.g. [3 4 5 6]
%Y: rowvector of Y-values e.g. [66 77 88 123]
%P: rowvector with polynomal expression
%S: symbolic representation
P=vander(X)\Y';%solves system
S=poly2sym(P);%exports poly coefficients to pretty equiation.
end
