%run this after run the Omnidirectional_robot_V3 file
figure(1)
load('scenario2.mat');
[x1,y1]=circle(0,30,5);
[x2,y2]=circle(50,0,10);
[x3,y3]=circle(0,0,30);
plot(x1,y1,'k-','LineWidth',1.5)
hold on
plot(x2,y2,'k-','LineWidth',1.5)
hold on
agent1=plot(out.x1.signals.values,out.x2.signals.values  ,'-r','LineWidth',1.5);
hold on
label1_1='$traj(\mbox{\boldmath $p$}_{1})$';
legend([agent1], {label1_1},'FontSize',12,'Interpreter','latex');
 legend('boxoff')
xlim([-60 60]);
ylim([-60 60]);
grid on
set(gcf,'Position',[0 0 300 250])

figure(2)
plot(out.gamma_h_tracking.time,out.gamma_h_tracking.signals(1).values,'b','LineWidth',1.5); %yita
hold on
plot(out.gamma_h_tracking.time,out.gamma_h_tracking.signals(2).values,'k','LineWidth',1.5);%h
grid on
label2_1='$\gamma (t)$';
label2_2='$h(\mbox{\boldmath $x$})$';
legend(label2_1,label2_2,'FontSize',12,'Interpreter','latex');
legend('boxoff')
legend('Location','southeast');
xlabel('Time $(s)$','Interpreter','latex','FontSize',8,'FontName','Times New Roman')
set(gcf,'Position',[100 100 500 200])

figure(3)
plot(out.gamma_h_visiting.time,out.gamma_h_visiting.signals(1).values,'b','LineWidth',1.5); %yita
hold on
plot(out.gamma_h_visiting.time,out.gamma_h_visiting.signals(2).values,'k','LineWidth',1.5);%h
grid on
label2_1='$\gamma (t)$';
label2_2='$h(\mbox{\boldmath $x$})$';
legend(label2_1,label2_2,'FontSize',12,'Interpreter','latex');
legend('boxoff')
legend('Location','northwest');
xlabel('Time $(s)$','Interpreter','latex','FontSize',8,'FontName','Times New Roman')
ylim([-70 20]);
set(gcf,'Position',[100 100 500 200])

% 
figure(4)
plot(out.U3.time,out.U3.signals(1).values,'g','LineWidth',1.5);
hold on
plot(out.U3.time,out.U3.signals(2).values,'r','LineWidth',1.5);
hold on
plot(out.U3.time,out.U3.signals(3).values,'b','LineWidth',1.5);
grid on
label3_1='$u_{1} $';
label3_2='$u_{2} $';
label3_3='$u_{3} $';
legend(label3_1,label3_2,label3_3,'FontSize',12,'Interpreter','latex');
% legend('boxoff')
xlabel('Time $(s)$','Interpreter','latex','FontSize',8,'FontName','Times New Roman')
ylim([-2600 2600]);
set(gcf,'Position',[100 100 500 200])
% 
% figure(4) %distance
% plot(out.D5_1.time,out.D5_1.signals.values ,'g','LineWidth',1.5);
% hold on
% plot(out.D5_2.time,out.D5_2.signals.values,'r','LineWidth',1.5);
% hold on
% plot(out.D5_3.time,out.D5_3.signals.values,'b','LineWidth',1.5);
% hold on
% plot(out.D5_4.time,out.D5_4.signals.values,'m','LineWidth',1.5);
% hold on
% grid on
% label4_1='$dist(x_5^d,x_1^d ) $';
% label4_2='$dist(x_5^d,x_2^d )$';
% label4_3='$dist(x_5^d,x_3^d ) $';
% label4_4='$dist(x_5^d,x_4^d ) $';
% legend(label4_1,label4_2,label4_3,label4_4,'FontSize',12,'Interpreter','latex');
% legend('boxoff')
% xlabel('Time $(s)$','Interpreter','latex','FontSize',8,'FontName','Times New Roman')
% ylim([0 90]);