%
% m-file to watch a movie of a growing triangle.
% author: Dan Seth, WTAMU, 2009. Revised fall 2013.
% 

x=[-.5 0 .5 -.5];
y=[-1 1 -1 -1];
t=[x;y];

%dialation matrix, Growing type

dg=1.25*eye(2);
clf
p=line(t(1,:),t(2,:),'erasemode','xor');shg
axis([-10 10 -10 10]);shg
axis('square');shg
figure(gcf)
hold on

%shrink the triangle 10 times by multiple 1.25 to (1.25)^10

for i=1:10
    t=dg*t;
    set(p,'xdata',t(1,:),'ydata',t(2,:));
    pause(.05)
end
hold off