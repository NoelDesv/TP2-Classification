clear all;
load sim_data_set;

%Options ------------------------------
opt.disp = 1;
    %op.disp = 1 -> affichage des nuages de points
%--------------------------------------

%Corps --------------------------------
%Initialisation -----
R = R(R(:,3)==1|R(:,3)==2|R(:,3)==3,:);
[X1, X2, X3, X4] = select_data(R, opt);
X = R(:,1:2);
T = classes2oneofK(R(:,3));
% -------------------

[w,ersub]=fitcls(X,T);
%--------------------------------------