clc;
clear;
figure(1)
%load('V3_collide.mat');
% load('playground.mat','x9','y9','x10','y10')
center1=[50;50];
center2=[0;25];
[x9,y9]=circle(center1(1,1),center1(2,1),15);
[x10,y10]=circle(center2(1,1),center2(2,1),10);
plot(x9,y9,'--r','LineWidth',1.5)
hold on
plot(x10,y10,'--r','LineWidth',1.5)
grid on 
axis([-40,40,0,40])
cov1=[x9';x10'];
cov2=[y9';y10'];
con=[cov1,cov2];
k = convhull(con);

k_im=[];
    j=1;
for i=1:(length(k)-1)
    while abs(k(i+1)-k(i))>1
        k_im(j,:)=k(i);
         k_im(j+1,:)=k(i+1);
        j=j+2;
       break
    end    
end
select_point = [];m=1;
for i=1:2:(length(k_im)-1)
    if (con(k_im(i+1),1)~= con(k_im(i),1) || con(k_im(i+1),2)~= con(k_im(i),2))&& sqrt( (con(k_im(i+1),1)- con(k_im(i),1))^2+ (con(k_im(i+1),2)-con(k_im(i),2))^2  )>0.5
        select_point(m,1)=con(k_im(i),1) ;
        select_point(m,2)=con(k_im(i),2) ;
        select_point(m+1,1)=con(k_im(i+1),1) ;
        select_point(m+1,2)=con(k_im(i+1),2) ;
        m=m+2;
    end
%      select_point=unique(select_point);
%     if length(select_point)>4
%         select_point=select_point(1:4,:);
%     end
end   

hold on
convexhull=[con(k,1),con(k,2)];
plot(con(k,1),con(k,2));


hold on
for i=1:4
scatter(select_point(i,1),select_point(i,2));
end



a=select_point(1,:);
b=select_point(2,:);
line(select_point(3:4,1),select_point(3:4,2))

p0 = [20 ; 15];
for i=1:length(k)
distance(i)=norm(p0-[con(k(i),1);con(k(i),2)]);
end
min_distance=min(distance);

if min_distance==norm(p0-select_point(1,:)')||min_distance==norm(p0-select_point(2,:)')
    disp('12');
    p1 = select_point(1,:)';
    p2 = select_point(2,:)';
    d = abs(det([p2-p1,p0-p1]))/norm(p2-p1);
    slope=(p2(2,1)-p1(2,1))/(p2(1,1)-p1(1,1)+0.00001);
    A=slope;B=-1;C=p1(2,1)-p1(1,1)*slope;
    xp1=(B^2*p0(1,1)-A*B*p0(2,1)-A*C)/(A^2+B^2);
    xp2=(A^2*p0(2,1)-A*B*p0(1,1)-B*C)/(A^2+B^2);
    x_p=[xp1;xp2];
    hold on
    scatter(p0(1,1),p0(2,1))
    hold on
    scatter(xp1,xp2);

    A1=-1/A; B1=-1; C1=p0(2,1)-p0(1,1)*A1;
    slope_center=(center2(2,1)-center1(2,1))/(center2(1,1)-center1(1,1)+0.0000001);
    Ac=slope_center;Bc=-1;Cc=center1(2,1)-center1(1,1)*slope_center;
    cjk1=(Bc*C1-B1*Cc)/(Ac*B1-Bc*A1);
    cjk2=(-A1*cjk1-C1)/B1;
    cjk=[cjk1;cjk2];
    d_to_center_jk= abs(det([p2-p1,cjk-p1]))/norm(p2-p1);
    [xjk,yjk]=circle(cjk1,cjk2,d_to_center_jk );
    hold on
    plot(xjk,yjk,'--b','LineWidth',1.5)
%     [in,on] = inpolygon(p0(1,1),p0(2,1),con(k,1),con(k,2));
elseif  min_distance==norm(p0-select_point(3,:)')||min_distance==norm(p0-select_point(4,:)')
    disp('34');
    p1 =select_point(3,:)';
    p2 = select_point(4,:)';
    d = abs(det([p2-p1,p0-p1]))/norm(p2-p1);
    slope=(p2(2,1)-p1(2,1))/(p2(1,1)-p1(1,1)+0.00001);
    A=slope;B=-1;C=p1(2,1)-p1(1,1)*slope;
    xp1=(B^2*p0(1,1)-A*B*p0(2,1)-A*C)/(A^2+B^2);
    xp2=(A^2*p0(2,1)-A*B*p0(1,1)-B*C)/(A^2+B^2);
    x_p=[xp1;xp2];
    hold on
    scatter(p0(1,1),p0(2,1))
    hold on
    scatter(xp1,xp2);

    A1=-1/A; B1=-1; C1=p0(2,1)-p0(1,1)*A1;
    slope_center=(center2(2,1)-center1(2,1))/(center2(1,1)-center1(1,1)+0.0000001);
    Ac=slope_center;Bc=-1;Cc=center1(2,1)-center1(1,1)*slope_center;
    cjk1=(Bc*C1-B1*Cc)/(Ac*B1-Bc*A1);
    cjk2=(-A1*cjk1-C1)/B1;
    cjk=[cjk1;cjk2];
    d_to_center_jk= abs(det([p2-p1,cjk-p1]))/norm(p2-p1);
    [xjk,yjk]=circle(cjk1,cjk2,d_to_center_jk );
    hold on
    plot(xjk,yjk,'--b','LineWidth',1.5)
%     [in,on] = inpolygon(p0(1,1),p0(2,1),con(k,1),con(k,2));


else
    disp('No');
    scatter(p0(1,1),p0(2,1));
end

    

%  disp('hshshs')
% d_to_center_jk = abs(det([center2-center1,x_p-center1]))/norm(center2-center1);
% slope_center=(center2(2,1)-center1(2,1))/(center2(1,1)-center1(1,1)+0.0000001);
% Ac=slope_center;Bc=-1;Cc=center1(2,1)-center1(1,1)*slope_center;
% cjk1=(Bc^2*x_p(1,1)-Ac*Bc*x_p(2,1)-Ac*Cc)/(Ac^2+Bc^2);
% cjk2=(Ac^2*x_p(2,1)-Ac*Bc*x_p(1,1)-Bc*Cc)/(Ac^2+Bc^2);
% cjk=[cjk1;cjk2];
% [xjk,yjk]=circle(cjk1,cjk2,d_to_center_jk );
% hold on
% plot(xjk,yjk,'--b','LineWidth',1.5)



% 
% scatter(xp1,xp2);
% x_p= ( (B^2*p0(1,1)-A*B*p0(2,1)-A*C)/(A^2+B^2), (A^2*p0(2,1)-A*B*p0(1,1)-B*C)/(A^2+B^2) );
