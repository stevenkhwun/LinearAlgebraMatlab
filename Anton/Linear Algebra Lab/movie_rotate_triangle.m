%
% m-file to watch a movie of a rotating triangle.
% author: Dan Seth, WTAMU, 2009. Revised fall 2013.
%

x=[-.5 0 .5 -.5];
y=[-1 1 -1 -1];
t=[x;y];

theta=pi/20;
clf
r=[cos(theta) -sin(theta);sin(theta) cos(theta)];
p=line(t(1,:),t(2,:),'erasemode','xor');shg
axis([-2 2 -2 2]);shg
axis('square');shg
figure(gcf)
hold on
for i=1:20
t=r*t;
set(p,'xdata',t(1,:),'ydata',t(2,:));
pause(.05)
end
hold off