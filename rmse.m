function rmse=rmse(F,X,Y)
% F: function inline or poly
% X: matrix with x values
% Y: matrix with y values
% bv: F=inline('x^2 + 3*x + 5');
% RMSE(F,[1 2 3],[1 2 5])
if strcmp(class(F),'double'); F=poly2sym(F);end%checks if poly and converts to symbolic
F=vectorize(F);%vectorizes F for dealing with matrices.
rmse=sqrt(mean((F(X)-Y).^2));%Application of formule.
end