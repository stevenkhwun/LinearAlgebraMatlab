function [Wp ypredict]=drdsinregwplot(X,Y,xpredict,xpn,titl,xlbl,ylbl)
m=length(X);
A=[ones(m,1) sin(2*pi*X/12) cos(2*pi*X/12)];
Atmp1=A'*A; Atmp2=A'*Y;
format long
Wp=Atmp1\Atmp2

xmin=min(X);xmax=max(X);
step=(xmax-xmin)/100;
x=xmin:step:xmax;
yp=Wp(1)+Wp(2)*sin(2*pi*x/12)+Wp(3)*cos(2*pi*x/12);

plot(x,yp,X,Y,'k*');grid;

title(titl);xlabel(xlbl);ylabel(ylbl);shg
pause
ypredict=Wp(1)+Wp(2)*sin(2*pi*xpredict/12)+Wp(3)*cos(2*pi*xpredict/12);
format bank
disp(['       ',xpn,'     model prediction'])
disp([xpredict ypredict])
format
return