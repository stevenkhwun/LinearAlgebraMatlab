%
% m-file to watch a movie of a growing and shrinking triangle.
% author: Dan Seth, WTAMU, 2009. Revised fall 2013.
%
x=[-.5 0 .5 -.5];
y=[-1 1 -1 -1];
t=[x;y];
theta=pi/20;
%r=[sin(theta) -cos(theta);cos(theta) sin(theta)];
%dialation matrix, shrinking type
ds=.95*eye(2);
clf
p=line(t(1,:),t(2,:),'erasemode','xor');shg
axis([-1.20 1.20 -1.20 1.20]);shg
axis('square');shg
figure(gcf)
hold on
%shrink the triangle
for i=1:35
    t=ds*t;
    set(p,'xdata',t(1,:),'ydata',t(2,:));
    pause(.05)
end
% dialation matrix, growing variety
dg=1.1*eye(2);
% grow the triangle back
for i=1:19
    t=dg*t;
    set(p,'xdata',t(1,:),'ydata',t(2,:));
    pause(.05)
end
hold off