function viewprojection(a,b)
%
% Displays the orthogonal projection (shadow) of the first vector on the
% second vector along with the vectors. The argument list is two vectors,
% the first vector is labeled V1 on the plot and second vector is
% labeled V2 with the projection a vector along the line through V2.
% on input:
%   a  - the vector to be projected
%   b  - the vector that a is projected onto.
% on output:
%   none
% calling sequence:  viewprojection(a,b)
% example calling sequence:
%
%   u=[4 5]';v=[7 2]';
%   viewprojection(u,v)
%
%  written by D. Seth, wtamu, 151012. revised 221013 to include example.
%
clf
hold on
mab=max(norm(a,inf),norm(b,inf));

    h = 1.5*mab;
    
axis([-h h -h h])
%viewvectors(10*b);
%viewvectors(-10*b);shg
%pause
blong=10*b;blongm=-10*b;

    x=[0 blong(1)];
    y=[0 blong(2)];
%    plot(x,y,'c.',x(1),y(1),'c')
    x=[0 blongm(1)];
    y=[0 blongm(2)];
 %   plot(x,y,'c.',x(1),y(1),'c')

%viewvectors(a);shg
%text(a(1)+.5,a(2)+.8,'V1');
%pause
%  create the head of a
    
    [th,r] = cart2pol(a(1),a(2));
    vheadr=a'-h/20*[cos(th+pi/8) sin(th+pi/8) ];
    vheadl=a'-h/20*[cos(th-pi/8) sin(th-pi/8) ];
    xhead=[vheadr(1) a(1) vheadl(1)];
    yhead=[vheadr(2) a(2) vheadl(2)];
    
    % plot the vector a, its head (arrow) and tail (fat point)
    
    x=[0 a(1)];
    y=[0 a(2)];
    plot(x,y,'b',x(1),y(1),'b')
    fill(xhead,yhead,'b')
    grid on
    vlabel=a'+h/10*[cos(th) sin(th) ];
    vname=['V1'];
    text(vlabel(1),vlabel(2),vname);
    shg
    xlabel('press enter to view the next vector or to terminate the program')
    pause



%viewvectors(b);shg
%text(b(1)+.5,b(2)+.8,'V2');
%pause


%  create the head of b
    
    [th,r] = cart2pol(b(1),b(2));
    vheadr=b'-h/20*[cos(th+pi/8) sin(th+pi/8) ];
    vheadl=b'-h/20*[cos(th-pi/8) sin(th-pi/8) ];
    xhead=[vheadr(1) b(1) vheadl(1)];
    yhead=[vheadr(2) b(2) vheadl(2)];
    
    % plot the vector b, its head (arrow) and tail (fat point)
    
    x=[0 b(1)];
    y=[0 b(2)];
    plot(x,y,'g',x(1),y(1),'g')
    fill(xhead,yhead,'g')
    grid on
    vlabel=b'+h/10*[cos(th) sin(th) ];
    vname=['V2'];
    text(vlabel(1),vlabel(2),vname);
    shg
    xlabel('press enter to view the next vector or to terminate the program')
    pause


c=dot(a,b)/dot(b,b)*b;
%viewvectors([a b -10*b 10*b c]);shg
%text(c(1)-.5,c(2)-.8,'proj of V1 onto V2');

%create the head of c
    
    [th,r] = cart2pol(c(1),c(2));
    vheadr=c'-h/20*[cos(th+pi/8) sin(th+pi/8) ];
    vheadl=c'-h/20*[cos(th-pi/8) sin(th-pi/8) ];
    xhead=[vheadr(1) c(1) vheadl(1)];
    yhead=[vheadr(2) c(2) vheadl(2)];
    
    % plot the vector c, its head (arrow) and tail (fat point)
    
    x=[0 c(1)];
    y=[0 c(2)];
    plot(x,y,'m',x(1),y(1),'m')
    fill(xhead,yhead,'m')
    grid on
    vlabel=c'+h/10*[cos(th) sin(th) ];
    vname=['proj of V1 onto V2'];
    text(vlabel(1)-2,vlabel(2)-1,vname);
    shg
    xlabel('press enter to view the next vector or to terminate the program')
    pause


axis([-h h -h h])
return