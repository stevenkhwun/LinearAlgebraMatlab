function [We ypredict]=drdexpregwplot(X,Y,xpredict,xpn,titl,xlbl,ylbl)
m=length(X);
A=[ones(m,1) X];
Atmp1=A'*A; Atmp2=A'*log(Y);
format long
We=Atmp1\Atmp2

xmin=min(X);xmax=max(X);

x=xmin:1:xmax;
ye=exp(We(1))*exp(We(2)*x);

plot(x,ye,X,Y,'k*');grid;

title(titl);xlabel(xlbl);ylabel(ylbl);shg
pause
ypredict=exp(We(1))*exp(We(2)*xpredict);
format bank
disp(['       ',xpn,'     model prediction'])
disp([xpredict ypredict])
format
return