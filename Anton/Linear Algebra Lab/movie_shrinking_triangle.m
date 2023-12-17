%
% m-file to watch a move of a shrinking triangle.
% author: Dan Seth, WTAMU, 2009. Revised fall 2013.
%
x=[-.5 0 .5 -.5];
y=[-1 1 -1 -1];
t=[x;y];

%dialation matrix, shrinking type

d=.95*eye(2);
clf
p=line(t(1,:),t(2,:),'erasemode','xor');shg
axis([-1.20 1.20 -1.20 1.20]);shg
axis('square');shg
figure(gcf)
hold on

%shrink the triangle 20 times by multiple .95 to (.95)^10

for i=1:20
    t=d*t;
    set(p,'xdata',t(1,:),'ydata',t(2,:));
    pause(.05)
end
hold off