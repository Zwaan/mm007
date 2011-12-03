function dydt = vdp(t,y)
dydt = [ y(2) ; (1-y(1)^2)*y(2)-y(1) ] ;