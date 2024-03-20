function [center_jk1, center_jk2, R_jk,flg_jk]=compute_convex_hull(x1,x2,center1_1, center1_2, center2_1, center2_2, R1, R2)
center1=[center1_1;center1_2];
center2=[center2_1;center2_2];
[xc1,yc1]=circle(center1(1,1),center1(2,1),R1);
[xc2,yc2]=circle(center2(1,1),center2(2,1),R2);
cov1=[xc1';xc2'];
cov2=[yc1';yc2'];
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

end   




p0 = [x1 ; x2];
for i=1:length(k)
distance(i)=norm(p0-[con(k(i),1);con(k(i),2)]);
end
min_distance=min(distance);

if min_distance==norm(p0-select_point(1,:)')||min_distance==norm(p0-select_point(2,:)')
  %  disp('12');
    p1 = select_point(1,:)';
    p2 = select_point(2,:)';
    d = abs(det([p2-p1,p0-p1]))/norm(p2-p1);
    slope=(p2(2,1)-p1(2,1))/(p2(1,1)-p1(1,1)+0.00001);
    A=slope;B=-1;C=p1(2,1)-p1(1,1)*slope;
    xp1=(B^2*p0(1,1)-A*B*p0(2,1)-A*C)/(A^2+B^2);
    xp2=(A^2*p0(2,1)-A*B*p0(1,1)-B*C)/(A^2+B^2);
    x_p=[xp1;xp2];

    A1=-1/A; B1=-1; C1=p0(2,1)-p0(1,1)*A1;
    slope_center=(center2(2,1)-center1(2,1))/(center2(1,1)-center1(1,1)+0.0000001);
    Ac=slope_center;Bc=-1;Cc=center1(2,1)-center1(1,1)*slope_center;
    cjk1=(Bc*C1-B1*Cc)/(Ac*B1-Bc*A1);
    cjk2=(-A1*cjk1-C1)/B1;
    cjk=[cjk1;cjk2];
    d_to_center_jk= abs(det([p2-p1,cjk-p1]))/norm(p2-p1);
    center_jk1=cjk1;
    center_jk2=cjk2;
    R_jk=d_to_center_jk;
    flg_jk=1;

elseif  min_distance==norm(p0-select_point(3,:)')||min_distance==norm(p0-select_point(4,:)')
%     disp('34');
    p1 =select_point(3,:)';
    p2 = select_point(4,:)';
    d = abs(det([p2-p1,p0-p1]))/norm(p2-p1);
    slope=(p2(2,1)-p1(2,1))/(p2(1,1)-p1(1,1)+0.00001);
    A=slope;B=-1;C=p1(2,1)-p1(1,1)*slope;
    xp1=(B^2*p0(1,1)-A*B*p0(2,1)-A*C)/(A^2+B^2);
    xp2=(A^2*p0(2,1)-A*B*p0(1,1)-B*C)/(A^2+B^2);
    x_p=[xp1;xp2];

    A1=-1/A; B1=-1; C1=p0(2,1)-p0(1,1)*A1;
    slope_center=(center2(2,1)-center1(2,1))/(center2(1,1)-center1(1,1)+0.0000001);
    Ac=slope_center;Bc=-1;Cc=center1(2,1)-center1(1,1)*slope_center;
    cjk1=(Bc*C1-B1*Cc)/(Ac*B1-Bc*A1);
    cjk2=(-A1*cjk1-C1)/B1;
    cjk=[cjk1;cjk2];
    d_to_center_jk= abs(det([p2-p1,cjk-p1]))/norm(p2-p1);
    center_jk1=cjk1;
    center_jk2=cjk2;
    R_jk=d_to_center_jk;
    flg_jk=1;

else
%     disp('No');
    center_jk1=0;
    center_jk2=0;
    R_jk=0;
    flg_jk=0;
end