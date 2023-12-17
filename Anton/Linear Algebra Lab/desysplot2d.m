function desysplot2d(a,y0,t0,tmax)
%
% dr. d's de system plotter. allows real or complex solutions (actually,
% matlab allows for complex cases)
% on input: A,  DE system coefficient matrix from system of two coupled
%               first order differential equations
%           Y0, initial data, vector of length two of initial data at t0.
% on output: none
% other routines called: none, other than standard matlab m-files.
% example calling sequence:
%
%   A=[-1.5 0.5;1 -1]; Y0=[2.6 4.4]';
%   desysplot2d(A,Y0,0,5)
%
% written by d. seth, wtamu, 9/10/12. revised to allow arguments and
% multicolored plots 9/22/13.
%
newplot
if nargin < 3
    t0 = 0;
    tmax = 8;
 end
    tstep = (tmax-t0)/100;
    [u,d]=eig(a)
    c = diag([exp(d(1,1)*t0) exp(d(2,2)*t0)])*u\y0
    t = t0 : tstep : tmax;
    x1 = c(1)*exp(d(1,1)*t)*u(1,1) + c(2)*exp(d(2,2)*t)*u(1,2);
    x2 = c(1)*exp(d(1,1)*t)*u(2,1) + c(2)*exp(d(2,2)*t)*u(2,2);
    if isreal(d) == 0
       x1rplot = real(x1);
       x2rplot = real(x2);
       plot(t,x1rplot,'b',t,x2rplot,'m');grid;shg
    else
       plot(t,x1,'b',t,x2,'m');grid;shg
    end
    title('Plots of y1(t), y2(t) vs. t as separate functions')
    n=length(t);
    pause
    x1max=max(real(x1));
    x2max=max(real(x2));
    x1min=min(real(x1));
    x2min=min(real(x2));
    axis([x1min x1max x2min x2max])
    newplot;hold on
    title('Parametric plot of the ordered pairs (y1(t),y2(t)), t=t0,tmax')
    grid
    color2 = 'b.';
    for i=1:n
       if isreal(d) == 0
          plot(x1rplot(i),x2rplot(i),color2);shg
       else   
          plot(x1(i),x2(i),color2);shg
       end
       
        pause(.1)
        if i==20
            pause
            color2 = 'm.';
        end
        if i==40
            pause
            color2 = 'g.';
        end
        if i == 60
            pause
            color2 = 'c.';
        end
    end
    shg
    hold off
    return