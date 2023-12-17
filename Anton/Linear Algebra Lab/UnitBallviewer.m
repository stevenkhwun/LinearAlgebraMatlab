function UnitBallviewer(ntype)
%
% this routine plots 678 random unit vectors of norm type ntype.
% on input:
%   ntype   integer unless using the infinity norm
%           2 - the usual Euclidean norm
%           1 - the one norm (sum of the absolute values)
%           -1 - the infinity norm (maximum absolute value)
%           others - the n norm (nth root of the sum of elements raised 
%                       to the nth power)
% on return:
%   none
% calling sequence:  UnitBallviewer(ntype)
% example calling sequence:   to view the unit ball of the 3-norm enter
%
%    UnitBallviewer(3)
%
% written by D. Seth, WTAMU, 2 Oct. 2013.
%

clf
grid on
hold on
axis square
nvecs = 678;
a=rand(2,nvecs)-.5;
if ntype == -1
 x1=[0 1];z=[0 0];y2=[0 1];x3=[0 -1];y4=[0 -1];
 plot(x1,z,'b',z,y2,'b',x3,z,'b',z,y4,'b');
for i=1:nvecs
    a(:,i)=a(:,i)/norm(a(:,i),inf);
    x=[0 a(1,i)];y=[0 a(2,i)];plot(x,y);
end
else
 x1=[0 1];z=[0 0];y2=[0 1];x3=[0 -1];y4=[0 -1];
 plot(x1,z,'b',z,y2,'b',x3,z,'b',z,y4,'b');
for i=1:nvecs
    a(:,i)=a(:,i)/norm(a(:,i),ntype);
    x=[0 a(1,i)];y=[0 a(2,i)];plot(x,y);
end
end
if ntype == -1
    title('The unit ball for the infinity-norm.')
else
    title(['The unit ball for the ' num2str(ntype) '-norm.'])
end
shg
grid off
hold off
return