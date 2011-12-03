function dudt = fex1(x,u)
dudt = [u(2) ;
        -(x+1).*u(2)+2*u(1)+(1-x.^2).*exp(-x) ;
        u(4) ;
        -(x+1).*u(4)+2*u(3) ];