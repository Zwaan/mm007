function dw = rigid(t,w)
dw = zeros(3,1);
dw(1) = w(2) * w(3);
dw(2) = -w(1) * w(3);
dw(3) = -0.51 * w(1) * w(2);