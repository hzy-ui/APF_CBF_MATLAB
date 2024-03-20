%run this after run the Omnidirectional_robot_V3 file
load('scenario_1_2pro.mat');

%% Figure 1
figure(1)
[x1,y1]=circle(110,100,10);
[x2,y2]=circle(50,0,10);
[x3,y3]=circle(50,50,15);
[x4,y4]=circle(100,100,10);
[x5,y5]=circle(0,100,10);
[x6,y6]=circle(100,0,10);
% [x7,y7]=circle(0,0,10);
[x8,y8]=circle(0,70,10);
plot(x1,y1,'r','LineWidth',1.5)
hold on
plot(x2,y2,'r','LineWidth',1.5)
hold on
plot(x3,y3,'r','LineWidth',1.5)
hold on
plot(x4,y4,'r','LineWidth',1.5)
hold on
plot(x5,y5,'r','LineWidth',1.5)
hold on 
plot(x6,y6,'r','LineWidth',1.5)
hold on 
% plot(x7,y7,'r','LineWidth',1.5)
% hold on 
plot(x8,y8,'r','LineWidth',1.5)
hold on 
agent1=plot(out.agent1_x1.signals.values,out.agent1_x2.signals.values  ,'-k','LineWidth',1.5);
agent2=plot(out.agent2_x1.signals.values,out.agent2_x2.signals.values  ,'-b','LineWidth',1.5);
agent3=plot(out.agent3_x1.signals.values,out.agent3_x2.signals.values  ,'-g','LineWidth',1.5);
agent4=plot(out.agent4_x1.signals.values,out.agent4_x2.signals.values  ,'-c','LineWidth',1.5);
agent5=plot(out.agent5_x1.signals.values,out.agent5_x2.signals.values  ,'-m','LineWidth',1.5);
grid on
label1_1='$traj(\mbox{\boldmath $p$} _{1})$';
label1_2='$traj(\mbox{\boldmath $p$} _{2})$';
label1_3='$traj(\mbox{\boldmath $p$} _{3})$';
label1_4='$traj(\mbox{\boldmath $p$} _{4})$';
label1_5='$traj(\mbox{\boldmath $p$} _{5})$';
legend([agent1,agent2,agent3,agent4,agent5], {label1_1,label1_2,label1_3,label1_4,label1_5},'FontSize',12,'Interpreter','latex','Location','north','NumColumns',2);
legend('boxoff')
xlim([-10 120]);
ylim([-10 120]);
set(gcf,'Position',[0 0 600 500])


%% Figure 2
figure(2)    
flag=0;

if flag==0
    j=1; a=[];b=[];b1=[];
    for i=1:4001
        if out.agent1_x1.time(i)>=20
            a(j)= out.agent1_x1.time(i);
            b(j)=  out.agent5_gamma_yita2.signals(1).values(i);
            b1(j)= out.agent5_gamma_yita2.signals(2).values(i);
            j=j+1;
    end       

end

plot(a,b,'b','LineWidth',1.5); %gamma
hold on
plot(a,b1,'k','LineWidth',1.5);%h
else

plot(out.agent4_x1.time,out.agent5_gamma_and_h.signals(1).values  ,'b','LineWidth',1.5); %gamma
hold on
plot(out.agent4_x1.time,out.agent5_gamma_and_h.signals(2).values  ,'k','LineWidth',1.5);%h
end

grid on
label2_1='$\gamma (t)$';
label2_2='$h(\mbox{\boldmath $x$})$';
legend(label2_1,label2_2,'FontSize',12,'Interpreter','latex');
legend('boxoff')
legend('Location','southeast');
xlabel('Time $(s)$','Interpreter','latex','FontSize',8,'FontName','Times New Roman')
ylim([-150 35]);
set(gcf,'Position',[100 100 500 200])


%%  Figure 3 Distance1
figure(3)
hold on
D1_2=plot(out.D1_2.time,out.D1_2.signals.values,'-k','LineWidth',1.5);
D1_3=plot(out.D1_3.time,out.D1_3.signals.values,'-g','LineWidth',1.5);
D1_4=plot(out.D1_4.time,out.D1_4.signals.values,'-b','LineWidth',1.5);
D1_5=plot(out.D1_5.time,out.D1_5.signals.values,'-m','LineWidth',1.5);
% hold on
% plot(out.U3.time,out.U3.signals(2).values,'r','LineWidth',1.5);
% hold on
% plot(out.U3.time,out.U3.signals(3).values,'b','LineWidth',1.5);
 grid on
label3_1='$dist(\mbox{\boldmath $p$} _{1},\mbox{\boldmath $p$} _{2})$';
label3_2='$dist(\mbox{\boldmath $p$} _{1},\mbox{\boldmath $p$} _{3})$';
label3_3='$dist(\mbox{\boldmath $p$} _{1},\mbox{\boldmath $p$} _{4})$';
label3_4='$dist(\mbox{\boldmath $p$} _{1},\mbox{\boldmath $p$} _{5})$';
legend([D1_2,D1_3,D1_4,D1_5], {label3_1,label3_2,label3_3,label3_4},'FontSize',12,'Interpreter','latex','Location','northoutside','NumColumns',2);
legend('boxon')
xlabel('Time $(s)$','Interpreter','latex','FontSize',8,'FontName','Times New Roman')
ylim([0 120]);
set(gcf,'Position',[100 100 500 300])

%% Figure 4 Distance2
figure(4)
hold on
D2_1=plot(out.D1_2.time,out.D1_2.signals.values,'-k','LineWidth',1.5);
D2_3=plot(out.D2_3.time,out.D2_3.signals.values,'-g','LineWidth',1.5);
D2_4=plot(out.D2_4.time,out.D2_4.signals.values,'-b','LineWidth',1.5);
D2_5=plot(out.D2_5.time,out.D2_5.signals.values,'-m','LineWidth',1.5);
% hold on
% plot(out.U3.time,out.U3.signals(2).values,'r','LineWidth',1.5);
% hold on
% plot(out.U3.time,out.U3.signals(3).values,'b','LineWidth',1.5);
 grid on
label4_1='$dist(\mbox{\boldmath $p$} _{2},\mbox{\boldmath $p$} _{1})$';
label4_2='$dist(\mbox{\boldmath $p$} _{2},\mbox{\boldmath $p$} _{3})$';
label4_3='$dist(\mbox{\boldmath $p$} _{2},\mbox{\boldmath $p$} _{4})$';
label4_4='$dist(\mbox{\boldmath $p$} _{2},\mbox{\boldmath $p$} _{5})$';
legend([D2_1,D2_3,D2_4,D2_5], {label4_1,label4_2,label4_3,label4_4},'FontSize',12,'Interpreter','latex','Location','northoutside','NumColumns',2);
legend('boxon')
xlabel('Time $(s)$','Interpreter','latex','FontSize',8,'FontName','Times New Roman')
ylim([0 150]);
set(gcf,'Position',[100 100 500 300])

%% Figure 5 Distance3
figure(5)
hold on
D3_1=plot(out.D1_3.time,out.D1_3.signals.values,'-k','LineWidth',1.5);
D3_2=plot(out.D2_3.time,out.D2_3.signals.values,'-g','LineWidth',1.5);
D3_4=plot(out.D3_4.time,out.D3_4.signals.values,'-b','LineWidth',1.5);
D3_5=plot(out.D3_5.time,out.D3_5.signals.values,'-m','LineWidth',1.5);
% hold on
% plot(out.U3.time,out.U3.signals(2).values,'r','LineWidth',1.5);
% hold on
% plot(out.U3.time,out.U3.signals(3).values,'b','LineWidth',1.5);
 grid on
label5_1='$dist(\mbox{\boldmath $p$} _{3},\mbox{\boldmath $p$} _{1})$';
label5_2='$dist(\mbox{\boldmath $p$} _{3},\mbox{\boldmath $p$} _{2})$';
label5_3='$dist(\mbox{\boldmath $p$} _{3},\mbox{\boldmath $p$} _{4})$';
label5_4='$dist(\mbox{\boldmath $p$} _{3},\mbox{\boldmath $p$} _{5})$';
legend([D3_1,D3_2,D3_4,D3_5], {label5_1,label5_2,label5_3,label5_4},'FontSize',12,'Interpreter','latex','Location','northoutside','NumColumns',2);
legend('boxon')
xlabel('Time $(s)$','Interpreter','latex','FontSize',8,'FontName','Times New Roman')
ylim([0 120]);
set(gcf,'Position',[100 100 500 300])

%% Figure 6 Distance4
figure(6)
hold on
D4_1=plot(out.D1_4.time,out.D1_4.signals.values,'-k','LineWidth',1.5);
D4_2=plot(out.D2_4.time,out.D2_4.signals.values,'-g','LineWidth',1.5);
D4_3=plot(out.D3_4.time,out.D3_4.signals.values,'-b','LineWidth',1.5);
D4_5=plot(out.D4_5.time,out.D4_5.signals.values,'-m','LineWidth',1.5);
% hold on
% plot(out.U3.time,out.U3.signals(2).values,'r','LineWidth',1.5);
% hold on
% plot(out.U3.time,out.U3.signals(3).values,'b','LineWidth',1.5);
 grid on
label6_1='$dist(\mbox{\boldmath $p$} _{4},\mbox{\boldmath $p$} _{1})$';
label6_2='$dist(\mbox{\boldmath $p$} _{4},\mbox{\boldmath $p$} _{2})$';
label6_3='$dist(\mbox{\boldmath $p$} _{4},\mbox{\boldmath $p$} _{3})$';
label6_4='$dist(\mbox{\boldmath $p$} _{4},\mbox{\boldmath $p$} _{5})$';
legend([D4_1,D4_2,D4_3,D4_5], {label6_1,label6_2,label6_3,label6_4},'FontSize',12,'Interpreter','latex','Location','northoutside','NumColumns',2);
legend('boxon')
xlabel('Time $(s)$','Interpreter','latex','FontSize',8,'FontName','Times New Roman')
ylim([0 120]);
set(gcf,'Position',[100 100 500 300])

