clear all;
load sim_data_set;

%Options ------------------------------
opt.disp = 1;
    %op.disp = 1 -> affichage des nuages de points
%--------------------------------------

%Corps --------------------------------
%Initialisation -----
%Binary classifier
%R = R(R(:,3)==1|R(:,3)==2,:);
%------------------
%3 K classifier
%R = R(R(:,3)==1|R(:,3)==2|R(:,3)==3,:);
%------------------
%Pour Question f en classification binaire
%Ajout de 10 points (0,5) avec K=1
for ii=0:10
    Aj(ii+1,1)=0.2*rand+-0.2;
    Aj(ii+1,2)=0.2*rand+0.2;
    Aj(ii+1,3)=1;
end
R=[R;Aj];
%--------------------------------------
[X1, X2, X3, X4] = select_data(R, opt);
X = R(:,1:2);
T = classes2oneofK(R(:,3));
% -------------------
[w,ersub]=fitcls(X,T);
%--------------Question e-------------------
%f=@(x,y) w(1,1)-w(2,1)+(w(1,2)-w(2,2))*x+(w(1,3)-w(2,3))*y;
%fc=fcontour(f);
%fc.LevelList = 0;
%--------------Question f--------------------
%Entre K=1 et K=2
f1=@(x,y) w(1,1)-w(2,1)+(w(1,2)-w(2,2))*x+(w(1,3)-w(2,3))*y;
fc1=fcontour(f1);
fc1.LevelList = 0;
%Entre K=1 et K=3
f2=@(x,y) w(1,1)-w(3,1)+(w(1,2)-w(3,2))*x+(w(1,3)-w(3,3))*y;
fc2=fcontour(f2);
fc2.LevelList = 0;
%Entre K=2 et K=3
f3=@(x,y) w(2,1)-w(3,1)+(w(2,2)-w(3,2))*x+(w(2,3)-w(3,3))*y;
fc3=fcontour(f3);
fc3.LevelList = 0;
%%%%%
plotdecr(w,min(X(:,1))-1,max(X(:,1))+1,min(X(:,2))-1,max(X(:,2))+1,1000);
