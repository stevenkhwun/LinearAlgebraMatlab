function viewlincomb(u1,u2,c1,c2,lots,xshift,yshift)
%
% dr. dan's matlab file to visualize linear combinations of vectors
% Goals: Given two vectors, u1,u2 and scalars c1,c2.
%  I. To allow visualization of the linear combination of 2 vectors, e.g.,
%     w = c1*u1 + c2*u2
%  II.To visualize many (lots) random linear combinations of user supplied
%     vectors u1 and u2. If lots is not given, 200 random linear
%     combinations of u1 and u2 will be generated and plotted on the same
%     graphics window. Only the heads, terminal point, are plotted.
%  III. To visualize the parallelogram law for addition of two vectors.
%     This happens when c1=c2=+1.
% Calline sequence, depending on goal(s):
%     viewlincomb(u1,u2,c1,c2,lots,xshift,yshift)
% on input:
%  u1 - the first vector
%  u2 - the second vector
%  c1 - the coefficient of u1
%  c2 - the coefficient of u2
%  lots - the number of random linear combinations of u1 and u2. if lots is not
%       given, it will have a default value of 100. each linear combination will
%       be displayed with a triangle. If the user wishes to view only the linear
%       combination for the given c1,c2, any negative value should be input
%       for lots (e.g., lots=-1).
%  xshift, yshift - allow the vectors to be displayed with the tails at the
%                   point (xshift,yshift).
%                   if xshift, yshift not entered, the vectors will be
%                   displayed as vectors originating at (0,0).
% on output:
%  u1, u2, and the resultant vector w = c1*u1+c2*u2 plotted together
%
% examples: Note: As in most MATLAB help files, if you highlight, copy,
%            and paste examples into the MATLAB command line they work, 
%
%  example 1. linear combination of two vectors for given weights (scalars)
%             (centered at (0,0)). No random linear combinations.
%
%    u1 = [4 -2]'; u2 = [2 -5]' ; 
%    c1 = 2; c2 = 1.3; lots = -11;
%    viewlincomb(u1,u2,c1,c2,lots)
%
%  example 2. linear combination of two vectors for given weights (scalars)
%             with tails at the point (-3,6). No random linear combinations.
%
%    u1=[6 3]'; u2=[-3 5]';  
%    c1 = 2; c2 = 3; lots = -11;
%    viewlincomb(u1,u2,c1,c2,lots,-3,6)
%    
%  example 3. linear combination of two vectors for given weights (scalars)
%             (centered at (0,0)). 300 random linear combinations are
%             generated and plotted along with u1, u2 and w=c1*u1+c2*u2.
%
%    u1 = [4 -2]'; u2 = [2 -5]' ; 
%    c1 = 2; c2 = 3;
%    viewlincomb(u1,u2,c1,c2,300)
%    
%  example 4. 100 randon linear combinations of two vectors
%             (centered at (0,0)). Each of the random linear combinations
%             indicated with a triangle at the vector head.
%
%    u1 = [4 -2]'; u2 = [2 -5]' ; 
%    viewlincomb(u1,u2);
%
%  alternately, to get 100 (default) or 178 random linear combinations:
%             viewlincomb(u1,u2,0,0);
%                   or lots = 178 linear combinations:
%             viewlincomb(u1,u2,0,0,178);
%
% written by d. seth, wtamu, 220313, revised on 110413 to allow multiple
% vectors, edited 110413 to add example 4.
%
clf
if nargin < 3
    c1 = 0; c2 = 0;
end
if nargin < 5
    lots = 100;
end
if nargin < 6
    xshift=0;
    yshift=0;
end
grid on
hold on
[mu,nu]=size(u1);
if mu==1
    u1=u1';
end
[mu,nu]=size(u2);
if mu==1
    u2=u2';
end
if c1~=0 & c2~=0
w = c1*u1 + c2*u2;
A = [u1 u2 w];
else
    A=[u1 u2];
end

% code to plot vectors placed in an array, the vectors, u,v,w=c1*u+c2*v will
% be placed into A to be plotted. u,v in blue, w in green

[m,n]=size(A);

%  determine the maximum vector length, of u,v,w, to build a plot window.

    nvecs = n;

    for i=1:nvecs
        hpick(i)=norm(A(:,i));
    end
    h = 1.25*(max(hpick));
    if h < 10
        h = 10;
    end

%  set the plot window, centered at (xshift,yshift) with dimension the
%  maximum dimension 1.25 by 1.25 of maximum vector length.

    axis([xshift-h xshift+h yshift-h yshift+h])
    t1=num2str(c1);t2=num2str(c2);
    plotlabelstr=['plot of V1 (blue), V2 (magenta), and V3 = ',t1,'* V1 +',t2,'*V2 (green)'];
    title(plotlabelstr)

    if c1==0 & c2==0
        nvecs = 2;
    end
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
 if i==1
     color = 'b';
     color2 = 'b.';
 end
 if i==2
     color = 'm';
     color2 = 'm.';
 end
 if i==3
     color = 'g';
     color2 = 'g.';
 end
    plot(x,y,color,x(1),y(1),color2)
    fill(xhead,yhead,color)
    vlabel=vnew'+h/10*[cos(th) sin(th) ];
    vname=['V',num2str(i)];
    text(vlabel(1),vlabel(2),vname);
 %   grid on
    xlabel('press enter to view the next vector or to terminate the program')
 %   t1=num2str(c1);t2=num2str(c2);
 %   plotlabelstr=['plot of u1 (blue), u2 (magenta), and w = ',t1,'* u1 +',t2,'*u2 (green)'];
 %   title(plotlabelstr)
    shg
   % if i~= nvecs
%        pause
   % end

    %  check if both coefficients are one, if so, the parallelogram rule
    %  for the sum of vectors is displayed.
    
    if c1==1 & c2==1 & (i==1 | i==2)
        if i==1
            xshift2=xshift+u2(1);
            yshift2=yshift+u2(2);
            x2=[xshift2 xshift2+u1(1)];
            y2=[yshift2 yshift2+u1(2)];
            vnew2=u1+[xshift2 yshift2]';
        end
        if i==2
            xshift2=xshift+u1(1);
            yshift2=yshift+u1(2);
            x2=[xshift2 xshift2+u2(1)];
            y2=[yshift2 yshift2+u2(2)];
            vnew2=u2+[xshift2 yshift2]';
        end
    
    %  create the head of i th vector of A
    
        [th,r] = cart2pol(v(1),v(2));
        vheadr2=vnew2'-h/20*[cos(th+pi/8) sin(th+pi/8) ];
        vheadl2=vnew2'-h/20*[cos(th-pi/8) sin(th-pi/8) ];
        xhead2=[vheadr2(1) vnew2(1) vheadl2(1)];
        yhead2=[vheadr2(2) vnew2(2) vheadl2(2)];
        plot(x2,y2,color,x2(1),y2(1),color2)
        fill(xhead2,yhead2,color)
    vlabel2=vnew2'+h/6*[cos(th) sin(th) ];
    vname=['V',num2str(i)];
    text(vlabel2(1),vlabel2(2),vname);
    end
  pause  
 end

 %  all done, back to matlab
 
 if lots<0
     return
 end
 
 %  set new window to fit lots of linear combinations of u1, u2.
 
 %   hlots = 5.5*max(norm(u1),norm(u2));
 %   axis([xshift-hlots xshift+hlots yshift-hlots yshift+hlots])
    xlotslabel=['press enter to view (most of) the ',num2str(lots), ' random linear combinations of V1,V2'];
    xlabel(xlotslabel),shg,pause

    % find 200 random pairs of coefficients for w=c1*u1+c2*u2, with the
    % coefficients in the interval [-5,5]
    
 c = -h/4 + h/2*rand(2,lots);
 for i=1:lots
     w = c(1,i)*u1 + c(2,i)*u2 + [xshift yshift]';
     plot(w(1),w(2),'r^')
     pause(.05)
     shg
 end
    xendlabel=['press enter to terminate the program'];
    xlabel(xendlabel),shg,pause
hold off
return