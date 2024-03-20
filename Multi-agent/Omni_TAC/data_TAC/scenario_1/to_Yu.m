%run this file after run the 'Omnidirectional_robot_obstacle_avoidance'or
%'Multi_Omnidirectional_robot_V3'
figure(1)
load('scenario_1_2pro.mat');
% load('playground.mat','x3','y3','x5','y5');
[x1,y1]=circle(110,100,10);
[x2,y2]=circle(50,0,10);
[x3,y3]=circle(50,50,15);
[x4,y4]=circle(100,100,10);
[x5,y5]=circle(0,100,10);
[x6,y6]=circle(100,0,10);
[x7,y7]=circle(0,0,10);
[x8,y8]=circle(0,70,10);
% plot(x1,y1,'r--','LineWidth',1.5)
% hold on
plot(x1,y1,'k','LineWidth',1.5)
hold on
plot(x2,y2,'k','LineWidth',1.5)
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
hold on
plot(x8,y8,'k','LineWidth',1.5)
grid on 

h = animatedline('Color','r','LineWidth',1.5,'MaximumNumPoints',60);
h1 = animatedline('Color','b','LineWidth',1.5,'MaximumNumPoints',60);
h2 = animatedline('Color','k','LineWidth',1.5,'MaximumNumPoints',60);
h3 = animatedline('Color','b','LineWidth',1.5,'MaximumNumPoints',60);
h4 = animatedline('Color','g','LineWidth',1.5,'MaximumNumPoints',60);
h5 = animatedline('Color','r','LineWidth',1.5,'MaximumNumPoints',60);
axis([-10,120,-10,120])
for k=1:length(out.agent1_x1.time)
addpoints(h,out.agent1_x1.signals.values(k),out.agent1_x2.signals.values(k))
drawnow
addpoints(h1,out.agent2_x1.signals.values(k),out.agent2_x2.signals.values(k))
drawnow
addpoints(h2,out.agent3_x1.signals.values(k),out.agent3_x2.signals.values(k))
drawnow
addpoints(h3,out.agent4_x1.signals.values(k),out.agent4_x2.signals.values(k))
drawnow
addpoints(h4,out.agent5_x1.signals.values(k),out.agent5_x2.signals.values(k))
drawnow
addpoints(h5,out.track.signals(1).values(k),out.track.signals(2).values(k))
drawnow
% addpoints(h3,out.x1_agent2.signals.values(k),out.x2_agent2.signals.values(k))
% drawnow
% addpoints(h2,out.x1_agent3.signals.values(k),out.x2_agent3.signals.values(k))
% drawnow
% addpoints(h3,out.centerjk_agent1.signals(1).values(k),out.centerjk_agent1.signals(2).values(k))
% drawnow
% addpoints(h4,out.centerjk_agent2.signals(1).values(k),out.centerjk_agent2.signals(2).values(k))
% drawnow
MakeGif('scenerio1.Gif',k)
 end
