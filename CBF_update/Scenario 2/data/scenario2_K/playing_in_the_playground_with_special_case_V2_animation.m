%run this file after run the 'Omnidirectional_robot_special_case_V2,V3'
figure(1)
load('scenario2_v9.mat');
[x1,y1]=circle(0,23,6);
[x2,y2]=circle(50,0,15);
[x3,y3]=circle(0,0,30);
plot(x1,y1,'r','LineWidth',1.5)
hold on
plot(x2,y2,'k','LineWidth',1.5)
hold on
plot(x3,y3,'--g','LineWidth',1.5)
grid on 

h = animatedline('Color','r','LineWidth',1.5,'MaximumNumPoints',30);
h1 = animatedline('Color','b','LineWidth',1.5,'MaximumNumPoints',30);
h2 = animatedline('Color','r','LineWidth',1.5,'MaximumNumPoints',30);
h3 = animatedline('Color','b','LineWidth',1.5,'MaximumNumPoints',50);
h4 = animatedline('Color','r','LineWidth',1.5,'MaximumNumPoints',30);
h5 = animatedline('Color','b','LineWidth',1.5,'MaximumNumPoints',30);
h6 = animatedline('Color','r','LineWidth',1.5,'MaximumNumPoints',30);
h7 = animatedline('Color','b','LineWidth',1.5,'MaximumNumPoints',30);
h8 = animatedline('Color','k','LineWidth',1.5,'MaximumNumPoints',30);
% h2 = animatedline('Color','k','LineWidth',1.5);
axis([-60,60,-60,60])
for k=1:length(out.L1.time )
addpoints(h,out.L1.signals.values(k),out.L2.signals.values(k))
drawnow
addpoints(h1,out.x1.signals.values(k),out.x2.signals.values(k))
drawnow
% addpoints(h2,out.agent2_L1.signals.values(k),out.agent2_L2.signals.values(k))
% drawnow
% addpoints(h3,out.agent2_x1.signals.values(k),out.agent2_x2.signals.values  (k))
% drawnow
% addpoints(h4,out.agent3_L1.signals.values(k),out.agent3_L2.signals.values(k))
% drawnow
% addpoints(h5,out.agent3_x1.signals.values(k),out.agent3_x2.signals.values  (k))
% drawnow
% addpoints(h6,out.agent4_L1.signals.values(k),out.agent4_L2.signals.values(k))
% drawnow
% addpoints(h7,out.agent4_x1.signals.values(k),out.agent4_x2.signals.values  (k))
% drawnow
% addpoints(h8,out.agent5_x1.signals.values(k),out.agent5_x2.signals.values(k))
% drawnow
% addpoints(h2,out.x1_agent3.signals.values(k),out.x2_agent3.signals.values(k))
% drawnow

 end