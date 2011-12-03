% Dit script steunt op de secant methode (quasi-newton methode)
% fun 		: bestandsnaam van de functie (@) of inline
% x0		: startwaarde
% x1        : 2de startwaarde
% tol    	: Tolerantie voor convergentie test
% max	    : Maximum aantal iteraties
% Geeft ook aan of functie geconvergeerd is of niet!

function [x,y] = secant(fun,x0,x1,tol,max)
x(1) = x0;
x(2) = x1;
y(1) = feval(fun,x(1)); 
y(2) = feval(fun,x(2));
    for i = 3 : max
        x(i) = x(i-1) - y(i-1)/((y(i-1)-y(i-2))/(x(i-1)-x(i-2))); 
        y(i) = feval(fun,x(i));
        if abs(x(i) - x(i-1)) < tol
            disp('Secant methode is geconvergeerd'); 
            break;
        end
        if i== max
            disp('Nulpunt niet gevonden');
        end
    end
n = length(x); 
k = 1:n; 
out = [k' x' y'];   % k: teller; x: x-waarde; y: overeenkomstige y-waarde
disp(out);