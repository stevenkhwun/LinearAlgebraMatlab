function viewvectors2(A,xshift,yshift)
%
% dr. dan's matlab file to display one or more vectors in a figure
% Purpose: to view one or more vectors together in a plotting window. The
% vector tails may originate at the origin or at any other point of the
% plane (xshift,yshift). calling sequence: viewvectors(A,xshift,yshift)
% on input:
%  A - a vector or set of vectors in 2-space. If A contains more than one
%  vector they should be entered into A by columns, as column vectors.
%  xshift, yshift - allow the vectors to be displayed with the tails at the
%                   point (xshift,yshift).
%                   if xshift, yshift not entered, the vectors will be
%                   displayed as vectors originating at (0,0).
% on output:
%  (none) vectors are plotted on the same graphics window
%
% examples:  Note: As in most MATLAB help files, if you highlight, copy,
%            and paste examples into the MATLAB command line they work, 
%
%  example 1. one vector (centered at, tail at, (0,0))
%
%    v = [2 -5]' ;
%    viewvectors(v)
%
%  example 2. three vectors with tails at the point (-3,6)
%
%    u=[6 3]'; v=[-3 5]'; w=u+v ;A=[u v w];
%    viewvectors(A,-3,6)
%
% written by d. seth, 032213, revised on 040413 to allow multiple vectors
% to be viewed with tails at a point other than the origin.
%
clf
if nargin < 2
    xshift=0;
    yshift=0;
end
hold on
color = 'b';
color2 = 'b.';
[m,n]=size(A);

%  determine the number of vectors in A, if more than 1.

if m==1
    A=A';
    nvecs = 1;
else
    nvecs = n;
end
if nvecs>1
    for i=1:nvecs
        hpick(i)=norm(A(:,i));
    end
    h = 1.5*(max(hpick));
else
    h = 1.5*norm(A);
end

%  set the plot window, centered at (xshift,yshift) with dimension the
%  maximum dimension 1.5 by 1.5 of maximum vector length.

    axis([xshift-h xshift+h yshift-h yshift+h])

 for i=1:nvecs
 
    % set coordinates for the i th vector of A
     
    v=A(:,i);
    x=[xshift xshift+v(1)];
    y=[yshift yshift+v(2)];
    vnew=v+[xshift yshift]';
    
    %  create the head of i th vector of A
    
    [th,r] = cart2pol(v(1),v(2));
    vheadr=vnew'-h/20*[cos(th+pi/8) sin(th+pi/8) ];
    vheadl=vnew'-h/20*[cos(th-pi/8) sin(th-pi/8) ];
    xhead=[vheadr(1) vnew(1) vheadl(1)];
    yhead=[vheadr(2) vnew(2) vheadl(2)];
    
    % plot the i th vector, its head (arrow) and tail (fat point)
    
    plot(x,y,color,x(1),y(1),color2)
    fill(xhead,yhead,color)
    grid on
    vlabel=vnew'+h/10*[cos(th) sin(th) ];
    vname=['V',num2str(i)];
    text(vlabel(1),vlabel(2),vname);
    shg
    xlabel('press enter to view the next vector or to terminate the program')
    pause
 end

 %  all done, back to matlab
 
hold off
return
