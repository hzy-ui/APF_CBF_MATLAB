%run this file after run the 'Omnidirectional_robot_obstacle_avoidance'or
%'Multi_Omnidirectional_robot_V3'
figure(1)
load('matlab.mat');
% load('playground.mat','x3','y3','x4','y4','x5','y5');
[x1,y1]=circle(60,85,12);
[x2,y2]=circle(20,80,8);
[x3,y3]=circle(50,50,15);
[x4,y4]=circle(90,90,10);
[x5,y5]=circle(0,100,10);
[x6,y6]=circle(100,0,10);
[x7,y7]=circle(0,0,10);
plot(x1,y1,'r--','LineWidth',1.5)
hold on
plot(x2,y2,'r--','LineWidth',1.5)
hold on
plot(x3,y3,'r','LineWidth',1.5)
hold on
plot(x4,y4,'k','LineWidth',1.5)
hold on
plot(x5,y5,'k','LineWidth',1.5)
hold on 
plot(x6,y6,'k','LineWidth',1.5)
hold on 
plot(x7,y7,'k','LineWidth',1.5)
grid on 

h = animatedline('Color','r','LineWidth',1.5);
h1 = animatedline('Color','b','LineWidth',1.5);
h2 = animatedline('Color','k','LineWidth',1.5);
h3 = animatedline('Color','k','LineWidth',1.5);
h4 = animatedline('Color','k','LineWidth',1.5);
axis([-10,120,-10,120])
for k=1:length(out.x1.time)
addpoints(h,out.x1.signals.values(k),out.x2.signals.values(k))
drawnow
% addpoints(h1,out.x1_agent2.signals.values(k),out.x2_agent2.signals.values(k))
% drawnow
% addpoints(h2,out.x1_agent3.signals.values(k),out.x2_agent3.signals.values(k))
% drawnow
% addpoints(h3,out.centerjk_agent1.signals(1).values(k),out.centerjk_agent1.signals(2).values(k))
% drawnow
% addpoints(h4,out.centerjk_agent2.signals(1).values(k),out.centerjk_agent2.signals(2).values(k))
% drawnow
 end
