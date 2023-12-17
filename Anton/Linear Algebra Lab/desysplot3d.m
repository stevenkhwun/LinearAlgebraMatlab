function desysplot3dv2(a,y0,t0,tmax)
    
%
% dr. d's de system plotter. allows real or complex solutions (actually,
% matlab allows for complex cases)
% on input: A,  DE system coefficient matrix from system of three coupled
%               first order differential equations
%           Y0, initial data, vector of length three of initial data at t0.
% on output: none
% other routines called: none, other than standard matlab m-files.
% example calling sequence:
%
%   A=[4 0 1;-2 1 0;-2 0 1]; Y0=[-1 1 0]';
%   desysplot3dv2(A,Y0,0,.5)
%
% written 9/10/12. revised to allow arguments and multicolored plots
% 9/22/13.
%
 newplot
 if nargin < 3
    t0 = 0;
    tmax = 1;
 end
    tstep = (tmax-t0)/100;
    [u,d]=eig(a)
    c = diag([exp(d(1,1)*t0) exp(d(2,2)*t0) exp(d(3,3)*t0)])*u\y0
    t = t0 : tstep : tmax;
    x1 = c(1)*exp(d(1,1)*t)*u(1,1) + c(2)*exp(d(2,2)*t)*u(1,2);
    x1 = x1 + c(3)*exp(d(3,3)*t)*u(1,3);
    x2 = c(1)*exp(d(1,1)*t)*u(2,1) + c(2)*exp(d(2,2)*t)*u(2,2);
    x2 = x2 + c(3)*exp(d(3,3)*t)*u(2,3);
    x3 = c(1)*exp(d(1,1)*t)*u(3,1) + c(2)*exp(d(2,2)*t)*u(3,2);
    x3 = x3 + c(3)*exp(d(3,3)*t)*u(3,3);
    if isreal(d) == 0
       x1r = real(x1);
       x2r = real(x2);
       x3r = real(x3);
       plot(t,x1r,'b',t,x2r,'g',t,x3r,'r');shg
    else
       plot(t,x1,'b',t,x2,'g',t,x3,'r');shg
    end
    
title('Plots of y1(t), y2(t), and y3(t) vs. t as separate functions')
grid
pause
newplot


       if isreal(d) == 0
          plot3(x1r,x2r,x3r,'b.');grid;shg
       else   
          plot3(x1,x2,x3,'b.');grid;shg
       end
  
    title('Parametric plot of the ordered triples (y1(t),y2(t),y3(t)), t=t0,tmax')
    pause
    
    shg
    hold off
    return