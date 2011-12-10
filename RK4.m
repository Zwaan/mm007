function [x,y] = RK4(f,x0,y0,h,n)
% f: function inline
% x0: start value x
% y0: start value y
% h: stepsize
% n: number of iterations requested
%vb:    funb=inline('-1.244e-4*Q','t','Q');
%       [t1,Q1]=RK4(funb,0,30,1000,50);
% RK4: -2.78<h*df/dQ<0
x = (x0 + h: h:x0+n*h);
k1 = h*feval(f,x0,y0);
k2 = h*feval(f, x0 + h/2, y0 + k1/2);
k3 = h*feval(f,x0+h/2,y0 + k2/2);
k4 = h*feval(f,x0 + h, y0 + k3);
y(1)= y0 + k1/6 + k2/3 + k3/3 + k4/6;
for i = 1 : n-1
   k1 = h*feval(f,x(i),y(i));
   k2 = h*feval(f, x(i) + h/2, y(i) + k1/2);
   k3 = h*feval(f,x(i) + h/2,y(i) + k2/2);
   k4 = h*feval(f,x(i) + h, y(i) + k3);
   y(i+1) = y(i) + k1/6 + k2/3 + k3/3 + k4/6;
end
x = [x0 x]; 
y = [y0 y];