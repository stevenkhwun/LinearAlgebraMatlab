function [W1 ypredict]=drdlinregwplot(X,Y,xpredict,titl,xlbl,ylbl)
m=length(X);
A=[ones(m,1) X];
Atmp1=A'*A; Atmp2=A'*Y;
format long
W1=Atmp1\Atmp2

xmin=min(X);xmax=max(X);

x=xmin:1:xmax;
y1=W1(1)+W1(2)*x;

plot(x,y1,X,Y,'k*');grid;

title(titl);xlabel(xlbl);ylabel(ylbl);shg
pause
ypredict=W1(1)+W1(2)*xpredict;
format bank
disp('year     model prediction')
disp([xpredict ypredict])
format
return